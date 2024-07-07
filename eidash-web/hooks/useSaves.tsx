"use client";

import { formatDistanceStrict } from "date-fns";
import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useState,
} from "react";

export interface APIBasicSaveV1 {
  user_id: string;
  computed_earnings_bonus: number;
  soul_eggs: string;
  eggs_of_prophecy: number;
  er_soul_food_level: number;
  er_prophecy_bonus_level: number;
  clothed_earnings_bonus: number | null;
  time: string;
  backup_time: string;
}

export interface BasicSave {
  user_id: string;
  computed_earnings_bonus: number;
  soul_eggs: number;
  eggs_of_prophecy: number;
  er_soul_food_level: number;
  er_prophecy_bonus_level: number;
  clothed_earnings_bonus: number | null;
  timestamp: Date;
  backup_time: Date;
}

export function useClientSaves(userId = "@me"): BasicSave[] {
  const [saves, setSaves] = useState<BasicSave[]>([]);

  const fetchSaves = useCallback(async () => {
    const res = await fetch(`/api/users/${userId}/basic-save-v1`, {
      credentials: "include",
    });
    if (res.status > 200) {
      return setSaves([]);
    }

    const data = (await res.json()) as APIBasicSaveV1[];
    setSaves(
      data.map((row) => ({
        user_id: row.user_id,
        computed_earnings_bonus: row.computed_earnings_bonus,
        eggs_of_prophecy: row.eggs_of_prophecy,
        er_soul_food_level: row.er_soul_food_level,
        er_prophecy_bonus_level: row.er_prophecy_bonus_level,
        clothed_earnings_bonus: row.clothed_earnings_bonus,

        // custom
        soul_eggs: parseFloat(row.soul_eggs),
        timestamp: new Date(row.time),
        backup_time: new Date(row.backup_time),
      }))
    );
  }, [userId]);

  useEffect(() => {
    fetchSaves();
  }, [fetchSaves]);

  // Fetch saves every 2 minutes
  useEffect(() => {
    const interval = setInterval(fetchSaves, 120000);
    return () => clearInterval(interval);
  }, [fetchSaves]);

  return saves;
}
