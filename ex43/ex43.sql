DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS person_pet;

CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    fname TEXT,
    lname TEXT,
    age INTEGER
);

CREATE TABLE pet (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT,
    age INTEGER,
    dead INTEGER
);

CREATE TABLE person_pet (
    person_id INTEGER,
    pet_id INTEGER
);

INSERT INTO person (id, fname, lname, age)
    VALUES (0, 'yx', 'xiao', 26);
INSERT INTO pet (id, name, breed, age, dead)
    VALUES (0, 'Peppa', 'pig', 2, 0);
INSERT INTO pet (id, name, breed, age, dead)
    VALUES (1, 'WALL-E', 'robot', 500, 1);
INSERT INTO pet (id, name, breed, age, dead)
    VALUES (2, 'noname', 'tea', 5, 1);
INSERT INTO person (id, fname, lname, age)
    VALUES (1, 'hole', 'ass', 999);
INSERT INTO person_pet (person_id, pet_id)
    VALUES (0, 0);
INSERT INTO person_pet (person_id, pet_id)
    VALUES (0, 1);
INSERT INTO person_pet (person_id, pet_id)
    VALUES (1, 2);

UPDATE person SET fname = 'yuxiang' WHERE id in (
    SELECT person.id FROM person, pet, person_pet
    WHERE
    person_pet.person_id = person.id AND
    person_pet.pet_id = pet.id AND
    pet.name = 'Peppa'
);

INSERT OR REPLACE INTO person (id, fname, lname, age)
    VALUES (0, 'bb', 'aa', 27); 
REPLACE INTO person (id, fname, lname, age)
    VALUES (0, 'yx', 'xiao', 26); 


UPDATE person SET fname = 'aabbccdd' WHERE id = 1;
UPDATE pet SET dead = 'DECEASED' WHERE dead = 1;

UPDATE pet SET dead = 1 WHERE dead = 'DECEASED';
DELETE FROM pet WHERE dead = 1;
INSERT INTO pet (id, name, breed, age, dead)
    VALUES (1, 'WALL-E', 'robot', 500, 1);
INSERT INTO pet  (id, name, breed, age, dead)
    VALUES (2, 'noname', 'tea', 5, 1);

ALTER TABLE person RENAME TO peoples;
ALTER TABLE peoples ADD COLUMN hatred INTEGER;
ALTER TABLE peoples RENAME TO person;
ALTER TABLE person ADD COLUMN height INTEGER;
ALTER TABLE person ADD COLUMN weight INTEGER;

SELECT * FROM person;
SELECT * FROM pet;
SELECT * FROM person_pet;
