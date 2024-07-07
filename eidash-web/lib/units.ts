import { trimTrailingZeros } from "./math";

// https://egg-inc.fandom.com/wiki/Order_of_Magnitude
export const units = [
  { symbol: "K", oom: 3 },
  { symbol: "M", oom: 6 },
  { symbol: "B", oom: 9 },
  { symbol: "T", oom: 12 },
  { symbol: "q", oom: 15 },
  { symbol: "Q", oom: 18 },
  { symbol: "s", oom: 21 },
  { symbol: "S", oom: 24 },
  { symbol: "o", oom: 27 },
  { symbol: "N", oom: 30 },
  { symbol: "d", oom: 33 },
  { symbol: "U", oom: 36 },
  { symbol: "D", oom: 39 },
  { symbol: "Td", oom: 42 },
  { symbol: "qd", oom: 45 },
  { symbol: "Qd", oom: 48 },
  { symbol: "sd", oom: 51 },
  { symbol: "Sd", oom: 54 },
  { symbol: "Od", oom: 57 },
  { symbol: "Nd", oom: 60 },
  { symbol: "V", oom: 63 },
  { symbol: "uV", oom: 66 },
  { symbol: "dV", oom: 69 },
  { symbol: "tV", oom: 72 },
  { symbol: "qV", oom: 75 },
  { symbol: "QV", oom: 78 },
  { symbol: "sV", oom: 81 },
  { symbol: "SV", oom: 84 },
  { symbol: "OV", oom: 87 },
  { symbol: "NV", oom: 90 },
  { symbol: "tT", oom: 93 },
];

const oom2symbol = new Map(units.map(({ oom, symbol }) => [oom, symbol]));
const symbol2oom = new Map(units.map(({ symbol, oom }) => [symbol, oom]));
const minOom = units[0].oom;
const maxOom = units[units.length - 1].oom;
export const valueWithUnitRegExpPattern = `\\b(?<value>\\d+(\\.(\\d+)?)?)\\s*(?<unit>${units
  .map(({ symbol }) => symbol)
  .join("|")})\\b`;
export const valueWithUnitRegExp = new RegExp(valueWithUnitRegExpPattern);
export const valueWithUnitRegExpGlobal = new RegExp(
  valueWithUnitRegExpPattern,
  "g"
);
export const valueWithUnitRegExpExact = new RegExp(
  `^${valueWithUnitRegExpPattern}$`
);
export const valueWithOptionalUnitRegExpPattern = `\\b(?<value>\\d+(\\.(\\d+)?)?)\\s*(?<unit>${units
  .map(({ symbol }) => symbol)
  .join("|")})?\\b`;
export const valueWithOptionalUnitRegExp = new RegExp(
  valueWithOptionalUnitRegExpPattern
);
export const valueWithOptionalUnitRegExpGlobal = new RegExp(
  valueWithOptionalUnitRegExpPattern,
  "g"
);
export const valueWithOptionalUnitRegExpExact = new RegExp(
  `^${valueWithOptionalUnitRegExpPattern}$`
);

export function parseValueWithUnit(input: string, unitRequired = true) {
  const match = (
    unitRequired ? valueWithUnitRegExpExact : valueWithOptionalUnitRegExpExact
  ).exec(input);
  if (match === null) {
    return null;
  }

  const value = match.groups!.value;
  const unit = match.groups!.unit;
  if (unit === undefined) {
    return Number.parseFloat(value);
  }

  return Number.parseFloat(value) * 10 ** symbol2oom.get(unit)!;
}

export function formatEIValue(
  x: number,
  options: { decimals?: number; scientific?: boolean; trim?: boolean } = {}
): string {
  const trim = options?.trim === undefined ? false : options?.trim;
  const decimals = options?.decimals === undefined ? 3 : options?.decimals;
  const scientific =
    options?.scientific === undefined ? false : options?.scientific;

  if (Number.isNaN(x)) {
    return "NaN";
  }

  if (x < 0) {
    return "-" + formatEIValue(-x, options);
  }

  if (!Number.isFinite(x)) {
    return "infinity";
  }

  const oom = Math.log10(x);
  if (oom < minOom) {
    // Always round small number to an integer.
    return x.toFixed(0);
  }

  let oomFloor = Math.floor(oom);
  if (oom + 1e-9 >= oomFloor + 1) {
    // Fix problem of 1q being displayed as 1000T, 1N displayed as 1000o, etc,
    // where the floor is one integer down due to floating point imprecision.
    oomFloor++;
  }

  oomFloor -= oomFloor % 3;
  if (oomFloor > maxOom) {
    oomFloor = maxOom;
  }

  const principal = x / 10 ** oomFloor;
  let numpart =
    principal < 1e21 ? principal.toFixed(decimals) : principal.toPrecision(4);
  if (trim) {
    numpart = trimTrailingZeros(numpart);
  }

  if (scientific) {
    return `${numpart}&times;10<sup>${oomFloor}</sup>`;
  }

  return numpart + oom2symbol.get(oomFloor);
}

export type FarmerRole = {
  oom: number;
  name: string;
  color: string;
};

export const farmerRoles: FarmerRole[] = [
  { oom: 0, name: "Farmer", color: "#d43500" },
  { oom: 1, name: "Farmer II", color: "#d14400" },
  { oom: 2, name: "Farmer III", color: "#cd5500" },
  { oom: 3, name: "Kilofarmer", color: "#ca6800" },
  { oom: 4, name: "Kilofarmer II", color: "#c77a00" },
  { oom: 5, name: "Kilofarmer III", color: "#c58a00" },
  { oom: 6, name: "Megafarmer", color: "#c49400" },
  { oom: 7, name: "Megafarmer II", color: "#c39f00" },
  { oom: 8, name: "Megafarmer III", color: "#c3a900" },
  { oom: 9, name: "Gigafarmer", color: "#c2b100" },
  { oom: 10, name: "Gigafarmer II", color: "#c2ba00" },
  { oom: 11, name: "Gigafarmer III", color: "#c2c200" },
  { oom: 12, name: "Terafarmer", color: "#aec300" },
  { oom: 13, name: "Terafarmer II", color: "#99c400" },
  { oom: 14, name: "Terafarmer III", color: "#85c600" },
  { oom: 15, name: "Petafarmer", color: "#51ce00" },
  { oom: 16, name: "Petafarmer II", color: "#16dc00" },
  { oom: 17, name: "Petafarmer III", color: "#00ec2e" },
  { oom: 18, name: "Exafarmer", color: "#00fa68" },
  { oom: 19, name: "Exafarmer II", color: "#0afc9c" },
  { oom: 20, name: "Exafarmer III", color: "#1cf7ca" },
  { oom: 21, name: "Zettafarmer", color: "#2af3eb" },
  { oom: 22, name: "Zettafarmer II", color: "#35d9f0" },
  { oom: 23, name: "Zettafarmer III", color: "#40bced" },
  { oom: 24, name: "Yottafarmer", color: "#46a8eb" },
  { oom: 25, name: "Yottafarmer II", color: "#4a9aea" },
  { oom: 26, name: "Yottafarmer III", color: "#4e8dea" },
  { oom: 27, name: "Xennafarmer", color: "#527ce9" },
  { oom: 28, name: "Xennafarmer II", color: "#5463e8" },
  { oom: 29, name: "Xennafarmer III", color: "#6155e8" },
  { oom: 30, name: "Weccafarmer", color: "#7952e9" },
  { oom: 31, name: "Weccafarmer II", color: "#8b4fe9" },
  { oom: 32, name: "Weccafarmer III", color: "#9d4aeb" },
  { oom: 33, name: "Vendafarmer", color: "#b343ec" },
  { oom: 34, name: "Vendafarmer II", color: "#d636ef" },
  { oom: 35, name: "Vendafarmer III", color: "#f327e5" },
  { oom: 36, name: "Uadafarmer", color: "#f915ba" },
  { oom: 37, name: "Uadafarmer II", color: "#fc0a9c" },
  { oom: 38, name: "Uadafarmer III", color: "#ff007d" },
  { oom: 39, name: "Treidafarmer", color: "#f7005d" },
  { oom: 40, name: "Treidafarmer II", color: "#f61fd2" },
  { oom: 41, name: "Treidafarmer III", color: "#9c4aea" },
  { oom: 42, name: "Quadafarmer", color: "#5559e8" },
  { oom: 43, name: "Quadafarmer II", color: "#4a9deb" },
  { oom: 44, name: "Quadafarmer III", color: "#2df0f2" },
  { oom: 45, name: "Pendafarmer", color: "#00f759" },
  { oom: 46, name: "Pendafarmer II", color: "#7ec700" },
  { oom: 47, name: "Pendafarmer III", color: "#c2bf00" },
  { oom: 48, name: "Exedafarmer", color: "#c3a000" },
  { oom: 49, name: "Exedafarmer II", color: "#c87200" },
  { oom: 50, name: "Exedafarmer III", color: "#d43500" },
  { oom: 51, name: "Infinifarmer", color: "#546e7a" },
];
