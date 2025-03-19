use data_scientist_project;

-- Minutes watched and certificates per student
SELECT 
    a.student_id,
    COUNT(a.certificate_id) AS certificates,
    ROUND(COALESCE(SUM(b.seconds_watched), 0) / 60,2) AS minutes_watched
FROM
    student_certificates a
        LEFT JOIN
    student_video_watched b ON a.student_id = b.student_id
GROUP BY student_id
ORDER BY minutes_watched DESC;