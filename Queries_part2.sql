USE lab3;
SELECT employee_number, employee_last_name, employee_first_name, employee_initial
FROM employees
WHERE employee_first_name LIKE 'John%'
ORDER BY employee_number;
SELECT e.employee_number, e.employee_first_name, e.employee_last_name, j.job_title
FROM employees e
JOIN jobs j ON e.job_code = j.job_code;
SELECT 
    p.project_name, p.project_value, p.project_balance,
    e.employee_last_name, e.employee_first_name, e.employee_initial,
    j.job_code, j.job_title, j.job_chg_hour
FROM projects p
JOIN employees e ON p.employee_number = e.employee_number
JOIN jobs j ON e.job_code = j.job_code
ORDER BY p.project_value DESC;
SELECT 
    p.project_name, p.project_value, p.project_balance,
    e.employee_last_name, e.employee_first_name, e.employee_initial,
    j.job_code, j.job_title, j.job_chg_hour
FROM projects p
JOIN employees e ON p.employee_number = e.employee_number
JOIN jobs j ON e.job_code = j.job_code
ORDER BY e.employee_first_name;
SELECT DISTINCT project_number
FROM assignments
ORDER BY project_number;
SELECT 
    assignment_number, employee_number, project_number, 
    assignment_charge, 
    assignment_chg_hr * assignment_hours AS calculated_charge
FROM assignments
ORDER BY assignment_number;
SELECT 
    e.employee_number,
    e.employee_last_name,
    SUM(a.assignment_hours) AS total_hours,
    SUM(a.assignment_charge) AS total_charges
FROM 
    assignments a
JOIN 
    employees e ON a.employee_number = e.employee_number
GROUP BY 
    e.employee_number, e.employee_last_name
ORDER BY 
    e.employee_number;
SELECT 
    project_number,
    SUM(assignment_hours) AS total_hours,
    SUM(assignment_charge) AS total_charges
FROM assignments
GROUP BY project_number
ORDER BY project_number;
SELECT 
    SUM(a.assignment_hours) AS sum_hours_worked,
    SUM(a.assignment_charge) AS sum_charges
FROM 
    assignments a;
SELECT 
    a.employee_number
FROM 
    assignments a
GROUP BY 
    a.employee_number
HAVING 
    COUNT(DISTINCT a.project_number) >= 2;
SELECT 
    p.project_name
FROM 
    projects p
JOIN 
    assignments a ON p.project_number = a.project_number
WHERE 
    a.employee_number = 1;
SELECT 
    p.project_name,
    COUNT(DISTINCT a.employee_number) AS num_employees_assigned
FROM 
    projects p
JOIN 
    assignments a ON p.project_number = a.project_number
GROUP BY 
    p.project_name;
SELECT 
    e.*
FROM 
    employees e
LEFT JOIN 
    assignments a ON e.employee_number = a.employee_number
WHERE 
    a.assignment_number IS NULL;
SELECT 
    p.*
FROM 
    projects p
ORDER BY 
    p.project_balance DESC
LIMIT 1;
SELECT 
    e.job_code, 
    COUNT(e.employee_number) AS count
FROM 
    employees e
GROUP BY 
    e.job_code;
SELECT 
    j.job_title, 
    COUNT(e.employee_number) AS count
FROM 
    employees e
JOIN 
    jobs j ON e.job_code = j.job_code
GROUP BY 
    j.job_title;
SELECT 
    a.employee_number
FROM 
    assignments a
GROUP BY 
    a.employee_number
HAVING 
    SUM(a.assignment_hours) > 10;
SELECT 
    DISTINCT e.employee_number, 
    e.employee_first_name, 
    e.employee_last_name
FROM 
    employees e
JOIN 
    assignments a ON e.employee_number = a.employee_number
JOIN 
    projects p ON a.project_number = p.project_number
WHERE 
    p.project_value > 50000;
SELECT 
    j.job_title
FROM 
    jobs j
ORDER BY 
    j.job_chg_hour DESC
LIMIT 1;
SELECT 
    j.job_code, 
    j.job_title, 
    j.job_chg_hour, 
    j.job_last_update
FROM 
    jobs j
ORDER BY 
    j.job_last_update DESC
LIMIT 1;
SELECT 
    e.employee_first_name, 
    e.employee_last_name
FROM 
    employees e
JOIN 
    jobs j ON e.job_code = j.job_code
WHERE 
    j.job_title = (
        SELECT j.job_title
        FROM employees e2
        JOIN jobs j ON e2.job_code = j.job_code
        WHERE e2.employee_first_name = 'Emily' AND e2.employee_last_name = 'Johnson'
    );




