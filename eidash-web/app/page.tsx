"use server";

import Image from "next/image";
import { fetchUser } from "@/actions/user";
import Charts from "@/components/Charts";
import SetupAccount from "@/components/SetupAccount";

export default async function Home() {
  const user = await fetchUser("@me");

  return (
    <div className="mx-auto max-w-4xl px-5 py-10">
      <div className="hidden items-center space-x-2 sm:flex">
        <nav className="flex-1">
          <ul className="flex space-x-4">
            <li
              className="text-2xl font-extrabold italic"
              style={{ fontFamily: "Victor Mono" }}
            >
              <Image
                className="inline-block w-12 h-12 p-2"
                width={12}
                height={12}
                src="/yeti.png"
                alt="logo"
              />
              EI Dash
            </li>
          </ul>
        </nav>
        <div className="overflow-hidden px-1 py-2">
          <a className="btn" href={`/api/oidc/logout`}>
            {user === null ? "Login" : "Logout"}
          </a>
        </div>
      </div>
      {user?.accounts.length ? (
        <Charts user={user} />
      ) : (
        <SetupAccount user={user} />
      )}
    </div>
  );
}
