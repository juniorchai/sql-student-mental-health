# 🧠 International Student Mental Health Analysis

![SQL](https://img.shields.io/badge/SQL-SQLite-blue?logo=sqlite) ![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python) ![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

## Overview
SQL analysis of **286 university students (201 international, 67 domestic)** from a Japanese university study to explore how **length of stay** impacts mental health diagnostic scores among international students.  
The goal is to identify whether longer stays correlate with better or worse mental health outcomes across three validated psychological tests.

*Data source: Mental health survey — modified version via DataCamp*

## Research Questions
| # | Question |
|---|----------|
| 1 | Does length of stay affect depression scores (PHQ-9)? |
| 2 | Does length of stay affect social connectedness (SCS)? |
| 3 | Does length of stay affect acculturative stress (ASISS)? |
| 4 | Which stay length group has the highest mental health risk? |

## Key Findings
- 📊 **201 international students** analyzed across **9 length-of-stay groups** (1–10 years)
- 😟 Students staying **3–4 years** show the **highest average depression scores** (~8.57–9.09 PHQ)
- 😌 Students staying **7 years** show the **lowest depression score** (4.00 PHQ)
- 🤝 **Social connectedness (SCS)** peaks at year 7 (48.00) and is lowest at year 10 (32.00)
- 😰 **Acculturative stress (ASISS)** is highest in year 5 (91.00) and lowest in year 7 (45.00)
- 🔁 No simple linear trend — mental health fluctuates non-linearly with length of stay

## Query Output
| stay | count_int | average_phq | average_scs | average_as |
|------|-----------|-------------|-------------|------------|
| 10 | 1 | 13.00 | 32.00 | 50.00 |
| 8 | 1 | 10.00 | 44.00 | 65.00 |
| 7 | 1 | 4.00 | 48.00 | 45.00 |
| 6 | 3 | 6.00 | 38.00 | 58.67 |
| 5 | 1 | 0.00 | 34.00 | 91.00 |
| 4 | 14 | 8.57 | 33.93 | 87.71 |
| 3 | 46 | 9.09 | 37.13 | 78.00 |
| 2 | 39 | 8.28 | 37.08 | 77.67 |
| 1 | 95 | 7.48 | 38.11 | 72.80 |

## SQL Techniques Used
- `WHERE` — filter to international students only (`inter_dom = 'Inter'`)
- `GROUP BY` — aggregate by length of stay
- `COUNT()`, `AVG()`, `ROUND()` — compute summary statistics
- `ORDER BY DESC` — sort by stay length descending
- Column aliasing (`AS`) for readable output

## Tools
- **SQLite** · **Python** (pandas + sqlite3)

## Dataset
`students.csv` — 286 rows × 50 columns, anonymized mental health survey data from a Japanese university.  
Key columns: `inter_dom`, `stay`, `todep` (PHQ-9), `tosc` (SCS), `toas` (ASISS)

## How to Run
```bash
git clone https://github.com/JuniorChai/sql-student-mental-health
cd sql-student-mental-health
pip install pandas
python run_query.py
```

No database file needed — `run_query.py` loads `students.csv` into an in-memory SQLite database and runs `analyze_student.sql` automatically.

---
*Part of my Data Analytics Portfolio — [github.com/JuniorChai](https://github.com/JuniorChai)*
