# 01. Create view to calculate the price of each project
#     based on the salary of developers working on this project
CREATE OR REPLACE VIEW project_outlays AS
  SELECT developer_projects.project_id, sum(developers.salary) AS total_sum
  FROM developer_projects LEFT JOIN developers ON
                                                 developer_projects.developer_id = developers.id
  GROUP BY developer_projects.project_id;

# 02. Select project info about the most expensive project
SELECT pc.project_id AS 'Project id', projects.name AS 'Project name',
       customers.name AS 'Customer', companies.name AS 'Company',
       pc.total_sum AS 'Price' FROM
  (SELECT project_id, total_sum FROM project_outlays
  WHERE total_sum =  (SELECT max(total_sum) FROM project_outlays)) AS pc
  LEFT JOIN projects ON pc.project_id = projects.id
  LEFT JOIN customers ON projects.customer_id = customers.id
  LEFT JOIN companies ON projects.company_id = companies.id;