import { ChartOptions, ChartData } from "chart.js";
import { useEffect, useState } from "react";
import { Line } from "react-chartjs-2";
import { formatEIValue } from "@/lib/units";
import "chart.js/auto";
import "chartjs-adapter-date-fns";

// notes
// - https://github.com/chrisnieves60/retropricer/blob/a20856d3b6eb612918e9bbd0111f4b64816b596c/components/PriceGraph.tsx#L2

export interface BasicSaveV1Row {
  user_id: string;
  computed_earnings_bonus: number;
  soul_eggs: number;
  eggs_of_prophecy: number;
  er_soul_food_level: number;
  er_prophecy_bonus_level: number;
  timestamp: number;
  backup_time: number;
}

enum Timeline {
  TwentyFourHours,
  SevenDays,
  TwoWeeks,
  OneMonth,
  OneQuarter,
  OneYear,
  YearToDate,
  AllTime,
}

const TWENTY_FOUR_HOURS = 24 * 60 * 60 * 1000;

const STOP_DATES = {
  [Timeline.TwentyFourHours]: (startDate: Date) =>
    new Date(startDate.getTime() - TWENTY_FOUR_HOURS),
  [Timeline.SevenDays]: (startDate: Date) =>
    new Date(startDate.getTime() - 7 * TWENTY_FOUR_HOURS),
  [Timeline.TwoWeeks]: (startDate: Date) =>
    new Date(startDate.getTime() - 14 * TWENTY_FOUR_HOURS),
  [Timeline.OneMonth]: (startDate: Date) =>
    new Date(startDate.getTime() - 30 * TWENTY_FOUR_HOURS),
  [Timeline.OneQuarter]: (startDate: Date) =>
    new Date(startDate.getTime() - 90 * TWENTY_FOUR_HOURS),
  [Timeline.OneYear]: (startDate: Date) =>
    new Date(startDate.getTime() - 365 * TWENTY_FOUR_HOURS),
  [Timeline.YearToDate]: (startDate: Date) =>
    new Date(startDate.getFullYear(), 0, 1),
  [Timeline.AllTime]: (_: unknown) => new Date(0),
} as const;

function Chart({ data }: { data: BasicSaveV1Row[] }) {
  const getTimeUnit = (): "day" | "hour" | "week" | "month" => {
    if (data.length === 0) {
      return "day"; // Default unit if data is empty
    }

    if (!data[0].backup_time || !data[data.length - 1].backup_time) {
      console.error("Data is missing timestamp properties");
      return "day"; // Default unit if timestamp is missing
    }

    const startDate = data[0].backup_time * 1000;
    const endDate = data[data.length - 1].backup_time * 1000;
    const timeDiff = startDate - endDate;
    console.log({ startDate, endDate, timeDiff });
    console.log(data);

    const oneDay = 24 * 60 * 60 * 1000; // milliseconds in a day
    const oneMonth = oneDay * 30; // approximate milliseconds in a month
    const threeMonths = oneMonth * 3;

    if (timeDiff <= oneDay) {
      return "hour";
    } else if (timeDiff <= oneMonth) {
      return "day";
    } else if (timeDiff <= threeMonths) {
      return "week";
    } else {
      return "month";
    }
  };
  console.log(`getTimeUnit: ${getTimeUnit()}`);

  const options: ChartOptions<"line"> = {
    responsive: true,
    plugins: {
      legend: {
        display: false,
      },
      title: {
        display: true,
        text: "Soul Eggs",
      },
    },
    scales: {
      x: {
        type: "time",
        time: {
          unit: getTimeUnit(),
          tooltipFormat: "MMM d, yyyy, h:mm a",
        },
        title: {
          display: true,
          text: "Date",
        },
        ticks: {
          source: "auto" as const,
          autoSkip: true,
        },
      },
      y: {
        title: {
          display: false,
          text: "Soul Eggs",
        },
        ticks: {
          callback: function (value, index, ticks) {
            return formatEIValue(value as number, { trim: true });
          },
        },
      },
    },
  };

  const chartData: ChartData<"line"> = {
    labels: data.map((row) => new Date(row.backup_time * 1000).toString()),
    datasets: [
      {
        label: "Soul Eggs",
        data: data.map((row) => row.soul_eggs),
        fill: false,
        borderColor: "rgb(75, 192, 192)",
        tension: 0.1,
      },
    ],
  };

  return <Line options={options} data={chartData} />;
}

export default function SoulEggsChart() {
  const [timeline, setTimeline] = useState<Timeline>(Timeline.TwentyFourHours);
  const [data, setData] = useState<BasicSaveV1Row[]>([]);

  useEffect(() => {
    const startDate = new Date();
    const stopDate = STOP_DATES[timeline](startDate);

    async function fetchSoulEggs() {
      const res = await fetch(
        `http://localhost:33939/api/users/@me/basic-save-v1?timestamp_gte=${stopDate.getTime()}&timestamp_lt=${startDate.getTime()}`,
        { credentials: "include" }
      );
      if (res.status > 200) {
        return setData([]);
      }

      const data = (await res.json()) as BasicSaveV1Row[];
      setData(data);
    }

    fetchSoulEggs();
  }, [timeline]);

  return (
    <div className="w-96">
      <label>
        Timeline
        <select
          value={timeline}
          onChange={(e) => setTimeline(parseInt(e.target.value, 10))}
        >
          <option value={Timeline.TwentyFourHours}>24 Hours</option>
          <option value={Timeline.SevenDays}>7 days</option>
          <option value={Timeline.TwoWeeks}>2 weeks</option>
          <option value={Timeline.OneMonth}>1 Month</option>
          <option value={Timeline.OneQuarter}>1 Quarter</option>
          <option value={Timeline.OneYear}>1 Year</option>
          <option value={Timeline.YearToDate}>Year To Date</option>
          <option value={Timeline.AllTime}>All time</option>
        </select>
      </label>
      {data.length > 0 ? <Chart data={data} /> : "No data"}
    </div>
  );
}
