import { cookies } from "next/headers";

const API_BASE = process.env.API_BASE;

export interface APIUser {
  id: string;
  ei_id?: string;
  profile_visibility: "private" | "public";
  username: string;
  email?: string;
  created_at: string;
}

export async function fetchUser(id: string): Promise<APIUser | null> {
  const jar = cookies();

  const res = await fetch(`${API_BASE}/api/users/${id}`, {
    headers: {
      cookie: jar.toString(),
    },
  });
  return res.ok ? res.json() : null;
}

export interface BasicSaveV1Row {
  user_id: string;
  computed_earnings_bonus: number;
  soul_eggs: number;
  eggs_of_prophecy: number;
  er_soul_food_level: number;
  er_prophecy_bonus_level: number;
  timestamp: number;
  backup_time: number;
}

export async function fetchSaves(
  id: string,
  limit?: number
): Promise<BasicSaveV1Row[]> {
  const jar = cookies();

  const url = new URL(`${API_BASE}/api/users/${id}/basic-save-v1`);
  if (limit) {
    url.searchParams.set("limit", limit.toString());
  }

  const res = await fetch(url.toString(), {
    headers: {
      cookie: jar.toString(),
    },
  });

  return res.json();
}
