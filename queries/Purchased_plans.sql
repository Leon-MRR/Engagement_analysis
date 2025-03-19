use data_scientist_project;
/*This script shows a table of the purchases of each student
according to the plan purchased (0 for monthly, 1 for quarterly and 2 for yearly plans),
as well as the beginning and ending of each plan*/
with cte as (SELECT 
purchase_id,
student_id,
plan_id,
date_purchased as date_start,
CASE
	WHEN plan_id = 0 THEN date_add(date_purchased, INTERVAL 1 MONTH)
    WHEN plan_id = 1 THEN date_add(date_purchased, INTERVAL 1 quarter)
    WHEN plan_id = 2 THEN date_add(date_purchased, INTERVAL 1 YEAR)
    WHEN plan_id = 3 THEN null
    END AS date_end,
    date_refunded
FROM
	student_purchases)
    select
		student_id,
		purchase_id,
        plan_id,
        date_start,
        IF(date_refunded IS NOT NULL, 
        date_refunded, date_end) AS date_end
	from
		cte;
