CREATE TABLE IF NOT EXISTS developers (
  developer_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  PRIMARY KEY (developer_id),
  INDEX (surname)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS skills (
  skill_id INT NOT NULL AUTO_INCREMENT,
  skill_name VARCHAR(50) NOT NULL,
  UNIQUE (skill_id, skill_name),
  PRIMARY KEY (skill_id),
  INDEX (skill_name)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS developer_skill (
  developer_id INT NOT NULL,
  skill_id INT NOT NULL,
  UNIQUE (developer_id, skill_id),
  PRIMARY KEY (developer_id, skill_id),
  FOREIGN KEY (developer_id) REFERENCES developers (developer_id),
  FOREIGN KEY (skill_id) REFERENCES skills (skill_id)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS companies (
  company_id INT NOT NULL AUTO_INCREMENT,
  company_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (company_id),
  INDEX (company_name)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS customers (
  customer_id INT NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (customer_id),
  INDEX (customer_name)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS projects (
  project_id INT NOT NULL AUTO_INCREMENT,
  project_name VARCHAR(50) NOT NULL,
  company_id INT NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (project_id),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  UNIQUE (project_id, project_name),
  INDEX (project_name)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS developer_project (
  developer_id INT NOT NULL,
  project_id INT NOT NULL,
  FOREIGN KEY (developer_id) REFERENCES developers (developer_id),
  FOREIGN KEY (project_id) REFERENCES projects (project_id),
  UNIQUE (developer_id, project_id)
)
  ENGINE = InnoDB;
