"use server";

import { fetchSaves, fetchUser } from "@/actions/user";
import Charts from "@/components/Charts";
import EarningsBonusChart from "@/components/charts/EarningsBonusChart";
import JerChart from "@/components/charts/JerChart";
import MerChart from "@/components/charts/MerChart";
import ProphecyEggsChart from "@/components/charts/ProphecyEggsChart";
import SoulEggsChart from "@/components/charts/SoulEggsChart";
import { LastUpdated } from "@/components/LastUpdated";
import { useUser } from "@/hooks/useAuth";
import { useClientSaves } from "@/hooks/useSaves";
import { formatEIValue } from "@/lib/units";
import { formatDistance } from "date-fns";
import { Metadata } from "next";

type Props = {
  params: {
    id: string;
  };
};

export default async function UserProfile({ params: { id } }: Props) {
  const user = await fetchUser(id);

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
      <Charts user={user} userPage />
    </div>
  ) : (
    <p>Loading...</p>
  );
}

export async function generateMetadata({
  params: { id },
}: Props): Promise<Metadata> {
  const user = await fetchUser(id)!;
  const [save] = await fetchSaves(user!.accounts[0].id!, 1)!;

  const title = `EIDash - ${user!.username}'s Profile`;
  const description = `${user!.username} has ${formatEIValue(save.soul_eggs, {
    trim: true,
  })} Soul Eggs, ${Math.floor(
    save.eggs_of_prophecy
  )} Prophecy Eggs, and an Earnings Bonus of ${formatEIValue(
    save.computed_earnings_bonus,
    { trim: true }
  )}%!`;

  return {
    metadataBase: new URL(process.env.NEXT_PUBLIC_VERCEL_URL!),
    title,
    description,
    openGraph: {
      title,
      description,
      images: [
        {
          url: "/yeti.png",
        },
      ],
    },
    twitter: {
      card: "summary",
      site: "@fykowo",
      creator: "@fykowo",
      title,
      description,
      images: [
        {
          url: "/yeti.png",
        },
      ],
    },
  };
}
