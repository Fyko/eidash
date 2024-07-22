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
import Image from "next/image";

type Props = {
  params: {
    id: string;
  };
};

export default async function UserProfile({ params: { id } }: Props) {
  const user = await fetchUser(id);
  console.log(user);

  if (!user) {
    return <p>User not found</p>;
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
          <a className="btn" href={`/api/oidc/login`}>
            Login
          </a>
        </div>
      </div>
      {user.accounts.length ? (
        <Charts user={user} userPage />
      ) : (
        <p>No accounts found</p>
      )}
    </div>
  );
}

export async function generateMetadata({
  params: { id },
}: Props): Promise<Metadata> {
  const user = await fetchUser(id)!;
  const account = user!.accounts[0];
  if (!account) {
    return {
      metadataBase: new URL(process.env.NEXT_PUBLIC_VERCEL_URL!),
      title: "EIDash",
      description:
        "Track your Soul Eggs, Eggs of Prophecy, and Earnings Bonus with ease.",
      openGraph: {
        title: "EIDash",
        description:
          "Track your Soul Eggs, Eggs of Prophecy, and Earnings Bonus with ease.",
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
        title: "EIDash",
        description:
          "Track your Soul Eggs, Eggs of Prophecy, and Earnings Bonus with ease.",
        images: [
          {
            url: "/yeti.png",
          },
        ],
      },
    };
  }

  const [save] = await fetchSaves(user!.accounts[0].id!, 1)!;

  const title = `EIDash - ${account!.username}'s Profile`;
  const description = `${account!.username} has ${formatEIValue(
    save.soul_eggs,
    {
      trim: true,
    }
  )} Soul Eggs, ${Math.floor(
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
