-- ============================================================
-- International Student Mental Health Analysis
-- Dataset : students.csv (286 students, 50 columns)
-- Goal    : Explore how length of stay impacts average mental
--           health diagnostic scores for international students
-- Scores  : PHQ-9 (depression), SCS (social connectedness),
--           ASISS (acculturative stress)
-- Output  : 9 rows x 5 columns, sorted by stay DESC
-- ============================================================

SELECT
    stay,                                -- Length of stay (years)
    COUNT(*)             AS count_int,   -- Number of international students per group
    ROUND(AVG(todep), 2) AS average_phq, -- Avg PHQ-9 depression score
    ROUND(AVG(tosc),  2) AS average_scs, -- Avg SCS social connectedness score
    ROUND(AVG(toas),  2) AS average_as   -- Avg ASISS acculturative stress score

FROM students
WHERE inter_dom = 'Inter'                -- Filter: international students only
GROUP BY stay
ORDER BY stay DESC;                      -- Longest stay first
