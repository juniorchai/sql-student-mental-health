"""
run_query.py
------------
Loads students.csv into an in-memory SQLite database and runs
analyze_student.sql, printing the result to the terminal.

Usage:
    python run_query.py
"""

import pandas as pd
import sqlite3

# Load CSV into in-memory SQLite
df = pd.read_csv("students.csv")
con = sqlite3.connect(":memory:")
df.to_sql("students", con, index=False)

# Run SQL file
with open("analyze_student.sql") as f:
    query = f.read()

result = pd.read_sql_query(query, con)
con.close()

# Display result
print("=" * 55)
print("International Student Mental Health — Query Result")
print("=" * 55)
print(result.to_string(index=False))
print(f"\n✅ {len(result)} rows returned")
