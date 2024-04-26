import { Time } from "lightweight-charts";
import { Chart } from "./Chart";
import { useSaves } from "@/hooks/useSaves";

export default function SoulEggsChart() {
  const saves = useSaves();

  return (
    <Chart
      data={saves.map((row) => ({
        time: row.timestamp as Time,
        value: row.soul_eggs,
      }))}
      colors={{
        LINE_LINE_COLOR: "purple",
        AREA_TOP_COLOR: "purple",
        AREA_BOTTOM_COLOR: "rgba(128, 0, 128, 0.28)",
      }}
    />
  );
}
