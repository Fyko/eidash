"use client";

import { useEffect, useState, useRef } from "react";
import { formatDistance } from "date-fns";

interface LastUpdatedProps {
  timestamp: Date;
}

export const LastUpdated: React.FC<LastUpdatedProps> = ({ timestamp }) => {
  const [currentTime, setCurrentTime] = useState(new Date());
  const frameRef = useRef<number>();

  useEffect(() => {
    const updateCurrentTime = () => {
      setCurrentTime(new Date());
      frameRef.current = requestAnimationFrame(updateCurrentTime);
    };

    frameRef.current = requestAnimationFrame(updateCurrentTime);
    return () => cancelAnimationFrame(frameRef.current!);
  }, []);

  const getLastUpdatedText = () => {
    return formatDistance(timestamp, currentTime, {
      addSuffix: true,
      includeSeconds: true,
    });
  };

  return (
    <p>
      Last updated <span className="italic">{getLastUpdatedText()}</span>
    </p>
  );
};
