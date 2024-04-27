"use client";
import EarningsBonusChart from "@/components/EarningsBonusChart";
import ProphecyEggsChart from "@/components/ProphecyEggsChart";
import SetEIDForm from "@/components/SetEIDForm";
import SoulEggsChart from "@/components/SoulEggsChart";
import { APIUser, fetchUser, useAuth } from "@/hooks/useAuth";
import { SavesProvider, useSaves } from "@/hooks/useSaves";
import { GetServerSideProps } from "next";
import { useEffect, useState } from "react";

export default function UserProfile({
  params: { id },
}: {
  params: { id: string };
}) {
  const auth = useAuth();

  if (auth.user === null) {
    window.location.href = `/api/oidc/login`;
  }

  // set the title of the page
  useEffect(() => {
    document.title = `EI Dash - ${auth.user?.username}'s Profile`;
  }, [auth]);

  const [user, setUser] = useState<APIUser | null>(null);
  useEffect(() => {
    (async () => {
      const fetchedUser = await fetchUser(id);
      setUser(fetchedUser);
    })();
  }, [id]);

  return user ? (
    <div className="mx-auto max-w-4xl px-5 py-10">
      <div className="hidden items-center space-x-2 sm:flex">
        <nav className="flex-1">
          <ul className="flex space-x-4">
            <li>EI Dash</li>
          </ul>
        </nav>
        <div className="overflow-hidden px-1 py-2">
          <a className="btn" href={`/api/oidc/login`}>
            Login
          </a>
        </div>
      </div>
      <div className="mx-auto max-w-3xl space-y-12 md:py-24">
        <div className="space-y-4">
          <h2 className="text-4xl font-bold">
            <pre className="inline-block">{user.username}</pre>&apos;s Profile
          </h2>
        </div>
        <div className="space-y-4">
          <SavesProvider userId={id}>
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
  ) : (
    <p>Loading...</p>
  );
}
