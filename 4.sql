ALTER TABLE projects ADD COLUMN cost INT DEFAULT 0;

UPDATE projects AS a,
  (SELECT p.project_id, sum(d.salary) as total FROM projects p
    INNER JOIN developer_project dp ON p.project_id = dp.project_id
    INNER JOIN developers d ON dp.developer_id = d.developer_id
    GROUP BY p.project_id) AS b
  SET a.cost = (b.total + 3500)
WHERE a.project_id = b.project_id;
