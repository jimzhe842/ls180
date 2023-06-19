CREATE TABLE vehicles(
  id serial PRIMARY KEY, -- PRIMARY KEY has a NOT NULL constraint included
  name text NOT NULL,
  range integer NOT NULL,
  electric BOOLEAN NOT NULL
);

CREATE TABLE vehicles2(
  id serial PRIMARY KEY, -- PRIMARY KEY has a NOT NULL constraint included
  name NOT NULL,
  range NOT NULL,
  electric NOT NULL
);

-- Each table must have a data type

-- REMEMBER SEMICOLONS!

ALTER TABLE vehicles ADD CHECK(range > 0);

INSERT INTO vehicles (name, range, electric) VALUES
('Matrix', 422, false),
('Leaf', 73, true),
('Prius', 450, false);

ALTER TABLE vehicles ADD column purchased_on date DEFAULT NOW();

ALTER TABLE vehicles DROP column purchased_on;

CREATE TABLE manufacturers(
  id serial PRIMARY KEY,
  name text NOT NULL
);



INSERT INTO manufacturers (name) VALUES
('Toyota'),
('Nissan');

ALTER TABLE vehicles ADD column manufacturer_id integer REFERENCES manufacturers(id);

UPDATE vehicles SET manufacturer_id = 1 WHERE name = 'Prius' OR name = 'Matrix';
UPDATE vehicles SET manufacturer_id = 2 WHERE name = 'Leaf';


ALTER TABLE vehicles ALTER column manufacturer_id SET NOT NULL;

SELECT m.name AS manufacturer, count(m.name), round(avg(v.range)) AS average_range FROM
manufacturers AS m INNER JOIN vehicles AS v ON m.id = v.manufacturer_id
GROUP BY m.name
ORDER BY average_range DESC;

ALTER TABLE manufacturers ADD CHECK(substr(name, 1, 1) = upper(substr(name, 1, 1)));

