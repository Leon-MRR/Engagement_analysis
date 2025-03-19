-- Percentage of students that watched lectures in 2021
with cte as (select distinct student_id  from student_video_watched)
select 
	(count(distinct student_id)/(select count(*) from cte))*100 as percentage_watched_in_2021
from student_video_watched
where year(date_watched) = 2021;

-- Percentage students that watched lectures in 2022
with cte as (select distinct student_id  from student_video_watched)
select 
	(count(distinct student_id)/(select count(*) from cte))*100 as percentage_watched_in_2022
from student_video_watched
where year(date_watched) = 2022;

-- Percentage of students that watched lectures in both years
with cte as (SELECT student_id
FROM student_video_watched
WHERE YEAR(date_watched) IN (2021, 2022)
GROUP BY student_id
HAVING COUNT(DISTINCT YEAR(date_watched)) = 2),
cte2 as (select distinct student_id from student_video_watched)
select distinct 
	(select count(*) from cte)/(select count(*) from cte2)*100 as percentage_watched_both
from student_video_watched;