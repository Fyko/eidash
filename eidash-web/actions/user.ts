import { APIBasicSaveV1, APIUser, BasicSave } from "@/lib/types";
import { cookies } from "next/headers";

const API_BASE = process.env.API_BASE;

export async function fetchUser(id: string): Promise<APIUser | null> {
  const jar = cookies();

  const res = await fetch(`${API_BASE}/api/users/${id}`, {
    headers: {
      cookie: jar.toString(),
    },
  });
  return res.ok ? res.json() : null;
}

export async function fetchSaves(
  accountId: string,
  limit?: number
): Promise<BasicSave[]> {
  const jar = cookies();

  const url = new URL(`${API_BASE}/api/accounts/${accountId}/basic-save-v1`);
  if (limit) {
    url.searchParams.set("limit", limit.toString());
  }

  const res = await fetch(url.toString(), {
    headers: {
      cookie: jar.toString(),
    },
  });

  const data = (await res.json()) as APIBasicSaveV1[];
  return data.map((row) => ({
    account_id: row.account_id,
    computed_earnings_bonus: row.computed_earnings_bonus,
    eggs_of_prophecy: row.eggs_of_prophecy,
    er_soul_food_level: row.er_soul_food_level,
    er_prophecy_bonus_level: row.er_prophecy_bonus_level,
    clothed_earnings_bonus: row.clothed_earnings_bonus,

    // custom
    soul_eggs: parseFloat(row.soul_eggs),
    timestamp: new Date(row.time),
    backup_time: new Date(row.backup_time),
  }));
}
