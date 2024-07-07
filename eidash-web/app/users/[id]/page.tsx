"use client";

import EarningsBonusChart from "@/components/charts/EarningsBonusChart";
import JerChart from "@/components/charts/JerChart";
import MerChart from "@/components/charts/MerChart";
import ProphecyEggsChart from "@/components/charts/ProphecyEggsChart";
import SoulEggsChart from "@/components/charts/SoulEggsChart";
import { useUser } from "@/hooks/useAuth";
import { useClientSaves } from "@/hooks/useSaves";
import { formatDistance } from "date-fns";

type Props = {
  params: {
    id: string;
  };
};

export default function UserProfile({ params: { id } }: Props) {
  const user = useUser(id);
  const { saves, getLastUpdatedText } = useClientSaves(id);

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
          {saves.length > 1 && (
            <p>
              Last updated{" "}
              <span className="italic">{getLastUpdatedText()}</span>
            </p>
          )}
          <h2 className="text-2xl font-bold">Earnings Bonus</h2>
          <EarningsBonusChart saves={saves} />

          <h2 className="text-2xl font-bold">Soul Eggs</h2>
          <SoulEggsChart saves={saves} />

          <h2 className="text-2xl font-bold">Prophecy Eggs</h2>
          <ProphecyEggsChart saves={saves} />

          <h2 className="text-2xl font-bold">MER Value</h2>
          <MerChart saves={saves} />

          <h2 className="text-2xl font-bold">JER Value</h2>
          <JerChart saves={saves} />
        </div>
      </div>
    </div>
  ) : (
    <p>Loading...</p>
  );
}

// export async function generateMetadata({
//   params: { id },
// }: Props): Promise<Metadata> {
//   const user = await fetchUser(id);
//   const [save] = await fetchSaves(id, 1)!;

//   const title = `EIDash - ${user!.username}'s Profile`;
//   const description = `${user!.username} has ${formatEIValue(save.soul_eggs, {
//     trim: true,
//   })} Soul Eggs, ${Math.floor(
//     save.eggs_of_prophecy
//   )} Prophecy Eggs, and an Earnings Bonus of ${formatEIValue(
//     save.computed_earnings_bonus,
//     { trim: true }
//   )}%!`;

//   return {
//     metadataBase: new URL(process.env.NEXT_PUBLIC_VERCEL_URL!),
//     title,
//     description,
//     openGraph: {
//       title,
//       description,
//       images: [
//         {
//           url: "/yeti.png",
//         },
//       ],
//     },
//     twitter: {
//       card: "summary",
//       site: "@fykowo",
//       creator: "@fykowo",
//       title,
//       description,
//       images: [
//         {
//           url: "/yeti.png",
//         },
//       ],
//     },
//   };
// }
