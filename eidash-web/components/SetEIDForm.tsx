"use client";

import { useAuth } from "@/hooks/useAuth";
import { UserIcon } from "@heroicons/react/24/solid";
import { useState, useTransition } from "react";

export default function SetEIDForm() {
  const auth = useAuth();
  const [eiId, setEiId] = useState("");
  const [error, setError] = useState<Error | null>(null);
  const [isPending, startTransition] = useTransition();

  async function saveAction(formData: FormData): Promise<void> {
    const eid = formData.get("ei_id") as string;

    startTransition(async () => {
      const res = await fetch("/api/users/@me/submit_eid", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ ei_id: eid }),
        credentials: "include",
      });
      const json = await res.json();

      if (res.status > 200) {
        setError(new Error(json.message));
        return json;
      }

      await auth.updateUser();

      return json;
    });
  }

  return (
    <form action={saveAction}>
      <label className="input input-bordered flex items-center gap-2 w-3/5">
        <UserIcon className="w-5 h-5" />
        <input
          name="ei_id"
          type="text"
          className="grow"
          placeholder="EIXXXXXXXXXXXXX"
          onChange={(e) => setEiId(e.target.value)}
          disabled={isPending}
        />
        <button
          className="btn btn-primary btn-sm"
          disabled={eiId?.length === 0 || isPending}
        >
          Save
        </button>
      </label>
      {error !== null && <p className="alert alert-error">{error.message}</p>}
    </form>
  );
}
