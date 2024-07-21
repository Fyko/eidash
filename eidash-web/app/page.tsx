"use server";

import ClothedEarningsBonusChart from "@/components/charts/ClothedEarningsBonusChart";
import CopyUserProfileURLButton from "@/components/CopyUserProfileURLButton";
import EarningsBonusChart from "@/components/charts/EarningsBonusChart";
import AccountVisibilityButton from "@/components/AccountVisibilityButton";
import ProphecyEggsChart from "@/components/charts/ProphecyEggsChart";
import SoulEggsChart from "@/components/charts/SoulEggsChart";
import Image from "next/image";
import MerChart from "@/components/charts/MerChart";
import JerChart from "@/components/charts/JerChart";
import { LastUpdated } from "@/components/LastUpdated";
import { fetchSaves, fetchUser } from "@/actions/user";
import { AccountSelecter } from "@/components/AccountSelecter";
import { APIUser } from "@/lib/types";
import Charts from "@/components/Charts";

export default async function Home() {
  const user = (await fetchUser("@me")) as APIUser;
  // todo: use localstorage to persist the current accountId
  const account = user?.accounts.find((a) => a.position === 0)!;
  const saves = await fetchSaves(account.id);

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
      <Charts user={user} account={account} saves={saves} />
    </div>
  );
}
