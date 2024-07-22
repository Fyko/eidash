"use client";

import { createContext, useContext, useState } from "react";

const AccountIdContext = createContext<ReturnType<typeof useProvideAccountId>>({
  accountId: undefined,
  setAccountId: async () => {},
});

export function AccountIdProvider({ children }: { children: React.ReactNode }) {
  const provider = useProvideAccountId();

  return (
    <AccountIdContext.Provider value={provider}>
      {children}
    </AccountIdContext.Provider>
  );
}

export const useAccountId = () => useContext(AccountIdContext);

export const useProvideAccountId = () => {
  const [accountId, setAccountId] = useState<string | undefined>(undefined);

  return {
    accountId,
    setAccountId,
  };
};
