-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/PxGIFu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Gym
-- -
-- Gym_ID INTEGER PK
-- Gym_Name VARCHAR
-- Address VARCHAR
-- City VARCHAR
-- Zipcode VARCHAR
-- Trainers
-- -
-- Trainer_ID INTEGER PK
-- Gym_ID INTEGER FK >- Gym.Gym_ID
-- First_Name VARCHAR
-- Last_Name VARCHAR
-- Members
-- -
-- Member_ID INTEGER PK
-- Gym_ID INTEGER FK >- Gym.Gym_ID
-- Trainer_ID INTEGER FK >- Trainers.Trainer_ID
-- First_Name VARCHAR
-- Last_Name VARCHAR
-- Address VARCHAR
-- CITY VARCHAR
-- Payments
-- -
-- Payment_ID INTEGER PK
-- Member_ID INTEGER FK - Members.Member_ID
-- CreditCard_Info INTEGER
-- Billing_Zip INTEGER
-- Gym
-- -
-- ID INTEGER PK
-- Gym_Name VARCHAR
-- Address VARCHAR
-- City VARCHAR
-- Zipcode VARCHAR
-- Trainers
-- -
-- ID INTEGER PK
-- First_Name VARCHAR
-- Last_Name VARCHAR
-- Members
-- -
-- ID INTEGER PK
-- First_Name VARCHAR
-- Last_Name VARCHAR
-- Address VARCHAR
-- City VARCHAR
-- Payments
-- -
-- ID INTEGER PK
-- CreditCard_Info INTEGER
-- Billing_Zip INTEGER

CREATE TABLE "departments" (
    "dept_no" string   NOT NULL,
    "dept_name" string   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" string   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" string   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title" string   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" string   NULL,
    "last_name" string   NULL,
    "sex" string   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" string   NOT NULL,
    "title" string   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_manager" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title" FOREIGN KEY("title")
REFERENCES "employees" ("emp_title");

CREATE INDEX "idx_dept_manager_emp_no"
ON "dept_manager" ("emp_no");

CREATE INDEX "idx_employees_emp_title"
ON "employees" ("emp_title");

