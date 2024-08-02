"use client";

import { Time } from "lightweight-charts";
import { Chart } from "./Chart";
import { BasicSave } from "@/lib/types";

export default function ProphecyEggsChart({ saves }: { saves: BasicSave[] }) {
  return (
    <Chart
      name="Prophecy Eggs"
      data={saves.map((row) => ({
        time: (row.timestamp.getTime() / 1000) as Time,
        value: row.eggs_of_prophecy,
      }))}
      valueFormatter={(priceValue: number) =>
        Math.floor(priceValue).toLocaleString()
      }
      colors={{
        LINE_LINE_COLOR: "gold",
        AREA_TOP_COLOR: "gold",
        // AREA_BOTTOM_COLOR: "rgba(128, 0, 128, 0.28)",
        AREA_BOTTOM_COLOR: "rgba(255, 215, 0, 0.28)",
      }}
    />
  );
}
