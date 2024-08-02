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
import { useClientSaves } from "@/hooks/useSaves";
import {
  getLocalStorageNoPrefix,
  setLocalStorageNoPrefix,
} from "@/lib/storage";
import { useEffect, useState } from "react";
import ChartSkeleton from "./charts/ChartSkeleton";
import SetEIDForm from "./SetEIDForm";

export default function SetupAccount({
  user,
}: {
  user: APIUser | null | undefined;
}) {
  const [account, setAccount] = useState<APIAccount | null | undefined>(null);
  const saves = useClientSaves(account?.id);

  return (
    <div className="mx-auto max-w-3xl space-y-12 md:py-24">
      <div className="space-y-4">
        <h2 className="text-2xl font-bold">Your Profile</h2>
        <p>
          To begin tracking your Egg, Inc. account progress, enter your EID.
        </p>
        <SetEIDForm />
      </div>
      <div className="space-y-4">
        <h2 className="text-2xl font-bold">Earnings Bonus</h2>
        <ChartSkeleton />

        <h2 className="text-2xl font-bold">Soul Eggs</h2>
        <ChartSkeleton />

        <h2 className="text-2xl font-bold">Prophecy Eggs</h2>
        <ChartSkeleton />

        <h2 className="text-2xl font-bold">Clothed Earnings Bonus</h2>
        <ChartSkeleton />

        <h1 className="text-4xl font-bold">Formulae</h1>

        <h2 className="text-2xl font-bold">MER Value</h2>
        <ChartSkeleton />

        <h2 className="text-2xl font-bold">JER Value</h2>
        <ChartSkeleton />
      </div>
    </div>
  );
}
