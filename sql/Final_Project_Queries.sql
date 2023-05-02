CREATE TABLE "lockdown_us" (
    "Country" varchar   NOT NULL,
    "State" varchar   NOT NULL,
    "Abbr_State" varchar not NULL,  
    "County" varchar   Not NULL,
    "Date" date   NOT NULL,
    "type" varchar   NOT NULL
);
SELECT
    EXTRACT(YEAR FROM "Date") AS year,
    TO_CHAR("Date", 'MM') AS month,
    *
FROM
    public.lockdown_us
GROUP BY
    year,
    month,
    "Country",
    "State",
    "Abbr_State",
    "County",
    "Date",
    "type"
ORDER BY
    year,
    month;

SELECT
    "Country",
    "State",
    "Abbr_State",
	"Date",
    "type"
FROM
    public.lockdown_us
GROUP BY
    "Country",
    "State",
    "Abbr_State",
	"Date",
    "type"
ORDER BY
    "State";
	
SELECT
    l."Country",
    l."State",
    l."Abbr_State",
    l."County",
    l."Date",
    l."type",
    u."Stay_at_Home_Order_Recommendation"
FROM
    public.lockdown_us AS l
    LEFT JOIN "US_Orders" AS u
    ON l."Date" = u."date"
        AND l."Abbr_State" = u."State_Tribe_Territory"
ORDER BY
    l."Abbr_State",
    l."Date";

SELECT
    l."Country",
    l."State",
    l."Abbr_State",
    l."County",
    l."Date",
    l."type",
    u."Stay_at_Home_Order_Recommendation"
FROM
    public.lockdown_us AS l
    LEFT JOIN "US_Orders" AS u
    ON l."Date" = u."date"
        AND l."Abbr_State" = u."State_Tribe_Territory"
        AND l."County" = u."County_Name"
ORDER BY
    l."Abbr_State",
    l."Date";

SELECT
    "US_Orders"."State_Tribe_Territory",
    "US_Orders"."County_Name",
    date_trunc('month', "US_Orders"."date") AS "Month_Year",
    "US_Orders"."Stay_at_Home_Order_Recommendation",
    "US_Orders"."Express_Preemption"
FROM
    "US_Orders"
GROUP BY
    "US_Orders"."State_Tribe_Territory",
    "US_Orders"."County_Name",
    date_trunc('month', "US_Orders"."date"),
    "US_Orders"."Stay_at_Home_Order_Recommendation",
    "US_Orders"."Express_Preemption",
    "US_Orders"."Source_of_Action"

	
SELECT 
    u."State_Tribe_Territory",
    u."County_Name",
    date_trunc('month', u."date") AS "Month_Year",
    STRING_AGG(DISTINCT u."Stay_at_Home_Order_Recommendation", ', ') AS "Stay_At_Home_Order_Recommendation",
    u."Express_Preemption",
    COALESCE(l."Type", '') AS "Lockdown_Type"
FROM 
    "US_Orders" AS u
LEFT JOIN 
    public.lockdown_us AS l
ON 
    u."State_Tribe_Territory" = l."Abbr_State"
GROUP BY 
    u."State_Tribe_Territory",
    u."County_Name",
    date_trunc('month', u."date"),
    u."Express_Preemption",
    COALESCE(l."Type", '')
ORDER BY 
    u."State_Tribe_Territory", 
    u."County_Name", 
    date_trunc('month', u."date");






















