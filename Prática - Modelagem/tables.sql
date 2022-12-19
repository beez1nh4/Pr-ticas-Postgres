/* link to drawing: https://dbdesigner.page.link/4WoMkSWnGnJJ7GBf8 */

CREATE DATABASE modeling;

CREATE TABLE "clients" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL
);

CREATE TABLE "categories" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "products" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
	"categoryId" INTEGER NOT NULL REFERENCES "categories"("id"),
	"size" TEXT NOT NULL
);


CREATE TABLE "images" (
	id SERIAL PRIMARY KEY,
	"productId" INTEGER NOT NULL REFERENCES "products"("id"),
    "leadImage" BOOLEAN NOT NULL DEFAULT FALSE,
	"url" TEXT NOT NULL
);

CREATE TABLE "purchases" (
	id SERIAL PRIMARY KEY,
    "clientId" INTEGER NOT NULL REFERENCES "clients"("id"),
	"status" TEXT NOT NULL,
	"date" TIMESTAMP NOT NULL DEFAULT NOW(),
	"address" TEXT NOT NULL
);

CREATE TABLE "orders" (
	id SERIAL PRIMARY KEY,
	"purchaseId" INTEGER NOT NULL REFERENCES "purchases"("id"),
    "productId" INTEGER NOT NULL REFERENCES "products"("id"),
	"quantity" INTEGER NOT NULL
);