"use client";

import { createContext, useContext, useEffect, useState } from "react";

const AuthContext = createContext<ReturnType<typeof useProvideAuth>>({
  user: undefined,
  updateUser: async () => {},
});

export interface APIUser {
  id: string;
  ei_id?: string;
  profile_visibility: "private" | "public";
  username: string;
  email?: string;
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

export async function fetchUser(userId?: string): Promise<APIUser | null> {
  const res = await fetch(`/api/users/${userId ?? "@me"}`, {
    credentials: "include",
  });

  if (res.status > 200) {
    return null;
  }

  const user = (await res.json()) as APIUser;

  return user;
}

export const useProvideAuth = () => {
  const [user, setUser] = useState<APIUser | null | undefined>(undefined);

  async function updateUser(): Promise<void> {
    const user = await fetchUser();
    setUser(user);
  }

  useEffect(() => void updateUser(), []);

  return {
    user,
    updateUser,
  };
};
