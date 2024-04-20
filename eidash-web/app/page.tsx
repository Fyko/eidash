"use client";
import { useEffect, useState } from "react";

const API_BASE = process.env.NEXT_PUBLIC_API_BASE;

interface APIUser {
  id: string;
  ei_id: string;
  username: string;
  email: string;
  created_at: string;
}

export default function Home() {
  const [user, setUser] = useState<APIUser | null | undefined>(undefined);
  const [eiId, setEiId] = useState(user?.ei_id);
  const [location, setLocation] = useState("");
  useEffect(() => void setLocation(window.location.href), []);

  useEffect(() => {
    async function fetchMe() {
      try {
        const res = await fetch(`${API_BASE}/api/users/@me`, {
          credentials: "include",
        });
        if (res.status > 200) {
          return setUser(null);
        }

        const user = (await res.json()) as APIUser;
        setUser(user);
        setEiId(user.ei_id);
      } catch {
        setUser(null);
      }
    }
    fetchMe();
  }, []);

  const [status, setStatus] = useState("typing");
  const [error, setError] = useState<Error | null>(null);
  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    setError(null);
    e.preventDefault();
    setStatus("submitting");
    try {
      const res = await fetch(`${API_BASE}/api/users/@me/submit_eid`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ ei_id: eiId }),
        credentials: "include",
      });
      const json = await res.json();

      if (res.status > 200) {
        setStatus("typing");
        setError(new Error(json.message));

        return;
      }

      const user = json as APIUser;
      setUser(user);
      setEiId(user.ei_id);

      setStatus("success");
    } catch (err) {
      setStatus("typing");
      setError(err as Error);
    }
  }

  let inner = null;
  if (user === undefined) {
    inner = <p>Loading...</p>;
  }
  if (user === null) {
    inner = (
      <a
        className="btn"
        href={`${API_BASE}/api/oidc/login?redirect_to=${encodeURIComponent(
          location
        )}`}
      >
        Login
      </a>
    );
  }
  if (user !== null) {
    inner = (
      <div>
        <form onSubmit={handleSubmit}>
          <label className="input input-bordered flex items-center gap-2">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 16 16"
              fill="currentColor"
              className="w-4 h-4 opacity-70"
            >
              <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" />
            </svg>
            <input
              type="text"
              className="grow"
              placeholder="EIXXXXXXXXXXXXX"
              onChange={(e) => setEiId(e.target.value)}
              disabled={status === "submitting"}
            />
            <button
              className="btn btn-primary btn-sm"
              disabled={eiId?.length === 0 || status === "submitting"}
            >
              Save
            </button>
          </label>
          {error !== null && (
            <p className="alert alert-error">{error.message}</p>
          )}
        </form>
        <pre>{JSON.stringify(user, null, 2)}</pre>
      </div>
    );
  }

  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div className="max-w-4xl">
        <h1 className="text-4xl font-bold">EIDash</h1>
        <div className="flex flex-col items-center space-y-4 w-96 h-96">
          {inner || <p>Something went wrong</p>}
        </div>
      </div>
    </main>
  );
}
