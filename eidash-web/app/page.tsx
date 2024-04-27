"use client";
import CopyUserProfileURLButton from "@/components/CopyUserProfileURLButton";
import EarningsBonusChart from "@/components/EarningsBonusChart";
import ProfileVisibilityButton from "@/components/ProfileVisibilityButton";
import ProphecyEggsChart from "@/components/ProphecyEggsChart";
import SetEIDForm from "@/components/SetEIDForm";
import SoulEggsChart from "@/components/SoulEggsChart";
import { useAuth } from "@/hooks/useAuth";
import { SavesProvider } from "@/hooks/useSaves";
import Image from "next/image";

export default function Home() {
  const auth = useAuth();

  if (auth.user === null) {
    window.location.href = `/api/oidc/login`;
  }

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
            {auth.user === null ? "Login" : "Logout"}
          </a>
        </div>
      </div>
      <div className="mx-auto max-w-3xl space-y-12 md:py-24">
        <div className="space-y-4">
          <h2 className="text-2xl font-bold">
            Your Profile{" "}
            {auth.user?.profile_visibility === "public" ? (
              <CopyUserProfileURLButton />
            ) : (
              <></>
            )}
          </h2>
          <SetEIDForm />
          <pre>
            {(JSON.stringify(auth.user, null, 4) ?? "").replace(
              /(EI)(\d+)(\d{4})/g,
              (_, prefix, inner, lastFour) =>
                `${prefix}${"*".repeat(inner.length)}${lastFour}`
            )}
          </pre>
          <ProfileVisibilityButton />
        </div>
        <div className="space-y-4">
          <SavesProvider>
            <h2 className="text-2xl font-bold">Earnings Bonus</h2>
            <EarningsBonusChart />

            <h2 className="text-2xl font-bold">Soul Eggs</h2>
            <SoulEggsChart />

            <h2 className="text-2xl font-bold">Prophecy Eggs</h2>
            <ProphecyEggsChart />
          </SavesProvider>
        </div>
      </div>
    </div>
  );
}
