export interface APIUser {
  id: string;
  username: string;
  email?: string;
  accounts: APIAccount[];
  created_at: string;
}

export interface APIAccount {
  id: string;
  username: string;
  visibility: "private" | "public";
  position: number;
}

export interface APIBasicSaveV1 {
  account_id: string;
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
  account_id: string;
  computed_earnings_bonus: number;
  soul_eggs: number;
  eggs_of_prophecy: number;
  er_soul_food_level: number;
  er_prophecy_bonus_level: number;
  clothed_earnings_bonus: number | null;
  timestamp: Date;
  backup_time: Date;
}
