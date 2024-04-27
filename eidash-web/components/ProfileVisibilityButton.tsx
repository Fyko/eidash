import { useAuth } from "@/hooks/useAuth";
import { useTransition } from "react";

export default function ProfileVisibilityButton() {
  const auth = useAuth();
  const [isPending, startTransition] = useTransition();

  const submitAction = () => {
    startTransition(async () => {
      await fetch("/api/users/@me/toggle_visibility", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
      });

      await auth.updateUser();
    });
  };

  return (
    <button
      className="btn btn-primary btn-sm"
      disabled={isPending}
      onClick={submitAction}
    >
      Switch to{" "}
      {auth.user?.profile_visibility === "private" ? "public" : "private"}
    </button>
  );
}
