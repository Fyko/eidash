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
      const res = await fetch("/api/accounts", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ eid }),
        credentials: "include",
      });

      if (res.status > 200) {
        const json = await res.json();
        setError(new Error(json.message));
        return json;
      }

      return window.location.reload();
    });
  }

  return (
    <form action={saveAction} className="pt-4">
      <label className="input input-bordered flex items-center gap-2 w-fullt">
        <UserIcon className="w-5 h-5" />
        <input
          name="ei_id"
          type="text"
          className="grow"
          placeholder="EI1234567890123456"
          onChange={(e) => setEiId(e.target.value)}
          disabled={isPending}
        />
        <button
          className="btn btn-primary btn-sm"
          disabled={eiId?.length < 18 || isPending}
        >
          Create
        </button>
      </label>
      {error !== null && <p className="alert alert-error">{error.message}</p>}
    </form>
  );
}
