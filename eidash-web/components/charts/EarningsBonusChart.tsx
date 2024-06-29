"use client";

import { Time } from "lightweight-charts";
import { Chart } from "./Chart";
import { formatEIValue } from "@/lib/units";
import { BasicSave } from "@/hooks/useSaves";

export default function EarningsBonusChart({ saves }: { saves: BasicSave[] }) {
  return (
    <Chart
      data={saves.map((row) => ({
        time: (row.timestamp.getTime() / 1000) as Time,
        value: row.computed_earnings_bonus * 100,
      }))}
      valueFormatter={(priceValue: number) =>
        `${formatEIValue(priceValue, { trim: true })}%`
      }
      colors={{
        LINE_LINE_COLOR: "#95B9C7",
        AREA_TOP_COLOR: "rgba(149, 185, 199, 0.28)",
        AREA_BOTTOM_COLOR: "rgba(149, 185, 199, 0.28)",
      }}
    />
  );
}