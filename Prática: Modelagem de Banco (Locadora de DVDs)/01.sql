CREATE DATABASE drivencourse;

CREATE TABLE "categories" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "countries" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "streets" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "neighborhoods" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "states" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "cities" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "phones" (
	"id" serial PRIMARY KEY,
	"phone" VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE "avaliationsAttendance" (
	"id" serial PRIMARY KEY,
	"grade" VARCHAR(2) UNIQUE NOT NULL
);

CREATE TABLE "avaliationsDvd" (
	"id" serial PRIMARY KEY,
	"grade" VARCHAR(2) UNIQUE NOT NULL
);

CREATE TABLE "dvds" (
	"id" serial PRIMARY KEY,
	"number" INTEGER UNIQUE NOT NULL,
    "barCode" TEXT UNIQUE NOT NULL,
	"categoryId" INTEGER NOT NULL REFERENCES "categories"("id"),
    "name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "addresses" (
	"id" serial PRIMARY KEY,
    "streetId" INTEGER NOT NULL REFERENCES "streets"("id"),
	"number" INTEGER NOT NULL,
    "complement" TEXT,
	"neighborhoodId" INTEGER NOT NULL REFERENCES "neighborhoods"("id"),
    "CEP" INTEGER UNIQUE NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id"),
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "clients" (
	"id" serial PRIMARY KEY,
	"addressId" INTEGER NOT NULL REFERENCES "addresses"("id"),
    "name" TEXT UNIQUE NOT NULL,
    "cpf" VARCHAR(11) UNIQUE NOT NULL,
    "phoneId" INTEGER NOT NULL REFERENCES "phones"("id")
);

CREATE TABLE "actors" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL,
    "birthDate" DATE NOT NULL,
	"countryId" INTEGER NOT NULL REFERENCES "countries"("id")
);

CREATE TABLE "dvdActors" (
	"id" serial PRIMARY KEY,
	"actorId" INTEGER NOT NULL REFERENCES "actors"("id"),
    "dvdId" INTEGER NOT NULL REFERENCES "dvds"("id")
);

CREATE TABLE "rentals" (
	"id" serial PRIMARY KEY,
	"startDate" DATE NOT NULL,
    "endDate" DATE NOT NULL,
	"clientId" INTEGER NOT NULL REFERENCES "clients"("id"),
    "dvdId" INTEGER NOT NULL REFERENCES "dvds"("id"),
    "avaliationDvdId" INTEGER NOT NULL REFERENCES "avaliationsDvd"("id"),
    "avaliationAttendanceId" INTEGER NOT NULL REFERENCES "avaliationsAttendance"("id")
);