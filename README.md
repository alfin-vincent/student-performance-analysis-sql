# Student Performance Analysis (SQL)

## Overview
Analyzed a dataset of 1,000 student records across 21 attributes using MySQL to identify the factors most strongly associated with academic performance — including study time, attendance, sleep, internet access, extracurricular activities, and part-time employment.

## Tools Used
- MySQL
- Microsoft Excel

## What I Did
- Performed data quality checks — audited 11 fields for duplicates and NULL values before analysis
- Engineered calculated fields (`improvement`, `improvement_status`) using conditional SQL logic to classify each student's change between previous and final exam scores
- Segmented students into attendance, study-time, and sleep-hour bands using multi-tier `CASE WHEN` logic
- Analyzed the relationship between final exam scores and internet access, extracurricular activities, part-time employment, and parental education using `GROUP BY` and aggregate functions
- Ranked top-performing students using `ORDER BY` and `LIMIT`

## Key Findings
- **85.6%** of students improved between their previous and final exams
- Students in the **High study-time** group averaged **97.78**, compared to **74.79** for the **Very Low** group
- Students in the **Excellent attendance** group averaged **86.41**, compared to **76.91** for the **Low attendance** group

## Files
- `studants_grademysql.sql` — all SQL queries used for cleaning, transformation, and analysis
- `Student_Performance_Analysis_Final_Report.docx` — full write-up of methodology and findings
