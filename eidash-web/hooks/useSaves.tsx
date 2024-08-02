"use client";

import { APIBasicSaveV1, BasicSave } from "@/lib/types";
import { useCallback, useEffect, useState } from "react";

export async function fetchSaves(accountId: string) {
  const res = await fetch(`/api/accounts/${accountId}/basic-save-v1`, {
    credentials: "include",
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

export function useClientSaves(accountId = "@me"): BasicSave[] {
  const [saves, setSaves] = useState<BasicSave[]>([]);

  // const fetchSaves = useCallback(async () => {
  //   const res = await fetch(`/api/accounts/${accountId}/basic-save-v1`, {
  //     credentials: "include",
  //   });
  //   if (res.status > 200) {
  //     return setSaves([]);
  //   }

  //   const data = (await res.json()) as APIBasicSaveV1[];
  //   setSaves(
  //     data.map((row) => ({
  //       account_id: row.account_id,
  //       computed_earnings_bonus: row.computed_earnings_bonus,
  //       eggs_of_prophecy: row.eggs_of_prophecy,
  //       er_soul_food_level: row.er_soul_food_level,
  //       er_prophecy_bonus_level: row.er_prophecy_bonus_level,
  //       clothed_earnings_bonus: row.clothed_earnings_bonus,

  //       // custom
  //       soul_eggs: parseFloat(row.soul_eggs),
  //       timestamp: new Date(row.time),
  //       backup_time: new Date(row.backup_time),
  //     }))
  //   );
  // }, [accountId]);
  const fetchSavesCb = useCallback(async () => {
    const data = await fetchSaves(accountId);
    setSaves(data);
  }, [accountId]);

  useEffect(() => {
    fetchSavesCb();
  }, [fetchSaves]);

  // Fetch saves every 60 seconds
  useEffect(() => {
    const interval = setInterval(fetchSaves, 60_000);
    return () => clearInterval(interval);
  }, [fetchSaves]);

  return saves;
}
