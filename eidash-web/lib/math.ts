import { BasicSaveV1Row } from "@/actions/user";

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
export function calculateMer(row: BasicSaveV1Row) {
  return (
    (91 * (Math.log10(row.soul_eggs) - 18) + 200 - row.eggs_of_prophecy) / 10
  );
}
