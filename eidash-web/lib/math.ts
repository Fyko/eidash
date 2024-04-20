// Trim trailing zeros, and possibly the decimal point.
export function trimTrailingZeros(input: string) {
  let trimmed = input.replace(/0+$/, "");
  if (trimmed.endsWith(".")) {
    trimmed = trimmed.slice(0, Math.max(0, trimmed.length - 1));
  }

  return trimmed;
}
