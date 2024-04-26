"use client";
import ProphecyEggsChart from "@/components/ProphecyEggsChart";
import SetEIDForm from "@/components/SetEIDForm";
import SoulEggsChart from "@/components/SoulEggsChart";
import { useAuth } from "@/hooks/useAuth";
import { SavesProvider } from "@/hooks/useSaves";

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
          <h2 className="text-2xl font-bold">User Info</h2>
          <SetEIDForm />
          <pre>{JSON.stringify(auth.user, null, 4)}</pre>
        </div>
        <div className="space-y-4">
          <h1 className="text-4xl font-bold">Pretty Charts</h1>

          <SavesProvider>
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
