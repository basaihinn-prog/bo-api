CREATE TABLE "agent_balance_histories" (
	"id" serial PRIMARY KEY,
	"agentCode" varchar(255) DEFAULT '' NOT NULL,
	"agentBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"userBalanceSum" numeric(20,2) DEFAULT '0' NOT NULL,
	"childAgentBalanceSum" numeric(20,2) DEFAULT '0' NOT NULL,
	"childUserBalanceSum" numeric(20,2) DEFAULT '0' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "agent_balance_progresses" (
	"id" serial PRIMARY KEY,
	"agentCode" varchar(255) DEFAULT '' NOT NULL,
	"agentBalance" numeric(20,2),
	"comment" varchar(255) DEFAULT '' NOT NULL,
	"parentPath" varchar(255) DEFAULT '.' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "agent_login_histories" (
	"id" serial PRIMARY KEY,
	"agentCode" varchar(255) DEFAULT '' NOT NULL,
	"agentName" varchar(255),
	"ip" varchar(255),
	"country" varchar(255),
	"region" varchar(255),
	"city" varchar(255),
	"loc" varchar(255),
	"org" varchar(255),
	"postal" varchar(255),
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "agent_transactions" (
	"id" serial PRIMARY KEY,
	"parentCode" varchar(255) DEFAULT '' NOT NULL,
	"agentCode" varchar(255) DEFAULT '' NOT NULL,
	"chargeType" integer,
	"chargeAmount" numeric(20,2) DEFAULT '0' NOT NULL,
	"parentPrevBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"parentAfterBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"agentPrevBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"agentAfterBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"status" integer,
	"parentPath" varchar(255) DEFAULT '' NOT NULL,
	"memo" varchar(255) DEFAULT '' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "agents" (
	"id" serial PRIMARY KEY,
	"parentId" integer DEFAULT 0 NOT NULL,
	"agentCode" varchar(255) DEFAULT '' NOT NULL,
	"agentName" varchar(255) DEFAULT '' NOT NULL,
	"agentType" integer DEFAULT 0 NOT NULL,
	"password" varchar(255) DEFAULT '' NOT NULL,
	"percent" numeric(20,2) DEFAULT '0' NOT NULL,
	"currency" varchar(255),
	"zeroSetting" varchar(255),
	"curShow" integer DEFAULT 0 NOT NULL,
	"betEdited" integer DEFAULT 0 NOT NULL,
	"minBet" numeric(20,2) DEFAULT '0' NOT NULL,
	"maxBet" numeric(20,2) DEFAULT '0' NOT NULL,
	"memo" varchar(255),
	"adminMemo" varchar(255),
	"apiType" integer DEFAULT 0 NOT NULL,
	"role" integer DEFAULT 0 NOT NULL,
	"token" varchar(255) DEFAULT '',
	"secretKey" varchar(255) DEFAULT '' NOT NULL,
	"depth" varchar(255) DEFAULT '' NOT NULL,
	"parentPath" varchar(255) DEFAULT '' NOT NULL,
	"balance" numeric(20,2) DEFAULT '0' NOT NULL,
	"siteEndPoint" varchar(255),
	"ipAddress" varchar(255),
	"blockOppositeBet" integer DEFAULT 0 NOT NULL,
	"blockRedEnvelope" integer DEFAULT 0 NOT NULL,
	"betLimitSkin" varchar(255) DEFAULT 'SKIN1' NOT NULL,
	"status" integer DEFAULT 0 NOT NULL,
	"rtp" numeric(20,2) DEFAULT '0' NOT NULL,
	"actshow" integer DEFAULT 1 NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "calls" (
	"id" serial PRIMARY KEY,
	"agentCode" varchar(255) NOT NULL,
	"userCode" varchar(255) NOT NULL,
	"providerCode" varchar(255) NOT NULL,
	"gameCode" varchar(255) NOT NULL,
	"serverCallId" integer NOT NULL,
	"bet" numeric(20,2) DEFAULT '0' NOT NULL,
	"userPrev" numeric(20,2),
	"userAfter" numeric(20,2),
	"agentPrev" numeric(20,2),
	"agentAfter" numeric(20,2),
	"expect" numeric(20,2),
	"missed" numeric(20,2),
	"real" numeric(20,2),
	"rtp" numeric(10,0) NOT NULL,
	"type" integer NOT NULL,
	"status" integer DEFAULT 0 NOT NULL,
	"msg" varchar(255),
	"parentPath" varchar(255) DEFAULT '.' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "checkups" (
	"id" serial PRIMARY KEY,
	"content" text DEFAULT '' NOT NULL,
	"status" integer DEFAULT 0 NOT NULL,
	"startTime" varchar(255) DEFAULT '' NOT NULL,
	"endTime" varchar(255) DEFAULT '' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "currencies" (
	"id" serial PRIMARY KEY,
	"code" varchar(255) NOT NULL,
	"status" integer DEFAULT 1,
	"config" text,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "live_game_transactions" (
	"id" serial PRIMARY KEY,
	"agentCode" varchar(255) DEFAULT '' NOT NULL,
	"userCode" varchar(255) DEFAULT '' NOT NULL,
	"providerCode" varchar(255) DEFAULT '' NOT NULL,
	"gameCode" varchar(255) DEFAULT '' NOT NULL,
	"type" varchar(255) DEFAULT '' NOT NULL,
	"bet" numeric(20,2) DEFAULT '0' NOT NULL,
	"win" numeric(20,2) DEFAULT '0' NOT NULL,
	"txnId" varchar(255) DEFAULT '' NOT NULL,
	"txnType" varchar(255) DEFAULT '' NOT NULL,
	"agentStartBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"agentEndBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"userStartBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"userEndBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"parentPath" varchar(255) DEFAULT '' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "messages" (
	"id" serial PRIMARY KEY,
	"senderCode" varchar(255) DEFAULT '' NOT NULL,
	"receiverCode" varchar(255) DEFAULT '' NOT NULL,
	"messageTitle" varchar(255) DEFAULT '' NOT NULL,
	"messageContent" text DEFAULT '' NOT NULL,
	"readStatus" integer DEFAULT 0 NOT NULL,
	"answerContent" text DEFAULT '' NOT NULL,
	"answerStatus" integer DEFAULT 0 NOT NULL,
	"parentPath" varchar(255) DEFAULT '' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "players" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid(),
	"userId" varchar(255) NOT NULL,
	"agentCode" varchar(255) NOT NULL,
	"userCode" varchar(255) NOT NULL,
	"providerCode" varchar(255) NOT NULL,
	"gameCode" varchar(255) NOT NULL,
	"lastBet" numeric(20,2),
	"lastWin" numeric(20,2),
	"status" varchar(255),
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE "popups" (
	"id" serial PRIMARY KEY,
	"content" text DEFAULT '' NOT NULL,
	"status" integer DEFAULT 0 NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "provider_spending" (
	"id" serial PRIMARY KEY,
	"providerCode" varchar(255) NOT NULL,
	"betCount" integer DEFAULT 0 NOT NULL,
	"winCount" integer DEFAULT 0 NOT NULL,
	"betAmount" numeric(20,2) DEFAULT '0' NOT NULL,
	"winAmount" numeric(20,2) DEFAULT '0' NOT NULL,
	"spendingAmount" numeric(20,2) DEFAULT '0' NOT NULL,
	"callCount" integer DEFAULT 0 NOT NULL,
	"callBetAmount" numeric(20,2) DEFAULT '0' NOT NULL,
	"callWinAmount" numeric(20,2) DEFAULT '0' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "providers" (
	"id" serial PRIMARY KEY,
	"code" varchar(255) NOT NULL,
	"name" varchar(255) NOT NULL,
	"type" varchar(255) NOT NULL,
	"endpoint" varchar(255) NOT NULL,
	"totalGames" varchar(255),
	"runningGames" varchar(255),
	"checkingGames" varchar(255),
	"status" integer DEFAULT 1,
	"config" text,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "slot_game_transactions" (
	"id" serial PRIMARY KEY,
	"agentCode" varchar(255) DEFAULT '' NOT NULL,
	"userCode" varchar(255) DEFAULT '' NOT NULL,
	"providerCode" varchar(255) DEFAULT '' NOT NULL,
	"gameCode" varchar(255) DEFAULT '' NOT NULL,
	"type" varchar(255) DEFAULT '' NOT NULL,
	"bet" numeric(20,2) DEFAULT '0' NOT NULL,
	"win" numeric(20,2) DEFAULT '0' NOT NULL,
	"txnId" varchar(255) DEFAULT '' NOT NULL,
	"txnType" varchar(255) DEFAULT '' NOT NULL,
	"agentStartBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"agentEndBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"userStartBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"userEndBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"parentPath" varchar(255) DEFAULT '' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "user_balance_progresses" (
	"id" serial PRIMARY KEY,
	"agentCode" varchar(255) DEFAULT '' NOT NULL,
	"userCode" varchar(255) DEFAULT '' NOT NULL,
	"userBalance" numeric(20,2),
	"comment" varchar(255) DEFAULT '' NOT NULL,
	"parentPath" varchar(255) DEFAULT '.' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "user_transactions" (
	"id" serial PRIMARY KEY,
	"agentCode" varchar(255) DEFAULT '' NOT NULL,
	"userCode" varchar(255) DEFAULT '' NOT NULL,
	"chargeType" integer,
	"chargeAmount" numeric(20,2) DEFAULT '0' NOT NULL,
	"agentPrevBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"agentAfterBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"userPrevBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"userAfterBalance" numeric(20,2) DEFAULT '0' NOT NULL,
	"status" integer,
	"parentPath" varchar(255) DEFAULT '' NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" serial PRIMARY KEY,
	"agentCode" varchar(255) DEFAULT '' NOT NULL,
	"userCode" varchar(255) DEFAULT '' NOT NULL,
	"targetRtp" integer DEFAULT 80 NOT NULL,
	"realRtp" numeric(20,2) DEFAULT '0' NOT NULL,
	"balance" numeric(20,2) DEFAULT '0' NOT NULL,
	"aasUserCode" varchar(255) DEFAULT '' NOT NULL,
	"status" integer DEFAULT 1 NOT NULL,
	"parentPath" varchar(255) DEFAULT '' NOT NULL,
	"totalDebit" numeric(20,2) DEFAULT '0' NOT NULL,
	"totalCredit" numeric(20,2) DEFAULT '0' NOT NULL,
	"apiType" integer DEFAULT 1 NOT NULL,
	"createdAt" timestamp DEFAULT now(),
	"updatedAt" timestamp DEFAULT now()
);
