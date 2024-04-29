"use client";

import { APIUser } from "@/actions/user";
import { useAuth } from "@/hooks/useAuth";
import { Check, Copy } from "@phosphor-icons/react";
import { useState } from "react";

export default function CopyUserProfileURLButton({ user }: { user: APIUser }) {
  const copyIcon = <Copy className="inline-block text-blue-400" />;
  const checkIcon = <Check className="inline-block text-green-400" />;

  const [icon, setIcon] = useState<React.ReactNode>(copyIcon);

  const clickAction = async () => {
    await navigator.clipboard.writeText(
      `${window.location.origin}/users/${user.id}`
    );
    setIcon(checkIcon);
    setTimeout(() => setIcon(copyIcon), 2000);
  };

  return <button onClick={clickAction}>{icon}</button>;
}
