SELECT e.employee_id as employee_id,
      e.name as employee_name
FROM employee e
JOIN employee m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary