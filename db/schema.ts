import { integer, numeric, pgTable, serial, text, timestamp, uuid, varchar } from "drizzle-orm/pg-core";

const timestamps = {
  createdAt: timestamp("createdAt").defaultNow(),
  updatedAt: timestamp("updatedAt").defaultNow(),
};

const money = (name: string) => numeric(name, { precision: 20, scale: 2 }).notNull().default("0");
const nullableMoney = (name: string) => numeric(name, { precision: 20, scale: 2 });
const requiredText = (name: string, defaultValue = "") => text(name).notNull().default(defaultValue);
const requiredVarchar = (name: string, defaultValue = "") => varchar(name, { length: 255 }).notNull().default(defaultValue);

export const agents = pgTable("agents", {
  id: serial("id").primaryKey(),
  parentId: integer("parentId").notNull().default(0),
  agentCode: requiredVarchar("agentCode"),
  agentName: requiredVarchar("agentName"),
  agentType: integer("agentType").notNull().default(0),
  password: requiredVarchar("password"),
  percent: money("percent"),
  currency: varchar("currency", { length: 255 }),
  zeroSetting: varchar("zeroSetting", { length: 255 }),
  curShow: integer("curShow").notNull().default(0),
  betEdited: integer("betEdited").notNull().default(0),
  minBet: money("minBet"),
  maxBet: money("maxBet"),
  memo: varchar("memo", { length: 255 }),
  adminMemo: varchar("adminMemo", { length: 255 }),
  apiType: integer("apiType").notNull().default(0),
  role: integer("role").notNull().default(0),
  token: varchar("token", { length: 255 }).default(""),
  secretKey: requiredVarchar("secretKey"),
  depth: requiredVarchar("depth"),
  parentPath: requiredVarchar("parentPath"),
  balance: money("balance"),
  siteEndPoint: varchar("siteEndPoint", { length: 255 }),
  ipAddress: varchar("ipAddress", { length: 255 }),
  blockOppositeBet: integer("blockOppositeBet").notNull().default(0),
  blockRedEnvelope: integer("blockRedEnvelope").notNull().default(0),
  betLimitSkin: requiredVarchar("betLimitSkin", "SKIN1"),
  status: integer("status").notNull().default(0),
  rtp: money("rtp"),
  actshow: integer("actshow").notNull().default(1),
  ...timestamps,
});

export const users = pgTable("users", {
  id: serial("id").primaryKey(),
  agentCode: requiredVarchar("agentCode"),
  userCode: requiredVarchar("userCode"),
  targetRtp: integer("targetRtp").notNull().default(80),
  realRtp: money("realRtp"),
  balance: money("balance"),
  aasUserCode: requiredVarchar("aasUserCode"),
  status: integer("status").notNull().default(1),
  parentPath: requiredVarchar("parentPath"),
  totalDebit: money("totalDebit"),
  totalCredit: money("totalCredit"),
  apiType: integer("apiType").notNull().default(1),
  ...timestamps,
});

export const players = pgTable("players", {
  id: uuid("id").defaultRandom().primaryKey(),
  userId: varchar("userId", { length: 255 }).notNull(),
  agentCode: varchar("agentCode", { length: 255 }).notNull(),
  userCode: varchar("userCode", { length: 255 }).notNull(),
  providerCode: varchar("providerCode", { length: 255 }).notNull(),
  gameCode: varchar("gameCode", { length: 255 }).notNull(),
  lastBet: nullableMoney("lastBet"),
  lastWin: nullableMoney("lastWin"),
  status: varchar("status", { length: 255 }),
  createdAt: timestamp("createdAt").defaultNow(),
  updatedAt: timestamp("updatedAt").notNull(),
});

export const providers = pgTable("providers", {
  id: serial("id").primaryKey(),
  code: varchar("code", { length: 255 }).notNull(),
  name: varchar("name", { length: 255 }).notNull(),
  type: varchar("type", { length: 255 }).notNull(),
  endpoint: varchar("endpoint", { length: 255 }).notNull(),
  totalGames: varchar("totalGames", { length: 255 }),
  runningGames: varchar("runningGames", { length: 255 }),
  checkingGames: varchar("checkingGames", { length: 255 }),
  status: integer("status").default(1),
  config: text("config"),
  ...timestamps,
});

export const currencies = pgTable("currencies", {
  id: serial("id").primaryKey(),
  code: varchar("code", { length: 255 }).notNull(),
  status: integer("status").default(1),
  config: text("config"),
  ...timestamps,
});

export const calls = pgTable("calls", {
  id: serial("id").primaryKey(),
  agentCode: varchar("agentCode", { length: 255 }).notNull(),
  userCode: varchar("userCode", { length: 255 }).notNull(),
  providerCode: varchar("providerCode", { length: 255 }).notNull(),
  gameCode: varchar("gameCode", { length: 255 }).notNull(),
  serverCallId: integer("serverCallId").notNull(),
  bet: money("bet"),
  userPrev: nullableMoney("userPrev"),
  userAfter: nullableMoney("userAfter"),
  agentPrev: nullableMoney("agentPrev"),
  agentAfter: nullableMoney("agentAfter"),
  expect: nullableMoney("expect"),
  missed: nullableMoney("missed"),
  real: nullableMoney("real"),
  rtp: numeric("rtp", { precision: 10, scale: 0 }).notNull(),
  type: integer("type").notNull(),
  status: integer("status").notNull().default(0),
  msg: varchar("msg", { length: 255 }),
  parentPath: requiredVarchar("parentPath", "."),
  ...timestamps,
});

export const messages = pgTable("messages", {
  id: serial("id").primaryKey(),
  senderCode: requiredVarchar("senderCode"),
  receiverCode: requiredVarchar("receiverCode"),
  messageTitle: requiredVarchar("messageTitle"),
  messageContent: requiredText("messageContent"),
  readStatus: integer("readStatus").notNull().default(0),
  answerContent: requiredText("answerContent"),
  answerStatus: integer("answerStatus").notNull().default(0),
  parentPath: requiredVarchar("parentPath"),
  ...timestamps,
});

export const checkups = pgTable("checkups", {
  id: serial("id").primaryKey(),
  content: requiredText("content"),
  status: integer("status").notNull().default(0),
  startTime: requiredVarchar("startTime"),
  endTime: requiredVarchar("endTime"),
  ...timestamps,
});

export const popups = pgTable("popups", {
  id: serial("id").primaryKey(),
  content: requiredText("content"),
  status: integer("status").notNull().default(0),
  ...timestamps,
});

export const agentBalanceHistories = pgTable("agent_balance_histories", {
  id: serial("id").primaryKey(),
  agentCode: requiredVarchar("agentCode"),
  agentBalance: money("agentBalance"),
  userBalanceSum: money("userBalanceSum"),
  childAgentBalanceSum: money("childAgentBalanceSum"),
  childUserBalanceSum: money("childUserBalanceSum"),
  ...timestamps,
});

export const agentBalanceProgresses = pgTable("agent_balance_progresses", {
  id: serial("id").primaryKey(),
  agentCode: requiredVarchar("agentCode"),
  agentBalance: nullableMoney("agentBalance"),
  comment: requiredVarchar("comment"),
  parentPath: requiredVarchar("parentPath", "."),
  ...timestamps,
});

export const userBalanceProgresses = pgTable("user_balance_progresses", {
  id: serial("id").primaryKey(),
  agentCode: requiredVarchar("agentCode"),
  userCode: requiredVarchar("userCode"),
  userBalance: nullableMoney("userBalance"),
  comment: requiredVarchar("comment"),
  parentPath: requiredVarchar("parentPath", "."),
  ...timestamps,
});

export const agentLoginHistories = pgTable("agent_login_histories", {
  id: serial("id").primaryKey(),
  agentCode: requiredVarchar("agentCode"),
  agentName: varchar("agentName", { length: 255 }),
  ip: varchar("ip", { length: 255 }),
  country: varchar("country", { length: 255 }),
  region: varchar("region", { length: 255 }),
  city: varchar("city", { length: 255 }),
  loc: varchar("loc", { length: 255 }),
  org: varchar("org", { length: 255 }),
  postal: varchar("postal", { length: 255 }),
  ...timestamps,
});

export const agentTransactions = pgTable("agent_transactions", {
  id: serial("id").primaryKey(),
  parentCode: requiredVarchar("parentCode"),
  agentCode: requiredVarchar("agentCode"),
  chargeType: integer("chargeType"),
  chargeAmount: money("chargeAmount"),
  parentPrevBalance: money("parentPrevBalance"),
  parentAfterBalance: money("parentAfterBalance"),
  agentPrevBalance: money("agentPrevBalance"),
  agentAfterBalance: money("agentAfterBalance"),
  status: integer("status"),
  parentPath: requiredVarchar("parentPath"),
  memo: requiredVarchar("memo"),
  ...timestamps,
});

export const userTransactions = pgTable("user_transactions", {
  id: serial("id").primaryKey(),
  agentCode: requiredVarchar("agentCode"),
  userCode: requiredVarchar("userCode"),
  chargeType: integer("chargeType"),
  chargeAmount: money("chargeAmount"),
  agentPrevBalance: money("agentPrevBalance"),
  agentAfterBalance: money("agentAfterBalance"),
  userPrevBalance: money("userPrevBalance"),
  userAfterBalance: money("userAfterBalance"),
  status: integer("status"),
  parentPath: requiredVarchar("parentPath"),
  ...timestamps,
});

export const providerSpending = pgTable("provider_spending", {
  id: serial("id").primaryKey(),
  providerCode: varchar("providerCode", { length: 255 }).notNull(),
  betCount: integer("betCount").notNull().default(0),
  winCount: integer("winCount").notNull().default(0),
  betAmount: money("betAmount"),
  winAmount: money("winAmount"),
  spendingAmount: money("spendingAmount"),
  callCount: integer("callCount").notNull().default(0),
  callBetAmount: money("callBetAmount"),
  callWinAmount: money("callWinAmount"),
  ...timestamps,
});

const gameTransactionColumns = {
  id: serial("id").primaryKey(),
  agentCode: requiredVarchar("agentCode"),
  userCode: requiredVarchar("userCode"),
  providerCode: requiredVarchar("providerCode"),
  gameCode: requiredVarchar("gameCode"),
  type: requiredVarchar("type"),
  bet: money("bet"),
  win: money("win"),
  txnId: requiredVarchar("txnId"),
  txnType: requiredVarchar("txnType"),
  agentStartBalance: money("agentStartBalance"),
  agentEndBalance: money("agentEndBalance"),
  userStartBalance: money("userStartBalance"),
  userEndBalance: money("userEndBalance"),
  parentPath: requiredVarchar("parentPath"),
  ...timestamps,
};

export const slotGameTransactions = pgTable("slot_game_transactions", gameTransactionColumns);
export const liveGameTransactions = pgTable("live_game_transactions", gameTransactionColumns);
