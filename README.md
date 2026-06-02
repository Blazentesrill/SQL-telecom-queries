# sql-telecom-queries
 
A collection of MySQL queries for a simulated telecommunications company database. Built as part of a database systems course, this project covers core SQL concepts including joins, aggregates, subqueries, and set operations across a normalized relational schema.
 
---
 
## Database Schema
 
The database (`lab3`) consists of four related tables:
 
| Table | Description |
|---|---|
| `employees` | Employee records including job code, hire date, contact info |
| `jobs` | Job roles with hourly charge rates and last update dates |
| `projects` | Active projects with values, balances, and assigned manager |
| `assignments` | Junction table linking employees to projects with hours and charges |
 
**Relationships:**
- `employees` → `jobs` (each employee has one job code)
- `projects` → `employees` (each project has a managing employee)
- `assignments` → `employees` + `projects` (many-to-many bridge)
---
 
## Setup
 
1. Run the schema and seed data first:
   ```sql
   source lab3_part1.sql;
   ```
 
2. Then run the queries:
   ```sql
   source pbb579_lab3.sql;
   ```
 
> Requires MySQL 8.0+
 
---
 
## Queries Covered
 
### Basic Filtering & Sorting
- List employees whose first name starts with `John` (case-sensitive, includes `Johnson`)
- List all employees with their job titles
### Joins
- Display project details with assigned employee and job info, sorted by project value
- Same as above, sorted by employee first name
### Aggregates & Grouping
- Total hours worked and charges per employee
- Total hours and charges per project
- Grand total hours and charges across all assignments
- Count of employees per job code
- Count of employees per job title
### Validation
- Validate stored `assignment_charge` values against calculated `chg_hr × hours`
### Subqueries & Filtering
- Employees who have worked on at least 2 distinct projects
- Employees who have worked more than 10 total hours
- Employees who have worked on projects valued over $50,000
- Find employees who share the same job title as a given employee (e.g. Emily Johnson)
### Lookups
- Projects assigned to a specific employee (e.g. employee #1)
- Number of employees assigned to each project
- Employees with no project assignments (LEFT JOIN + NULL check)
- Project with the highest remaining balance
- Job title with the highest hourly charge rate
- Most recently updated job role
---
 
## Skills Demonstrated
 
- `JOIN`, `LEFT JOIN` across multiple tables
- `GROUP BY` with `SUM`, `COUNT`, `HAVING`
- Correlated and non-correlated subqueries
- `DISTINCT`, `ORDER BY`, `LIMIT`
- Derived column aliases (`calculated_charge`)
- Aggregate filtering with `HAVING`
---
 
## Files
 
| File | Description |
|---|---|
| `lab3_part1.sql` | Schema creation and seed data |
| `pbb579_lab3.sql` | All query solutions |
