export function getLocalStorage(key: string, prefix?: string) {
  const checkedPrefix = prefix ?? `${window.location.pathname}_`;

  try {
    return localStorage.getItem(checkedPrefix + key);
  } catch (error) {
    console.error(error);
    return undefined;
  }
}

export function getLocalStorageNoPrefix(key: string) {
  return getLocalStorage(key, "");
}

export function setLocalStorage(key: string, val: string, prefix?: string) {
  const checkedPrefix = prefix ?? `${window.location.pathname}_`;

  try {
    localStorage.setItem(checkedPrefix + key, val);

    return true;
  } catch (error) {
    console.error(error);
  }
}

export function setLocalStorageNoPrefix(key: string, val: string) {
  setLocalStorage(key, val, "");
}
