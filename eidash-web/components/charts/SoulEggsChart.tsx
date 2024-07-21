"use client";

import { Time } from "lightweight-charts";
import { Chart } from "./Chart";
import { formatEIValue } from "@/lib/units";
import { BasicSave } from "@/lib/types";

export default function SoulEggsChart({ saves }: { saves: BasicSave[] }) {
  console.log(saves[0]);
  return (
    <Chart
      data={saves.map((row) => ({
        time: (row.timestamp.getTime() / 1000) as Time,
        value: row.soul_eggs,
      }))}
      valueFormatter={(priceValue: number) =>
        formatEIValue(priceValue, { trim: true, decimals: 4 })
      }
      colors={{
        LINE_LINE_COLOR: "purple",
        AREA_TOP_COLOR: "purple",
        AREA_BOTTOM_COLOR: "rgba(128, 0, 128, 0.28)",
      }}
    />
  );
}
