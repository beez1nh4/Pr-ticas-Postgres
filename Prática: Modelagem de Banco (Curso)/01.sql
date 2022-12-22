CREATE DATABASE drivencourse;

CREATE TABLE "classes" (
	"id" serial PRIMARY KEY,
	"code" TEXT UNIQUE NOT NULL
);

CREATE TABLE "modules" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "projects" (
	"id" serial PRIMARY KEY,
	"name" TEXT UNIQUE NOT NULL,
	"moduleId" INTEGER NOT NULL REFERENCES "modules"("id")
);

CREATE TABLE "students" (
	"id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "cpf" VARCHAR(11) UNIQUE NOT NULL,
	"email" TEXT UNIQUE NOT NULL,
	"presentClassId" INTEGER NOT NULL REFERENCES "classes"("id"),
	"presentTimeOfAdmission" TIMESTAMP WITHOUT TIMEZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE "projectGrades" (
	"id" serial PRIMARY KEY,
	"projectId" INTEGER NOT NULL REFERENCES "projects"("id"),
	"studentId" INTEGER NOT NULL REFERENCES "students"("id"),
	"grade" TEXT NOT NULL
);

CREATE TABLE "classChanges" (
	"id" SERIAL PRIMARY KEY,
	"studentId" INTEGER NOT NULL REFERENCES "students"("id"),
	"oldClassId" INTEGER NOT NULL REFERENCES "classes"("id"),
	"newClassId" INTEGER NOT NULL REFERENCES "classes"("id"),
	"time" TIMESTAMP WITHOUT TIMEZONE NOT NULL DEFAULT NOW()
);