use data_scientist_project;

/* Here I create a view table containing
information regarding the purchases of each
student, their respective plans, start and end
dates of each plan/purchase and if the plan was
executed in 2021 or 2022, which are our years of interest*/

DROP VIEW IF EXISTS purchases_info;

CREATE VIEW purchases_info AS
with cte as(select
		purchase_id,
        student_id,
        plan_id,
		date_purchased as date_start,
        IF(date_refunded IS NOT NULL, 
        date_refunded, 
        CASE
			WHEN plan_id = 0 THEN date_add(date_purchased, INTERVAL 1 MONTH)
			WHEN plan_id = 1 THEN date_add(date_purchased, INTERVAL 1 quarter)
			WHEN plan_id = 2 THEN date_add(date_purchased, INTERVAL 1 YEAR)
			WHEN plan_id = 3 THEN null
           END) AS date_end
FROM
	student_purchases)        
SELECT 
	purchase_id,
    student_id,
    plan_id,
    date_start,
    date_end,
    CASE
		WHEN date_end < "2021-04-01" THEN 0
        WHEN date_start > "2021-06-30" THEN 0
        ELSE 1
	END AS paid_q2_2021,
    CASE
		WHEN date_end < "2022-04-01" THEN 0
        WHEN date_start > "2022-06-30" THEN 0
        ELSE 1
	END AS paid_q2_2022
FROM 
	cte;
    
select * from purchases_info order by student_id;
    
select student_id,
	   round(sum(seconds_watched)/60,2) as minutes_watched
from
	student_video_watched
where
	date_watched BETWEEN '2021-04-01' AND '2021-06-30'
group by student_id;