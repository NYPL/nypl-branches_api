CREATE TABLE "branches" (
  "branch_id" integer NOT NULL PRIMARY KEY,
  "loc_id" integer NOT NULL,
  "symbol" varchar(50) NOT NULL,
  "name" text,
  "address" varchar(255) DEFAULT NULL,
  "xstreet" varchar(255) DEFAULT NULL,
  "city" varchar(255) DEFAULT NULL,
  "zipcode" varchar(10) DEFAULT NULL,
  "longitude" float DEFAULT NULL,
  "latitude" float DEFAULT NULL,
  "created" timestamptz NOT NULL,
  "modified" timestamptz DEFAULT NULL
);

CREATE UNIQUE INDEX branches_bl ON branches (branch_id, loc_id);
CREATE INDEX branches_locs ON branches (loc_id);

CREATE TABLE "floors" (
  "floor_id" integer NOT NULL PRIMARY KEY,
  "loc_id" integer DEFAULT NULL,
  "branch_id" integer NOT NULL,
  "name" varchar(255) NOT NULL,
  "description" text,
  "created" timestamptz NOT NULL,
  "modified" timestamptz DEFAULT NULL,
  "order" smallint DEFAULT '0'
);

CREATE UNIQUE INDEX floors_bid ON floors ("floor_id", "branch_id");

CREATE TABLE "rooms" (
  "room_id" integer NOT NULL PRIMARY KEY,
  "loc_id" integer DEFAULT NULL,
  "floor_id" integer NOT NULL,
  "name" varchar(255) NOT NULL,
  "description" text,
  "created" timestamptz NOT NULL,
  "modified" timestamptz DEFAULT NULL,
  "order" smallint DEFAULT '0'
);

CREATE TABLE "locations" (
  "loc_id" integer NOT NULL PRIMARY KEY,
  "name" text,
  "description" text,
  "phone" varchar(10) DEFAULT NULL,
  "fax" varchar(10) DEFAULT NULL,
  "tty" varchar(10) DEFAULT NULL,
  "email" varchar(255) DEFAULT NULL,
  "handicapped_access" smallint DEFAULT NULL,
  "activities" varchar(255) DEFAULT NULL,
  "created" timestamptz NOT NULL,
  "modified" timestamptz DEFAULT NULL,
  "amenities" varchar(2000) DEFAULT NULL,
  "socialmedia" varchar(2000) DEFAULT NULL,
  "floorplan" varchar(2000) DEFAULT NULL,
  "division_referral" varchar(500) DEFAULT NULL
);

