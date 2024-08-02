"use client";

import { useECharts } from "@kbox-labs/react-echarts";
import { EChart } from "@kbox-labs/react-echarts";
import { LineChart } from "echarts/charts";
import { CanvasRenderer } from "echarts/renderers";
import {
  TitleComponent,
  TooltipComponent,
  GridComponent,
} from "echarts/components";
import React, { useEffect, useRef } from "react";

export const themeColors = {
  DARK: {
    CHART_BACKGROUND_COLOR: "black",
    CHART_BACKGROUND_RGB_COLOR: "0, 0, 0",
    LINE_LINE_COLOR: "#2962FF",
    LINE_LINE2_COLOR: "rgb(225, 87, 90)",
    LINE_LINE3_COLOR: "rgb(242, 142, 44)",
    LINE_LINE4_COLOR: "rgb(164, 89, 209)",
    LINE_LINE5_COLOR: "rgb(27, 156, 133)",
    AREA_TOP_COLOR: "#2962FF",
    AREA_BOTTOM_COLOR: "rgba(41, 98, 255, 0.28)",
    BAR_UP_COLOR: "#26a69a",
    BAR_DOWN_COLOR: "#ef5350",
    BASELINE_TOP_LINE_COLOR: "rgba( 38, 166, 154, 1)",
    BASELINE_TOP_FILL_COLOR1: "rgba( 38, 166, 154, 0.28)",
    BASELINE_TOP_FILL_COLOR2: "rgba( 38, 166, 154, 0.05)",
    BASELINE_BOTTOM_LINE_COLOR: "rgba( 239, 83, 80, 1)",
    BASELINE_BOTTOM_FILL_COLOR1: "rgba( 239, 83, 80, 0.05)",
    BASELINE_BOTTOM_FILL_COLOR2: "rgba( 239, 83, 80, 0.28)",
    HISTOGRAM_COLOR: "#26a69a",
    CHART_TEXT_COLOR: "white",
  },
  LIGHT: {
    CHART_BACKGROUND_COLOR: "white",
    CHART_BACKGROUND_RGB_COLOR: "255, 255, 255",
    LINE_LINE_COLOR: "#2962FF",
    LINE_LINE2_COLOR: "rgb(225, 87, 90)",
    LINE_LINE3_COLOR: "rgb(242, 142, 44)",
    LINE_LINE4_COLOR: "rgb(164, 89, 209)",
    LINE_LINE5_COLOR: "rgb(27, 156, 133)",
    AREA_TOP_COLOR: "#2962FF",
    AREA_BOTTOM_COLOR: "rgba(41, 98, 255, 0.28)",
    BAR_UP_COLOR: "#26a69a",
    BAR_DOWN_COLOR: "#ef5350",
    BASELINE_TOP_LINE_COLOR: "rgba( 38, 166, 154, 1)",
    BASELINE_TOP_FILL_COLOR1: "rgba( 38, 166, 154, 0.28)",
    BASELINE_TOP_FILL_COLOR2: "rgba( 38, 166, 154, 0.05)",
    BASELINE_BOTTOM_LINE_COLOR: "rgba( 239, 83, 80, 1)",
    BASELINE_BOTTOM_FILL_COLOR1: "rgba( 239, 83, 80, 0.05)",
    BASELINE_BOTTOM_FILL_COLOR2: "rgba( 239, 83, 80, 0.28)",
    HISTOGRAM_COLOR: "#26a69a",
    CHART_TEXT_COLOR: "black",
  },
};

export interface ChartProps {
  data: { time: number; value: number }[];
  name: string;
  valueFormatter?: (value: number) => string;
  priceLines?: unknown[];
  colors?: {
    CHART_BACKGROUND_COLOR?: string;
    LINE_LINE_COLOR?: string;
    CHART_TEXT_COLOR?: string;
    AREA_TOP_COLOR?: string;
    AREA_BOTTOM_COLOR?: string;
  };
}

export const Chart = (props: ChartProps) => {
  const {
    data,
    name,
    colors: {
      CHART_BACKGROUND_COLOR: backgroundColor,
      LINE_LINE_COLOR: lineColor,
      CHART_TEXT_COLOR: textColor,
      AREA_TOP_COLOR: areaTopColor,
      AREA_BOTTOM_COLOR: areaBottomColor,
    } = {},
    priceLines,
  } = props;

  return (
    <EChart
      use={[
        LineChart,
        TitleComponent,
        TooltipComponent,
        GridComponent,
        CanvasRenderer,
      ]}
      tooltip={{
        trigger: "axis",
        valueFormatter: (value: number) =>
          props.valueFormatter?.(value) ?? value.toFixed(2),
      }}
      group="group1"
      style={{
        height: "300px",
        width: "100%",
      }}
      xAxis={{
        type: "time",
      }}
      yAxis={{
        type: "value",
        scale: true,
        axisLabel: {
          formatter: (value: number) =>
            props.valueFormatter?.(value) ?? value.toFixed(2),
        },
      }}
      series={[
        {
          color: lineColor,
          name,
          type: "line",
          smooth: true,
          symbolSize: 1,
          data: data.map(({ time, value }) => [time, value]),
          // areaStyle: {},
        },
      ]}
    />
  );
  // const [ref, echartsInstance] = useECharts<HTMLDivElement>({
  //   use: [
  //     LineChart,
  //     TitleComponent,
  //     TooltipComponent,
  //     GridComponent,
  //     CanvasRenderer,
  //   ],
  //   group: "group1",
  //   style: {
  //     height: "300px",
  //     width: "100%",
  //   },
  //   xAxis: {
  //     type: "category",
  //     boundaryGap: false,
  //     data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
  //   },
  //   yAxis: {
  //     type: "value",
  //   },
  //   series: [
  //     {
  //       data: Array.from({ length: 40 }, () => Math.floor(Math.random() * 100)),
  //       type: "line",
  //       areaStyle: {},
  //     },
  //   ],
  // });

  // return <div className="w-full" ref={ref} />;
};

// export const OldChart = (props: ChartProps) => {
//   const {
//     data,
//     colors: {
//       CHART_BACKGROUND_COLOR: backgroundColor,
//       LINE_LINE_COLOR: lineColor,
//       CHART_TEXT_COLOR: textColor,
//       AREA_TOP_COLOR: areaTopColor,
//       AREA_BOTTOM_COLOR: areaBottomColor,
//     } = {},
//     priceLines,
//   } = props;

//   const chartContainerRef = useRef<HTMLDivElement>(null);

//   useEffect(() => {
//     const handleResize = () => {
//       chart.applyOptions({ width: chartContainerRef.current!.clientWidth });
//     };

//     const chart = createChart(chartContainerRef.current!, {
//       layout: {
//         background: {
//           type: ColorType.Solid,
//           color: backgroundColor ?? themeColors.DARK.CHART_BACKGROUND_COLOR,
//         },
//         textColor: textColor ?? themeColors.DARK.CHART_TEXT_COLOR,
//       },
//       width: chartContainerRef.current!.clientWidth,
//       height: 300,
//       localization: {
//         priceFormatter:
//           props.valueFormatter ??
//           ((priceValue: number) => priceValue.toString()),
//         dateFormat: "yyyy-MM-dd",
//         timeFormatter: (time: number) => new Date(time * 1000).toLocaleString(),
//       },
//     });

//     const series = chart.addAreaSeries({
//       lineColor: lineColor ?? themeColors.DARK.LINE_LINE_COLOR,
//       topColor: areaTopColor ?? themeColors.DARK.AREA_TOP_COLOR,
//       bottomColor: areaBottomColor ?? themeColors.DARK.AREA_BOTTOM_COLOR,
//     });
//     series.setData(data);
//     for (const priceLine of priceLines ?? []) {
//       series.createPriceLine(priceLine);
//     }
//     chart.timeScale().applyOptions({ secondsVisible: true });
//     chart.timeScale().fitContent();

//     window.addEventListener("resize", handleResize);

//     return () => {
//       window.removeEventListener("resize", handleResize);

//       chart.remove();
//     };
//   }, [
//     data,
//     backgroundColor,
//     lineColor,
//     textColor,
//     areaTopColor,
//     areaBottomColor,
//     props.valueFormatter,
//     priceLines,
//   ]);

//   return <div className="w-full" ref={chartContainerRef} />;
// };
