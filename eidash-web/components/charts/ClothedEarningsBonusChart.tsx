"use client";

import { LineStyle, PriceLineOptions, Time } from "lightweight-charts";
import { Chart } from "./Chart";
import { farmerRoles, formatEIValue } from "@/lib/units";
import { BasicSave } from "@/lib/types";

export default function EarningsBonusChart({ saves }: { saves: BasicSave[] }) {
  return (
    <Chart
      data={saves
        .filter((s) => typeof s.clothed_earnings_bonus === "number")
        .map((row) => ({
          time: (row.timestamp.getTime() / 1000) as Time,
          value: row.clothed_earnings_bonus! * 100,
        }))}
      valueFormatter={(priceValue: number) =>
        `${formatEIValue(priceValue, { trim: true })}%`
      }
      priceLines={farmerRoles.map((role) => {
        return {
          price: Math.pow(10, role.oom) * 100,
          color: role.color,
          lineWidth: 2,
          lineStyle: LineStyle.Dashed,
          axisLabelVisible: true,
          title: role.name,
        } as PriceLineOptions;
      })}
      colors={{
        LINE_LINE_COLOR: "#95B9C7",
        AREA_TOP_COLOR: "rgba(149, 185, 199, 0.28)",
        AREA_BOTTOM_COLOR: "rgba(149, 185, 199, 0.28)",
      }}
    />
  );
}
