import type { Metadata } from "next";
import { Roboto } from "next/font/google";
import "./globals.css";
import { AuthenticationProvider } from "@/hooks/useAuth";
import PlausibleProvider from "next-plausible";

const roboto = Roboto({ weight: ["400", "700"], subsets: ["latin"] });

export const metadata: Metadata = {
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
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <head>
        <link rel="icon" href="/yeti.png" type="image/png" />

        <PlausibleProvider
          domain="eidash.fyko.net"
          customDomain="https://apples.fyko.net"
        />
      </head>
      <body className={roboto.className} style={{ overflow: "unset" }}>
        <AuthenticationProvider>{children}</AuthenticationProvider>
      </body>
    </html>
  );
}
