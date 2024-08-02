"use client";

import ClothedEarningsBonusChart from "@/components/charts/ClothedEarningsBonusChart";
import CopyUserProfileURLButton from "@/components/CopyUserProfileURLButton";
import EarningsBonusChart from "@/components/charts/EarningsBonusChart";
import AccountVisibilityButton from "@/components/AccountVisibilityButton";
import ProphecyEggsChart from "@/components/charts/ProphecyEggsChart";
import SoulEggsChart from "@/components/charts/SoulEggsChart";
import MerChart from "@/components/charts/MerChart";
import JerChart from "@/components/charts/JerChart";
import { LastUpdated } from "@/components/LastUpdated";
import { AccountSelecter } from "@/components/AccountSelecter";
import { APIAccount, APIUser, BasicSave } from "@/lib/types";
import { fetchSaves, useClientSaves } from "@/hooks/useSaves";
import {
  getLocalStorageNoPrefix,
  setLocalStorageNoPrefix,
} from "@/lib/storage";
import { useEffect, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import ChartSkeleton from "./charts/ChartSkeleton";

export default function Charts({
  user,
  userPage = false,
}: {
  user: APIUser | null | undefined;
  userPage?: boolean;
}) {
  const [account, setAccount] = useState<APIAccount | null | undefined>(null);
  useEffect(() => {
    if (userPage) {
      setAccount(user?.accounts.find((a) => a.position === 0));
    } else {
      const storedAccountId = getLocalStorageNoPrefix("accountId");
      const accountId =
        storedAccountId ?? user?.accounts.find((a) => a.position === 0)?.id;
      console.log({ accountId, storedAccountId });
      setAccount(user?.accounts.find((a) => a.id === accountId)!);

      if (!storedAccountId) {
        setLocalStorageNoPrefix("accountId", accountId!);
      }
    }
  }, [user?.accounts, userPage]);

  const {
    isPending,
    error,
    data: saves,
    isError,
  } = useQuery({
    queryKey: ["accountSaves", account?.id],
    queryFn: () => fetchSaves(account?.id!),
    enabled: !!account?.id,
    refetchInterval: 1000 * 60, // 1 minute
    refetchIntervalInBackground: true,
    refetchOnWindowFocus: true,
  });

  if (isError) {
    return <span>Error: {error.message}</span>;
  }

  const latestSaveTimestamp = isPending
    ? null
    : saves.length > 1
    ? saves[saves!.length - 1].timestamp
    : null;

  return (
    <div className="mx-auto max-w-3xl space-y-12 md:py-24">
      <div className="space-y-4">
        <h2 className="text-2xl font-bold">
          <AccountSelecter user={user!} onChange={setAccount} />
          {account?.visibility === "public" && user ? (
            <CopyUserProfileURLButton user={user} />
          ) : (
            <></>
          )}
        </h2>
        {!userPage && <AccountVisibilityButton account={account} />}
      </div>
      <div className="space-y-4">
        {latestSaveTimestamp ? (
          <LastUpdated timestamp={latestSaveTimestamp} />
        ) : (
          <></>
        )}
        <h2 className="text-2xl font-bold">Earnings Bonus</h2>
        {isPending ? <ChartSkeleton /> : <EarningsBonusChart saves={saves} />}

        <h2 className="text-2xl font-bold">Soul Eggs</h2>
        {isPending ? <ChartSkeleton /> : <SoulEggsChart saves={saves} />}

        <h2 className="text-2xl font-bold">Prophecy Eggs</h2>
        {isPending ? <ChartSkeleton /> : <ProphecyEggsChart saves={saves} />}

        <h2 className="text-2xl font-bold">Clothed Earnings Bonus</h2>
        {isPending ? (
          <ChartSkeleton />
        ) : (
          <ClothedEarningsBonusChart saves={saves!} />
        )}

        <h1 className="text-4xl font-bold">Formulae</h1>

        <h2 className="text-2xl font-bold">MER Value</h2>
        {isPending ? <ChartSkeleton /> : <MerChart saves={saves} />}

        <h2 className="text-2xl font-bold">JER Value</h2>
        {isPending ? <ChartSkeleton /> : <JerChart saves={saves} />}
      </div>
    </div>
  );
}
