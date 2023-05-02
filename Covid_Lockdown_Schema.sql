-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/3OzvO7
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "US_Orders" (
    "State_Tribe_Territory" varchar   NOT NULL,
    "County_Name" varchar   NOT NULL,
    "FIPS_State" int   NOT NULL,
    "FIPS_County" int   NOT NULL,
    "date" date   NOT NULL,
    "Order_code" int   NOT NULL,
    "Stay_at_Home_Order_Recommendation" varchar   NOT NULL,
    "Express_Preemption" varchar   NOT NULL,
    "Source_of_Action" varchar   NOT NULL,
    "URL" varchar   NOT NULL,
    "Citation" varchar   NOT NULL
);

CREATE TABLE "lockdown_us" (
    "Country" varchar   NOT NULL,
    "State" varchar   NOT NULL,
    "Abbr_State" varchar NULL,  
    "County" varchar   NULL,
    "Date" date   NOT NULL,
    "type" varchar   NOT NULL
);

ALTER TABLE "lockdown_us" ADD CONSTRAINT "fk_lockdown_us_Country_State_Date" FOREIGN KEY("Country", "State", "Date")
REFERENCES "US_Stay_At_Home_Orders" ("County_Name", "State_Tribe_Territory", "date");

