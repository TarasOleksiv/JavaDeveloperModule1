# 01. Add column salary for developers
ALTER TABLE developers
ADD COLUMN salary DECIMAL(7,2) NOT NULL DEFAULT 0 AFTER company_id;

# 02. Populate salaries for developers
UPDATE developers SET salary = 2000 WHERE id IN (1,5,10,15,20);
UPDATE developers SET salary = 1500 WHERE id IN (2,6,11,16,21);
UPDATE developers SET salary = 1000 WHERE id IN (3,7,12,17,22);
UPDATE developers SET salary = 800 WHERE id IN (4,8,13,18);
UPDATE developers SET salary = 600 WHERE id IN (9,14,19);