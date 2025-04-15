Create database Excelr_Project;
use Excelr_Project;
Select* from hr_1;
 -- 1 Average Attrition Rate for All Departments
 SELECT Department, 
       AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS AttritionRate
FROM HR_1
GROUP BY Department;

-- 2 Average Hourly Rate of Male Research Scientists
SELECT Round(Avg(HourlyRate),2)AS AvgHourlyRate
FROM HR_1
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

ALTER TABLE hr_2 CHANGE COLUMN `Employee ID` `employee_id` INT;

-- 3 Attrition Rate vs Monthly Income Stats
SELECT hr_2.MonthlyIncome, 
       COUNT(hr_1.EmployeeNumber) AS TotalEmployees,
       SUM(CASE WHEN hr_1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
       (SUM(CASE WHEN hr_1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(hr_1.EmployeeNumber)) AS AttritionRate
FROM hr_1
JOIN hr_2 ON hr_1.EmployeeNumber = hr_2.employee_id
GROUP BY hr_2.MonthlyIncome
ORDER BY hr_2.MonthlyIncome;
Select * From hr_2;
Select *from hr_1;
   

-- 4 Average Working Years for Each Department
SELECT hr_1.Department, 
       AVG(hr_2.YearsAtCompany) AS AvgWorkingYears
FROM hr_1
JOIN hr_2 ON HR_1.EmployeeNumber = hr_2.employee_id
GROUP BY hr_1.Department;

-- 5 Job Role vs Work-Life Balance
SELECT HR_1.JobRole, 
      round( AVG(HR_2.WorkLifeBalance),2)AS AvgWorkLifeBalance
FROM HR_1
JOIN HR_2 ON HR_1.EmployeeNumber = HR_2.employee_id
GROUP BY HR_1.JobRole
ORDER BY AvgWorkLifeBalance DESC;


-- 6 Attrition Rate vs Years Since Last Promotion
SELECT HR_2.YearsSinceLastPromotion, 
       COUNT(HR_1.EmployeeNumber) AS TotalEmployees,
       SUM(CASE WHEN HR_1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
       round(SUM(CASE WHEN HR_1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(HR_1.EmployeeNumber),2) AS AttritionRate
FROM HR_1
JOIN HR_2 ON HR_1.EmployeeNumber = HR_2.employee_id
GROUP BY HR_2.YearsSinceLastPromotion
ORDER BY HR_2.YearsSinceLastPromotion;
-- Insight 
-- The Attrition Rate is around 50% across all departments.
-- The highest Attrition Rate appears in R&D.
-- Higher Monthly Income does not guarantee lower Attrition.
-- Work-Life Balance is similar across Job Roles.
-- Attrition increases slightly for employees who haven't been promoted for more than 4 years.