# Calculate total salary for Java developers

SELECT 'Java' as Skill, sum(developers.salary) as 'Total salary' FROM developers
  LEFT JOIN developer_skills ON developers.id = developer_skills.developer_id
  LEFT JOIN skills ON developer_skills.skill_id = skills.id
WHERE skills.name = 'Java';