"use client";

import ClothedEarningsBonusChart from "@/components/charts/ClothedEarningsBonusChart";
import CopyUserProfileURLButton from "@/components/CopyUserProfileURLButton";
import EarningsBonusChart from "@/components/charts/EarningsBonusChart";
import ProfileVisibilityButton from "@/components/ProfileVisibilityButton";
import ProphecyEggsChart from "@/components/charts/ProphecyEggsChart";
import SetEIDForm from "@/components/SetEIDForm";
import SoulEggsChart from "@/components/charts/SoulEggsChart";
import Image from "next/image";
import { formatDistance, formatDistanceStrict } from "date-fns";
import MerChart from "@/components/charts/MerChart";
import { useAuth } from "@/hooks/useAuth";
import { useClientSaves } from "@/hooks/useSaves";
import JerChart from "@/components/charts/JerChart";
import { useEffect, useRef, useState } from "react";
import { LastUpdated } from "@/components/LastUpdated";

export default function Home() {
  const auth = useAuth();
  const user = auth.user;
  const saves = useClientSaves("@me");

  const latestSaveTimestamp =
    saves.length > 1 ? saves[saves.length - 1].timestamp : null;

  return (
    <div className="mx-auto max-w-4xl px-5 py-10">
      <div className="hidden items-center space-x-2 sm:flex">
        <nav className="flex-1">
          <ul className="flex space-x-4">
            <li
              className="text-2xl font-extrabold italic"
              style={{ fontFamily: "Victor Mono" }}
            >
              <Image
                className="inline-block w-12 h-12 p-2"
                width={12}
                height={12}
                src="/yeti.png"
                alt="logo"
              />
              EI Dash
            </li>
          </ul>
        </nav>
        <div className="overflow-hidden px-1 py-2">
          <a className="btn" href={`/api/oidc/logout`}>
            {user === null ? "Login" : "Logout"}
          </a>
        </div>
      </div>
      <div className="mx-auto max-w-3xl space-y-12 md:py-24">
        <div className="space-y-4">
          <h2 className="text-2xl font-bold">
            Your Profile{" "}
            {user?.profile_visibility === "public" ? (
              <CopyUserProfileURLButton user={user} />
            ) : (
              <></>
            )}
          </h2>
          <SetEIDForm />
          <pre>
            {(JSON.stringify(user, null, 4) ?? "").replace(
              /(EI)(\d+)(\d{4})/g,
              (_, prefix, inner, lastFour) =>
                `${prefix}${"*".repeat(inner.length)}${lastFour}`
            )}
          </pre>
          <ProfileVisibilityButton />
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
    </div>
  );
}
