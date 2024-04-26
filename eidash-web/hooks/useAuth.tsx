"use client";

import { createContext, useContext, useEffect, useState } from "react";

const AuthContext = createContext<ReturnType<typeof useProvideAuth>>({
  user: undefined,
  fetchUser: async () => {},
  updateUser: async () => {},
});

export interface APIUser {
  id: string;
  ei_id: string;
  username: string;
  email: string;
  created_at: string;
}

export function AuthenticationProvider({
  children,
}: {
  children: React.ReactNode;
}) {
  const auth = useProvideAuth();

  return <AuthContext.Provider value={auth}>{children}</AuthContext.Provider>;
}

export const useAuth = () => useContext(AuthContext);

export const useProvideAuth = () => {
  const [user, setUser] = useState<APIUser | null | undefined>(undefined);

  async function fetchUser(): Promise<void> {
    const res = await fetch("/api/users/@me", {
      credentials: "include",
    });

    if (res.status > 200) {
      return void setUser(null);
    }

    const user = (await res.json()) as APIUser;
    setUser(user);
  }

  async function updateUser(): Promise<void> {
    await fetchUser();
  }

  useEffect(() => void fetchUser(), []);

  return {
    user,
    fetchUser,
    updateUser,
  };
};
