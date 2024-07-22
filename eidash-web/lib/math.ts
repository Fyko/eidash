import { BasicSave } from "./types";

// Trim trailing zeros, and possibly the decimal point.
export function trimTrailingZeros(input: string) {
  let trimmed = input.replace(/0+$/, "");
  if (trimmed.endsWith(".")) {
    trimmed = trimmed.slice(0, Math.max(0, trimmed.length - 1));
  }

  return trimmed;
}

// Calculate the MER with given Soul Egg count and Prophecy Egg count.
// `(((91 * (log10(SE) - 18)) + 200 - PE) / 10)`
export function calculateMer(row: BasicSave) {
  return (
    (91 * (Math.log10(row.soul_eggs) - 18) + 200 - row.eggs_of_prophecy) / 10
  );
}

// `(((0.1519*LOG(SE)^3 - 4.8517*LOG(SE)^2 + 48.248*LOG(SE) - 143.46)/PE)*100*PE+100*49)/(PE+100)`
export function calculateJer(row: BasicSave) {
  const se = row.soul_eggs;
  const pe = row.eggs_of_prophecy;

  return (
    (((0.1519 * Math.pow(Math.log10(se), 3) -
      4.8517 * Math.pow(Math.log10(se), 2) +
      48.248 * Math.log10(se) -
      143.46) /
      pe) *
      100 *
      pe +
      100 * 49) /
    (pe + 100)
  );
}
