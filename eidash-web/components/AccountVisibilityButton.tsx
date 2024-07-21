"use client";

import { APIAccount } from "@/lib/types";
import { useTransition } from "react";

export default function AccountVisibilityButton({
  account,
}: {
  account: APIAccount;
}) {
  const [isPending, startTransition] = useTransition();

  const submitAction = () => {
    startTransition(async () => {
      await fetch("/api/accounts/${account.id}/toggle_visibility", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
      });
    });
  };

  return (
    <button
      className="btn btn-primary btn-sm"
      disabled={isPending}
      onClick={submitAction}
    >
      Switch to {account?.visibility === "private" ? "public" : "private"}
    </button>
  );
}
