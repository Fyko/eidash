import { BarPrice, Time } from "lightweight-charts";
import { Chart } from "./Chart";
import { useSaves } from "@/hooks/useSaves";
import { formatEIValue } from "@/lib/units";

export default function EarningsBonusChart() {
  const saves = useSaves();

  return (
    <Chart
      data={saves.map((row) => ({
        time: row.timestamp as Time,
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
