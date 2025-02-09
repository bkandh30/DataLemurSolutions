WITH CountQuery AS (
    SELECT e.employee_id,
           COALESCE(COUNT(DISTINCT q.query_id),0) AS query_count
    FROM employees e
    LEFT JOIN queries q
    ON e.employee_id = q.employee_id
    AND query_starttime >= '2023-07-01T00:00:00Z'
    AND query_starttime < '2023-10-01T00:00:00Z'
    GROUP BY e.employee_ID
)

SELECT query_count as unique_queries,
        COUNT(employee_id) AS employee_count
FROM CountQuery
GROUP BY query_count
ORDER BY query_count