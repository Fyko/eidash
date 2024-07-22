"use client";

import { useAccountId } from "@/hooks/useAccountId";
import { APIAccount, APIUser } from "@/lib/types";
import { ChangeEventHandler, useRef, useState } from "react";
import SetEIDForm from "./SetEIDForm";

export function AccountSelecter({
  user,
  onChange,
}: {
  user: APIUser;
  onChange: (account: APIAccount | null | undefined) => void;
}) {
  const { accountId, setAccountId } = useAccountId();
  const modalRef = useRef<HTMLDialogElement>(null);

  const handleChange: ChangeEventHandler<HTMLSelectElement> = (
    e: React.ChangeEvent<HTMLSelectElement>
  ) => {
    if (e.target.value === "addAccount") {
      // Reset the select element to its previous state
      e.target.value = accountId!;
      modalRef.current?.showModal();
    } else {
      setAccountId(e.target.value);
      onChange(user.accounts.find((a) => a.id === e.target.value)!);
    }
  };

  return (
    <>
      <select
        className="select select-ghost max-w-xs text-2xl"
        value={accountId}
        onChange={handleChange}
      >
        {user?.accounts.map((account) => (
          <option key={account.id} value={account.id}>
            {account.username}
          </option>
        ))}
        <option value="addAccount">+ Add Account</option>
      </select>

      <dialog ref={modalRef} className="modal" id="my_modal_2">
        <div className="modal-box">
          <form method="dialog">
            <button className="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">
              ✕
            </button>
          </form>
          <h3 className="text-2xl font-bold">Add a new account</h3>
          <SetEIDForm />
        </div>
        <form method="dialog" className="modal-backdrop">
          <button>close</button>
        </form>
      </dialog>
    </>
  );
}
