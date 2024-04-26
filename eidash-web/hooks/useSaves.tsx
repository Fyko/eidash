"use client";

import { createContext, useContext, useEffect, useState } from "react";

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

const SavesContext = createContext<BasicSaveV1Row[]>([]);

export function SavesProvider({ children }: { children: React.ReactNode }) {
  const [saves, setSaves] = useState<BasicSaveV1Row[]>([]);

  async function fetchSaves(): Promise<void> {
    const res = await fetch(`/api/users/@me/basic-save-v1`, {
      credentials: "include",
    });
    if (res.status > 200) {
      return setSaves([]);
    }

    const data = (await res.json()) as BasicSaveV1Row[];
    setSaves(data);
  }

  useEffect(() => {
    fetchSaves();
  }, []);

  // every 2 minutes, fetch the saves
  useEffect(() => {
    const interval = setInterval(fetchSaves, 120000);
    return () => clearInterval(interval);
  }, []);

  return (
    <SavesContext.Provider value={saves}>{children}</SavesContext.Provider>
  );
}

export const useSaves = () => useContext(SavesContext);