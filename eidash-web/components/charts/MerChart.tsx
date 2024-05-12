"use client";

import { Time } from "lightweight-charts";
import { Chart } from "./Chart";
import { BasicSaveV1Row } from "@/hooks/useSaves";
import { formatEIValue } from "@/lib/units";
import { calculateMer } from "@/lib/math";

export default function MerChart({ saves }: { saves: BasicSaveV1Row[] }) {
  return (
    <Chart
      data={saves.map((row) => ({
        time: row.timestamp as Time,
        value: calculateMer(row),
      }))}
      valueFormatter={(priceValue: number) => priceValue.toFixed(2)}
      colors={{
        LINE_LINE_COLOR: "green",
        AREA_TOP_COLOR: "green",
        AREA_BOTTOM_COLOR: "rgba(0, 128, 0, 0.28)",
      }}
    />
  );
}
