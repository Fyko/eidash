"use client";

import { Time } from "lightweight-charts";
import { Chart } from "./Chart";
import { BasicSave } from "@/hooks/useSaves";
import { calculateJer } from "@/lib/math";

export default function JerChart({ saves }: { saves: BasicSave[] }) {
  return (
    <Chart
      data={saves.map((row) => ({
        time: (row.timestamp.getTime() / 1000) as Time,
        value: calculateJer(row),
      }))}
      valueFormatter={(priceValue: number) => priceValue.toFixed(2)}
      colors={{
        LINE_LINE_COLOR: "#FF69B4",
        AREA_TOP_COLOR: "#FF69B4",
        AREA_BOTTOM_COLOR: "rgba(255, 105, 180, 0.28)",
      }}
    />
  );
}
