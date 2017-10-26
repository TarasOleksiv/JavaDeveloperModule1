# 01. Create view to calculate benefits for each company coming from every customer

CREATE OR REPLACE VIEW company_benefits AS
  SELECT projects.company_id, projects.customer_id, sum(projects.costs) AS benefit
  FROM projects GROUP BY company_id, customer_id;

# 02. Select customer providing minimal benefit for each company
SELECT companies.name AS 'Company name',
       customers.name AS 'Customer name',
       c.min_benefit AS 'Min benefit' FROM
  (SELECT b.company_id, company_benefits.customer_id, b.min_benefit FROM
    company_benefits INNER JOIN
    (SELECT company_id, min(benefit) AS min_benefit FROM company_benefits
    GROUP BY company_id) AS b
      ON company_benefits.company_id = b.company_id
         AND company_benefits.benefit = b.min_benefit) AS c
  LEFT JOIN companies ON c.company_id = companies.id
  LEFT JOIN customers ON c.customer_id = customers.id;