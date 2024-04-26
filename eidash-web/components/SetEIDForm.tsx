import { useState, useTransition } from "react";

export default function SetEIDForm() {
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

      return json;
    });
  }

  return (
    <form action={saveAction}>
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
