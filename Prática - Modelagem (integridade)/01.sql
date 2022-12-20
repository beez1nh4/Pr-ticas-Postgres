CREATE DATABASE integrity;

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
    "fullName" VARCHAR(40) NOT NULL,
    cpf TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

CREATE TABLE states (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
);

CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE customerAddresses (
	id SERIAL PRIMARY KEY,
    "customerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
    street VARCHAR(40) NOT NULL,
    "number" INTEGER NOT NULL,
    complement VARCHAR(40),
    "postalCode" INTEGER NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE customerPhones (
	id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "number" INTEGER NOT NULL,
    type VARCHAR(40) NOT NULL,
);

CREATE TABLE bankAccount (
	id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" INTEGER NOT NULL,
    agency INTEGER NOT NULL,
    "openDate" TIMESTAMP WITHOUT TIMEZONE NOT NULL,
    "closeDate" TIMESTAMP WITHOUT TIMEZONE
);

CREATE TABLE transactions (
	id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    amount INTEGER NOT NULL,
    type VARCHAR(40) NOT NULL,
    time TIMESTAMP WITHOUT TIMEZONE NOT NULL DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE creditCards (
	id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    name VARCHAR(20) NOT NULL,
    "number" INTEGER NOT NULL,
    "securityCode" INTEGER NOT NULL,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    password INTEGER NOT NULL,
    limit INTEGER
);
