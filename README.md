# Tracking User Engagement with SQL, Excel, and Python

## Overview

This project analyzes student engagement on an educational platform following the release of new features in late 2021. By comparing engagement metrics before and after these changes, we assess whether new courses, exams, and career tracks contributed to increased student activity.

## Data Description

The dataset includes:

- **Certificates issued (Q2 2022):** Student ID and issuance date.
- **Student registrations (Jan 2020 - June 2022):** Student ID and registration date.
- **Purchases (Jan 2020 - June 2022):** Student ID, product type, purchase date, and refund date.
- **Course watching data (Q2 2021 & Q2 2022):** Student ID, time watched, and date.

All data has been anonymized to ensure privacy.

## Hypothesis

We expect that student engagement increased in the first half of 2022 due to the introduction of:

- Career track enrollments
- Practice, course, and career track exams
- An expanded course library

## Tools & Libraries

To analyze the data, we use:

- **SQL:** MySQL Workbench 8.0+
- **\*\*LibreOffice Calc\*\***
- **Python 3** with:
  - `pandas` (data manipulation)
  - `matplotlib` (visualization)
  - `statsmodels` (statistical analysis)
  - `scikit-learn` (machine learning)
  - `seaborn` (optional, for enhanced visualization)

## Project Approach

- Extract relevant data using SQL queries.
- Clean and preprocess data using **pandas**.
- Perform exploratory data analysis (EDA) with **matplotlib** and **seaborn**.
- Conduct statistical analysis using **statsmodels**.
- Apply machine learning models (if applicable) with **scikit-learn**.
- Interpret results to determine the impact of new features on engagement.

## Project Files

- The primary dataset is provided as an **SQL database** containing records on student purchases, activity, and certificate issuance.

## Methodology

In order to measure the effectiveness of the new features added to the platform regarding user engagement it was necessary to track the active subscriptions, minutes watched and the certificates emitted by the platform for each user. First, with the use of the Purchased\_plans.sql and Purchases\_info\_view\.sql the purchases\_info view was created containing the student id, purchase id, the plan info (monthly, quarterly or yearly), the start and end date date of each plan, and whether or not the student was active with a paid sub during Q2 2021  and/or Q2 2022, in order to compare the metrics in both years. As a control, the group of students with active free accounts in both years were studied as well, seeing as the new features wouldn't affect them.

The students were divided into four groups and the total time spent watching videos on the platform in minutes was the main metric evaluated for the engagement analysis of each group. The analyzed groups were:

- **Students with free active subscriptions in Q2 2021**
- **Students with paid active subscriptions in Q2 2021**&#x20;
- **Students with free active subscriptions in Q2 2022**&#x20;
- **Students with paid active subscriptions in Q2 2022**&#x20;

As well as the total watched time of  students who were granted certificates, independent of the subscription period. Students with free subscriptions were referred to as group 0 and students with paid subscriptions were referred to as group 1.

In Jupyter notebook, the distributions of the total watched time of each of the four primary groups were analyzed and the data were preprocessed cutting outliers on the 99th percentile. The data table for each group was then exported to csv and analyzed in LibreOffice Calc, students from group 1 of different years were then compared with each other and later compared with the control group (0).



