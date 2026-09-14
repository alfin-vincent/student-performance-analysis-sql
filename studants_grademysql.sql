create database banking_accounts;
use banking_accounts;
select*from sample_orders_50_rows;
drop table sample_orders_50_rows;
drop table accounts_data;
select * from student_performance_dataset;
describe student_performance_dataset;
select count(*) from student_performance_dataset;
select student_id,count(*) as duplicate_count from student_performance_dataset group by student_id having count(*)>1;
select count(*) as student_id from student_performance_dataset where student_id is null;
select count(*) as gender from student_performance_dataset where gender is null;
select count(*) as study_time_hours from student_performance_dataset where study_time_hours is null;
select count(*) as attendance_precent from student_performance_dataset where attendance_percent is null;
select count(*) as sleep_hours from student_performance_dataset where sleep_hours is null;
select count(*) as parental_education from student_performance_dataset where parental_education is null;
select count(*) as internet_access from student_performance_dataset where internet_access is null;
select count(*) as extracurricular_activities from student_performance_dataset where extracurricular_activities is null;
select count(*) as part_time_job from student_performance_dataset where part_time_job is null;
select count(*) as previous_grade from student_performance_dataset where previous_grade is null;
select count(*) as final_exam_score from student_performance_dataset where final_exam_score is null;
select count(*) as final_grade from student_performance_dataset where final_grade is null;
alter table student_performance_dataset add improvement int;
set sql_safe_updates=0;
update student_performance_dataset set improvement = final_exam_score - previous_grade;
alter table student_performance_dataset add improvement_status varchar(50);
set sql_safe_updates=0;
update student_performance_dataset set improvement_status =
 case 
when improvement>20 then 'Significant Improvement'
when improvement between 1 and 20 then 'moderate Improvement'
when improvement =0 then 'No change'
when improvement <0 then 'decline' 
end;
select count(*) from student_performance_dataset where improvement_status = 'decline';
select count(*) from student_performance_dataset where improvement_status='Significant Improvement';
select count(*) from student_performance_dataset where improvement_status='moderate Improvement';
select count(*) from student_performance_dataset where improvement_status='No change';
select  avg(final_exam_score),internet_access from student_performance_dataset group by internet_access;
select max(final_exam_score),internet_access from student_performance_dataset group by internet_access;
select min(final_exam_score),internet_access from student_performance_dataset group by internet_access;
select avg(final_exam_score),extracurricular_activities from student_performance_dataset group by extracurricular_activities;
select max(final_exam_score),extracurricular_activities from student_performance_dataset group by extracurricular_activities;
select min(final_exam_score),extracurricular_activities from student_performance_dataset group by extracurricular_activities;
select avg(final_exam_score) from student_performance_dataset;
select max(final_exam_score) from student_performance_dataset;
select min(final_exam_score) from student_performance_dataset;
select avg(study_time_hours) from student_performance_dataset;
SELECT AVG(study_time_hours) FROM student_performance_dataset WHERE final_exam_score > 90;
select * from student_performance_dataset; 
select avg(final_exam_score),part_time_job from student_performance_dataset group by part_time_job;
select max(final_exam_score),part_time_job from student_performance_dataset group by part_time_job;
SELECT MIN(final_exam_score), part_time_job FROM student_performance_dataset GROUP BY part_time_job;
SELECT AVG(final_exam_score), gender FROM student_performance_dataset GROUP BY gender;
select count(*) from student_performance_dataset where gender='female';
select count(*) from student_performance_dataset where gender='male';
select 
case when attendance_percent >=90 then 'High'
when attendance_percent >=75 then 'Medium'
else 'Low'
end as attendence_group,
avg(final_exam_score) from student_performance_dataset group by attendence_group;
select student_id ,final_exam_score from student_performance_dataset order by final_exam_score desc limit 10;
select final_grade, count(*) from student_performance_dataset group by final_grade;
select parental_education,avg(final_exam_score) from student_performance_dataset group by parental_education ;
SELECT improvement_status,avg(final_exam_score) from student_performance_dataset group by improvement_status ;
select * from student_performance_dataset order by final_exam_score desc limit 10;
select gender from student_performance_dataset order by gender desc ;

select * from student_performance_dataset;
select avg(final_exam_score),sleep_hours,gender from student_performance_dataset group by sleep_hours,gender;
select avg(attendance_percent),sleep_hours from student_performance_dataset group by sleep_hours;
select avg(study_time_hours),final_exam_score from student_performance_dataset group by final_exam_score;
select avg(improvement),previous_grade,final_exam_score from student_performance_dataset group by previous_grade,final_exam_score;
select max(improvement),previous_grade,final_exam_score from student_performance_dataset group by previous_grade,final_exam_score;
select avg(study_time_hours),parental_education from student_performance_dataset group by parental_education;
select max(study_time_hours),parental_education from student_performance_dataset group by parental_education;
SELECT 
    CASE
        WHEN study_time_hours >= 7 THEN 'high'
        WHEN study_time_hours >= 4.5 THEN 'medium'
        WHEN study_time_hours >= 2 THEN 'minimum'
        ELSE 'low'
    END AS study_time_group,
    AVG(final_exam_score)
FROM
    student_performance_dataset
GROUP BY study_time_group;
select
case when sleep_hours >=8 then 'Adequate sleep'
when sleep_hours >=7 then 'Slightly deficient sleep'
when sleep_hours >=6 then ' moderately deficient sleep'
when sleep_hours >=5 then 'seriously low sleep'
when sleep_hours >=4 then 'DANGEROUS'
else   'Extreme deficit'
end as sleep_hour_group
,avg(final_exam_score) from student_performance_dataset group by sleep_hour_group;
select avg(previous_grade),part_time_job from student_performance_dataset group  by part_time_job;
select max(previous_grade),part_time_job from student_performance_dataset group by part_time_job;
select avg(improvement),improvement_status from student_performance_dataset group by improvement_status;
select avg(study_time_hours) ,gender from student_performance_dataset group by gender;
select avg(study_time_hours),final_grade from student_performance_dataset group by final_grade;
select avg(sleep_hours),final_grade from student_performance_dataset group by final_grade;
select avg(study_time_hours),avg(sleep_hours),final_grade from student_performance_dataset group by final_grade;
select avg(study_time_hours) ,attendance_percent,final_exam_score from student_performance_dataset group by attendance_percent,final_exam_score;
select avg(study_time_hours),avg(attendance_percent),avg(sleep_hours),avg(final_exam_score) ,improvement_status from student_performance_dataset group by improvement_status;

select * from student_performance_dataset;
select 
case
when attendance_percent >=90 then 'excelent'
when attendance_percent >=80 then 'Good'
when attendance_percent >=70 then 'averge'
else 'low'
end as attendance,
avg(final_exam_score) from student_performance_dataset group by attendance;

alter table student_performance_dataset add attendance_status varchar(50) after attendance_percent; 
alter table student_performance_dataset drop column attendance_status;
set sql_safe_updates=0;
update student_performance_dataset set attendance_status=
case
when attendance_percent >=90 then 'excelent'
when attendance_percent >=80 then 'Good'
when attendance_percent >=70 then 'averge'
else 'low'
end;
alter table student_performance_dataset add Final_exam_status varchar(50) after final_grade;
update student_performance_dataset set Final_exam_status =
case
when final_grade = 'A' then ' Excelent'
when final_grade = 'B' then 'Good'
when final_grade = 'C' then 'Averge'
when final_grade = 'D' then 'Pass'
else 'Fail'
end;
select avg(previous_grade),improvement from student_performance_dataset group by improvement;
alter table student_performance_dataset add sleep_status varchar(50) after sleep_hours;
update student_performance_dataset set sleep_status =
case
when sleep_hours >8 then 'Extended sleep '
when sleep_hours =8 then 'Adequate sleep'
when sleep_hours between 6 and 8 then 'Averge sleep'
when sleep_hours between 3 and 6 then 'Deficit sleepers'
else 'Critical rest deficit'
end;
alter table student_performance_dataset rename column previous_grade to previous_exam_score;
alter table student_performance_dataset add previous_grade varchar(50) after previous_exam_score;
update student_performance_dataset set previous_grade =
case
when previous_exam_score >=90 then 'A'
when previous_exam_score >=80 then 'B'
when previous_exam_score >=70 then 'C'
when previous_exam_score >=60 then 'D'
else 'F'
end;
alter table student_performance_dataset add previous_exam_status varchar(50) after previous_grade;
update student_performance_dataset set previous_exam_status =
case
when previous_exam_score >=90 then 'Excelent'
when previous_exam_score >=80 then 'Good'
when previous_exam_score >=70 then 'Averge'
when previous_exam_score >=60 then 'Pass'
else 'Fail'
end;

select * from student_performance_dataset;
select student_id,final_exam_score, DENSE_RANK() over(order by final_exam_score desc) as final_exam_rank from student_performance_dataset;
alter table student_performance_dataset add Students_Rank int after final_grade;
set sql_safe_updates=0;
UPDATE student_performance_dataset p
JOIN (
    SELECT
        student_id,
        RANK() OVER (
            ORDER BY final_exam_score DESC
        ) AS Student_Rank
    FROM student_performance_dataset
) r
ON p.student_id = r.student_id
SET p.Students_Rank = r.Student_Rank;

select avg(study_time_hours),Students_Rank from student_performance_dataset group by Students_Rank;
select avg(sleep_hours) ,Students_Rank from student_performance_dataset group by Students_Rank;
select avg(attendance_percent),Students_Rank from student_performance_dataset group by Students_Rank;

alter table student_performance_dataset add study_time_group varchar(50) after study_time_hours;
update student_performance_dataset set study_time_group =
case 
when study_time_hours >= 7 then 'High'
when study_time_hours >= 4.5 then 'Medium'
when study_time_hours >= 2 then 'Low'
else 'Very Low'
end;
select * from student_performance_dataset;
select study_time_group,
count(*) as student_count,
avg(attendance_percent) as avg_attendance,
avg(final_exam_score) as avg_final_exam_score,
avg(sleep_hours) as avg_sleep
from student_performance_dataset
group by study_time_group
order by avg_final_exam_score desc;
select 
case 
when Students_Rank <= 10 then 'TOP 10'
when Students_Rank <=50 then 'TOP 50'
when students_Rank <=100 then 'TOP 100'
else 'BELOW TOP 100'
end as rank_group,count(*) as student_count, avg(final_exam_score) as avg_score, avg(study_time_hours) as avg_study_time,avg(attendance_percent) as avg_attendance
from student_performance_dataset
group by students_rank
order by avg_score desc;
SELECT 
    study_time_group,
    COUNT(*) AS student_count,
    AVG(study_time_hours) AS avg_study,
    AVG(final_exam_score) AS avg_score
FROM
    student_performance_dataset
GROUP BY study_time_group
ORDER BY avg_score DESC;
select 
study_time_group ,
count(*) as student_count,
round(avg(study_time_hours),2) as avg_study_time,
round(avg(final_exam_score),2) as avg_final_exam_score
from student_performance_dataset
group by study_time_group
order by avg_study_time;
SELECT 
    attendance_status,
    COUNT(*) AS student_count,
    AVG(attendance_percent) AS avg_attendance,
    AVG(final_exam_score) AS avg_score
FROM
    student_performance_dataset
GROUP BY attendance_status
ORDER BY avg_score DESC;
select 
attendance_status,
count(*) as student_count,
round(avg(attendance_percent),2) as avg_attendance,
round(avg(final_exam_score),2) as avg_final_score 
from student_performance_dataset 
group by attendance_status
order by avg_attendance;
select * from student_performance_dataset;
SELECT 
    sleep_status,
    COUNT(*) AS students_count,
    round(AVG(sleep_hours),2) AS avg_sleep,
    round(AVG(final_exam_score),2) AS avg_score
FROM
    student_performance_dataset
GROUP BY sleep_status
ORDER BY avg_score DESC;
SELECT 
    internet_access,
    COUNT(*) AS student_counts,
   round( AVG(final_exam_score),2) AS avg_score
FROM
    student_performance_dataset
GROUP BY internet_access;
 SELECT 
    extracurricular_activities,
    COUNT(*) AS student_counts,
   round(AVG(final_exam_score),2) AS avg_score
FROM
    student_performance_dataset
GROUP BY extracurricular_activities;
SELECT 
    part_time_job,
    COUNT(*) AS student_counts,
    round(avg(final_exam_score),2) AS avg_score
FROM
    student_performance_dataset
GROUP BY part_time_job;
select 
parental_education,
count(*) as student_count,
round(avg(final_exam_score),2) as avg_final_score
from student_performance_dataset 
group by parental_education;
select * from student_performance_dataset;
select
count(*) as total_students,
round(avg(final_exam_score),2) as avg_final_score,
max(final_exam_score) as Highest_score,
min(final_exam_score) as Lowest_score,
round(avg(study_time_hours),2) as avg_study_time,
round(avg(attendance_percent),2) as avg_attendance,
round(avg(sleep_hours),2) as avg_sleep
from student_performance_dataset;
SELECT COUNT(*) AS total_columns
FROM information_schema.columns
WHERE table_schema = 'banking_accounts'
AND table_name = 'student_performance_dataset';
DESCRIBE student_performance_dataset;
SELECT
    MIN(study_time_hours) AS min_study_time,
    MAX(study_time_hours) AS max_study_time,
    MIN(attendance_percent) AS min_attendance,
    MAX(attendance_percent) AS max_attendance,
    MIN(sleep_hours) AS min_sleep,
    MAX(sleep_hours) AS max_sleep,
    MIN(previous_exam_score) AS min_previous_score,
    MAX(previous_exam_score) AS max_previous_score,
    MIN(final_exam_score) AS min_final_score,
    MAX(final_exam_score) AS max_final_score
FROM student_performance_dataset;
SELECT
    COUNT(*) AS total_students,
    ROUND(AVG(final_exam_score), 2) AS average_final_score,
    MAX(final_exam_score) AS highest_final_score,
    MIN(final_exam_score) AS lowest_final_score,
    ROUND(AVG(study_time_hours), 2) AS average_study_time,
    ROUND(AVG(attendance_percent), 2) AS average_attendance,
    ROUND(AVG(sleep_hours), 2) AS average_sleep,
    ROUND(AVG(previous_exam_score), 2) AS average_previous_score
FROM student_performance_dataset;
select * from student_performance_dataset;
select 
previous_grade,
count(*) as students_count,
round(avg(previous_exam_score),2) as avg_previous_score,
round(avg(final_exam_score),2) as avg_final_score,
round(avg(improvement),2) as avg_improvement
from student_performance_dataset
group by previous_grade 
order by avg_previous_score;
select 
improvement_status,
count(*) as students_count,
round(avg(improvement),2) as avg_improvement,
round(avg(final_exam_score),2) as avg_final_score
from student_performance_dataset 
group by improvement_status 
order by avg_improvement;
select 
final_grade,
count(*) as students_count,
round(count(*)* 100.0/(select count(*) from student_performance_dataset ),2) as percentage 
from student_performance_dataset
group by final_grade
order by final_grade;
select * from student_performance_dataset;
select student_id , final_exam_score ,Students_Rank from student_performance_dataset order by final_exam_score desc limit 10;
select attendance_percent,count(*) as student_count from student_performance_dataset group by attendance_percent having attendance_percent=100;
