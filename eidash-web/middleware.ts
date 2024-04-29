import { NextRequest, NextResponse } from "next/server";

const API_BASE = process.env.API_BASE;

const protectedRoutes = ["/"];

export default async function middleware(req: NextRequest) {
  const path = req.nextUrl.pathname;
  const isProtectedRoute = protectedRoutes.includes(path);
  if (!isProtectedRoute) {
    return NextResponse.next();
  }

  const sessionCookie = req.cookies.get("__eidash_session");
  if (!sessionCookie) {
    return NextResponse.redirect(new URL("/api/oidc/login", req.url));
  }

  const me = await fetch(`${API_BASE}/api/users/@me`, {
    headers: {
      Cookie: `__eidash_session=${sessionCookie?.value}`,
    },
  });
  if (!me.ok) {
    return NextResponse.redirect(new URL("/api/oidc/login", req.url));
  }

  return NextResponse.next();
}

// Routes Middleware should not run on
export const config = {
  matcher: ["/((?!api|_next/static|_next/image|.*\\.png$).*)"],
};
