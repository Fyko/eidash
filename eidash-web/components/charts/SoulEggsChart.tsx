"use client";

import { Time } from "lightweight-charts";
import { Chart } from "./Chart";
import { BasicSaveV1Row } from "@/hooks/useSaves";
import { formatEIValue } from "@/lib/units";

export default function SoulEggsChart({ saves }: { saves: BasicSaveV1Row[] }) {
  return (
    <Chart
      data={saves.map((row) => ({
        time: row.timestamp as Time,
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
