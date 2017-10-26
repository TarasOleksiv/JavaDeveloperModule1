# 01. Create view to calculate benefits for each company coming from every project
CREATE OR REPLACE VIEW company_project_benefits AS
  SELECT projects.company_id, projects.id as project_id, sum(projects.costs) AS benefit
  FROM projects GROUP BY company_id, id;


# 02. Calculate average developer's salary for each company for the project providing minimal benefit
SELECT companies.name As Company,
       projects.name AS Project,
       bs.min_benefit AS Benefit,
       bs.avg_salary AS 'Average salary' FROM
  (SELECT p.*, sal.avg_salary FROM
    (SELECT b.company_id, c.project_id, b.min_benefit FROM
      (SELECT company_id, min(benefit) AS min_benefit FROM company_project_benefits
      GROUP BY company_id) AS b
      INNER JOIN company_project_benefits AS c
        ON b.company_id = c.company_id
           AND b.min_benefit = c.benefit) AS p
    LEFT JOIN
    (SELECT developer_projects.project_id, round(avg(developers.salary),2) AS avg_salary FROM developer_projects
      LEFT JOIN developers ON developer_projects.developer_id = developers.id
    GROUP BY developer_projects.project_id) AS sal ON p.project_id = sal.project_id) AS bs
  LEFT JOIN companies ON bs.company_id = companies.id
  LEFT JOIN projects ON bs.project_id = projects.id
;