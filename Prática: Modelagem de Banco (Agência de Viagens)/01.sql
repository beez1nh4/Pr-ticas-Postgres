/* link to drawing: https://dbdesigner.page.link/bCRucqnjE4L6EJCk7 */

CREATE DATABASE driventravelagency;

CREATE TABLE "companies" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL,
	"acronym" TEXT UNIQUE NOT NULL
);

CREATE TABLE "airports" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL,
	"acronym" TEXT UNIQUE NOT NULL
);

CREATE TABLE "flights" (
	id SERIAL PRIMARY KEY,
    "companyId" INTEGER NOT NULL REFERENCES "companies"("id"),
    "acronym" TEXT UNIQUE NOT NULL,
    "departureAirportId" INTEGER NOT NULL REFERENCES "airports"("id"),
    "destinationAirportId" INTEGER NOT NULL REFERENCES "airports"("id"),
	"departureTime" TIMESTAMP WITHOUT TIMEZONE NOT NULL DEFAULT NOW(),
    "arrivalTime" TIMESTAMP WITHOUT TIMEZONE NOT NULL
);