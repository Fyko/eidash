import { Time } from "lightweight-charts";
import { Chart } from "./Chart";
import { useSaves } from "@/hooks/useSaves";

export default function ProphecyEggsChart() {
  const saves = useSaves();

  return (
    <Chart
      data={saves.map((row) => ({
        time: row.timestamp as Time,
        value: row.eggs_of_prophecy,
      }))}
      colors={{
        LINE_LINE_COLOR: "gold",
        AREA_TOP_COLOR: "gold",
        // AREA_BOTTOM_COLOR: "rgba(128, 0, 128, 0.28)",
        AREA_BOTTOM_COLOR: "rgba(255, 215, 0, 0.28)",
      }}
    />
  );
}
