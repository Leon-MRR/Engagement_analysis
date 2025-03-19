use data_scientist_project;

/* Minutes watched by students with active
 and paid subscriptions in the second quarter
 of 2022*/
with cte as (select
	a.student_id,
    a.minutes_watched,
    if(sum(paid_q2_2022) > 0, 1, 0) as paid_in_q2
from
	(select student_id,
	   round(sum(seconds_watched)/60,2) as minutes_watched
from
	student_video_watched
where
	date_watched BETWEEN '2022-04-01' AND '2022-06-30'
group by student_id) a
join 
	purchases_info b on a.student_id = b.student_id
group by student_id
order by student_id)
select student_id, minutes_watched
from cte
where paid_in_q2 = 1;

/* Minutes watched by students with active
 and free subscriptions in the second quarter
 of 2022*/
 with cte as (select
	a.student_id,
    a.minutes_watched,
    if(sum(paid_q2_2022) > 0, 1, 0) as paid_in_q2
from
	(select student_id,
	   round(sum(seconds_watched)/60,2) as minutes_watched
from
	student_video_watched
where
	date_watched BETWEEN '2022-04-01' AND '2022-06-30'
group by student_id) a
join 
	purchases_info b on a.student_id = b.student_id
group by student_id
order by student_id)
select student_id,
	   round(sum(seconds_watched)/60,2) as minutes_watched
from
	student_video_watched
where
	date_watched BETWEEN '2022-04-01' AND '2022-06-30'
group by student_id
except
select student_id, minutes_watched
from cte
where paid_in_q2 = 1;