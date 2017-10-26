# 01. Populate companies
INSERT INTO companies (name, address) VALUES
  ('Eleks', 'Address1'),
  ('Epam', 'Address2'),
  ('Conscensia', 'Address3'),
  ('SoftServe', 'Address4'),
  ('Vakoms', 'Address5');

# 02. Populate customers
INSERT INTO customers (name, address) VALUES
  ('Bosch', 'Address1'),
  ('Bayern', 'Address2'),
  ('Toyota', 'Address3'),
  ('Denim', 'Address4'),
  ('Levis', 'Address5'),
  ('Sony', 'Address6'),
  ('Asics', 'Address7');

# 03. Populate skills
INSERT INTO skills (name) VALUES
  ('PHP'),
  ('Delphi'),
  ('Java'),
  ('C'),
  ('C++'),
  ('C#'),
  ('COBOL'),
  ('.NET'),
  ('Ruby'),
  ('Python');

# 04. Populate developers (developer could work only in 1 company)
INSERT INTO developers (firstname, lastname, company_id) VALUES
  ('Peter', 'Surname', 1),
  ('Ann', 'Surname', 1),
  ('Nadia', 'Surname', 1),
  ('George', 'Surname', 2),
  ('Oleg', 'Surname', 2),
  ('Andrew', 'Surname', 2),
  ('Oleksandr', 'Surname', 2),
  ('Peter', 'Surname', 3),
  ('Olga', 'Surname', 3),
  ('Taras', 'Surname', 3),
  ('John', 'Surname', 3),
  ('George', 'Surname', 4),
  ('Ihor', 'Surname', 4),
  ('Jane', 'Surname', 4),
  ('Joe', 'Surname', 4),
  ('Tom', 'Surname', 4),
  ('Yuriy', 'Surname', 5),
  ('Saskia', 'Surname', 5),
  ('Kate', 'Surname', 5),
  ('Glenn', 'Surname', 5),
  ('Duane', 'Surname', 5),
  ('Steve', 'Surname', 5);

# 05. Populate projects
# Company could work on different projects
# Customer could order different projects
INSERT INTO projects (name, company_id, customer_id) VALUES
  ('Airdis', 1, 1),
  ('Nurvis', 1, 1),
  ('CRM', 2, 2),
  ('FUD', 3, 2),
  ('Tickets', 3, 3),
  ('DB2', 4, 4),
  ('Phase5', 4, 5),
  ('Airlines', 5, 6),
  ('Service Desk', 5, 7),
  ('Monitor', 5, 7);

# 06. Populate developer's skills (1 developer --> different skills)
INSERT INTO developer_skills (developer_id, skill_id) VALUES
  (1,4),(1,5),(1,6),
  (2,1),(2,10),
  (3,2),(3,9),
  (4,3),(4,8),
  (5,7),
  (6,5),(6,6),(6,8),
  (7,1),(7,2),
  (8,3),(8,4),
  (9,8),(9,9),
  (10,10),
  (11,2),(11,3),(11,4),
  (12,1),(12,8),
  (13,5),(13,9),
  (14,8),(14,9),
  (15,9),
  (16,8),(16,9),
  (17,10),
  (18,2),(18,3),(18,10),
  (19,1),(19,6),
  (20,5),(20,6),
  (21,8),(21,9),
  (22,6);

# 07. Populate relations between projects and developers
# 1 project --> different developers
# 1 developer could work on different projects
INSERT INTO developer_projects (project_id, developer_id) VALUES
  (1,1),(1,2),
  (2,2),(2,3),
  (3,4),(3,5),(3,6),(3,7),
  (4,8),(4,9),
  (5,10),(5,11),
  (6,12),(6,13),(6,14),
  (7,14),(7,15),(7,16),
  (8,17),(8,18),
  (9,19),(9,20),
  (10,21),(10,22);
