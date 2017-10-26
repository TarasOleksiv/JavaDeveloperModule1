# 01. Add column costs for projects
ALTER TABLE projects
  ADD COLUMN costs DECIMAL(9,2) NOT NULL DEFAULT 0 AFTER customer_id;

# 02. Populate costs for projects
UPDATE projects SET costs = 12000 WHERE id IN (1,10);
UPDATE projects SET costs = 12500 WHERE id IN (2,7,9);
UPDATE projects SET costs = 12400 WHERE id IN (3,8);
UPDATE projects SET costs = 12700 WHERE id IN (4);
UPDATE projects SET costs = 12300 WHERE id IN (5);
UPDATE projects SET costs = 12200 WHERE id IN (6);