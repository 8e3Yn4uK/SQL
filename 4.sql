-ALTER TABLE projects ADD COLUMN cost REAL;
 +ALTER TABLE projects ADD COLUMN cost INT DEFAULT 0;
  
 -UPDATE projects SET cost = 100000.0 WHERE project_id = 1;
 -UPDATE projects SET cost = 200000.0 WHERE project_id = 2;
 -UPDATE projects SET cost = 300000.0 WHERE project_id = 3;
 -UPDATE projects SET cost = 400000.0 WHERE project_id = 4;
 -UPDATE projects SET cost = 450000.0 WHERE project_id = 5;
 -UPDATE projects SET cost = 500000.0 WHERE project_id = 6;
 -UPDATE projects SET cost = 550000.0 WHERE project_id = 7;
 -UPDATE projects SET cost = 600000.0 WHERE project_id = 8;
 -UPDATE projects SET cost = 650000.0 WHERE project_id = 9;
 -UPDATE projects SET cost = 700000.0 WHERE project_id = 10;
 -UPDATE projects SET cost = 750000.0 WHERE project_id = 11;
 -UPDATE projects SET cost = 800000.0 WHERE project_id = 12; 
 +UPDATE projects AS a,
 +  (SELECT p.project_id, sum(d.salary) as total FROM projects p
 +    INNER JOIN developer_project dp ON p.project_id = dp.project_id
 +    INNER JOIN developers d ON dp.developer_id = d.developer_id
 +    GROUP BY p.project_id) AS b
 +  SET a.cost = (b.total + 3500)
 +WHERE a.project_id = b.project_id
