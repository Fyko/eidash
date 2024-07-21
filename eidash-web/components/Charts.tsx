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

export default function Charts({
  user,
  account,
  saves,
}: {
  user: APIUser;
  account: APIAccount;
  saves: BasicSave[];
}) {
  const latestSaveTimestamp =
    saves.length > 1 ? saves[saves.length - 1].timestamp : null;

  return (
    <div className="mx-auto max-w-3xl space-y-12 md:py-24">
      <div className="space-y-4">
        <h2 className="text-2xl font-bold">
          <AccountSelecter user={user} />
          {account?.visibility === "public" && user ? (
            <CopyUserProfileURLButton user={user} />
          ) : (
            <></>
          )}
        </h2>
        {/* <SetEIDForm />
          <pre>
            {(JSON.stringify(user, null, 4) ?? "").replace(
              /(EI)(\d+)(\d{4})/g,
              (_, prefix, inner, lastFour) =>
                `${prefix}${"*".repeat(inner.length)}${lastFour}`
            )}
          </pre> */}
        <AccountVisibilityButton account={account} />
      </div>
      <div className="space-y-4">
        {latestSaveTimestamp ? (
          <LastUpdated timestamp={latestSaveTimestamp} />
        ) : (
          <></>
        )}
        <h2 className="text-2xl font-bold">Earnings Bonus</h2>
        <EarningsBonusChart saves={saves} />

        <h2 className="text-2xl font-bold">Soul Eggs</h2>
        <SoulEggsChart saves={saves} />

        <h2 className="text-2xl font-bold">Prophecy Eggs</h2>
        <ProphecyEggsChart saves={saves} />

        <h2 className="text-2xl font-bold">Clothed Earnings Bonus</h2>
        <ClothedEarningsBonusChart saves={saves} />

        <h1 className="text-4xl font-bold">Formulae</h1>

        <h2 className="text-2xl font-bold">MER Value</h2>
        <MerChart saves={saves} />

        <h2 className="text-2xl font-bold">JER Value</h2>
        <JerChart saves={saves} />
      </div>
    </div>
  );
}
