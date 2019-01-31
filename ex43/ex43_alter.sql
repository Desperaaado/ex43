ALTER TABLE person ADD COLUMN dead INTEGER;
ALTER TABLE person ADD COLUMN p_num INTEGER;
ALTER TABLE person ADD COLUMN salary FLOAT;
ALTER TABLE person ADD COLUMN dob DATETIME;
ALTER TABLE pet ADD COLUMN dob DATETIME;
ALTER TABLE person_pet ADD COLUMN p_on DATETIME;
ALTER TABLE pet ADD COLUMN parent INTEGER;

UPDATE person
    SET hatred = 1,
        dead = 0,
        p_num = 233,
        salary = 0.1,
        dob = '2005-10-02 21:33:22'
    WHERE id = 0;

UPDATE person
    SET hatred = 2,
        dead = 0,
        p_num = 666,
        salary = 0.01,
        dob = '2003-10-02 21:33:22'
    WHERE id = 1;

UPDATE pet
    SET dob = '2005-10-02 21:33:22'
    WHERE id IN (
        SELECT pet.id FROM person, pet, person_pet
        WHERE
        person_pet.person_id = person.id AND
        person_pet.pet_id = pet.id AND
        person.id = 0
    );
UPDATE pet
    SET dob = '2003-10-02 21:33:22'
    WHERE id IN (
        SELECT pet.id FROM pet, person, person_pet
        WHERE
        person_pet.person_id = person.id AND
        person_pet.pet_id = pet.id AND
        person.id = 1
    );

UPDATE pet SET parent = -1 WHERE id = 0;
UPDATE pet SET parent = 0 where id = 1 OR id = 2;

UPDATE person_pet SET p_on = '2005-10-02 21:33:22'
    WHERE pet_id = 0 OR pet_id = 1;
UPDATE person_pet SET p_on = '2003-10-02 21:33:22'
    WHERE pet_id = 2;

-- .schema pet
INSERT INTO person (id, fname, lname, age, hatred, dead, p_num, salary, dob)
    VALUES(2, 'A', '2', 22, 2, 0, 222, 2, '2008-10-02 23:44:29');
INSERT INTO person (id, fname, lname, age, hatred, dead, p_num, salary, dob)
    VALUES(3, 'A', '3', 33, 3, 0, 333, 3, '2003-03-02 23:33:33');
INSERT INTO person (id, fname, lname, age, hatred, dead, p_num, salary, dob)
    VALUES(4, 'A', '4', 44, 4, 0, 444, 4, '2004-04-04 23:44:44');
INSERT INTO person (id, fname, lname, age, hatred, dead, p_num, salary, dob)
    VALUES(5, 'A', '5', 55, 5, 0, 555, 5, '2005-05-05 23:55:55');

INSERT INTO pet (id, name, breed, age, dead, dob, parent)
    VALUES(3, 'a3', '3', 33, 0, '2003-03-02 23:33:33', 0);
INSERT INTO pet (id, name, breed, age, dead, dob, parent)
    VALUES(4, 'a4', '4', 44, 0, '2004-04-04 23:44:44', 0);
INSERT INTO pet (id, name, breed, age, dead, dob, parent)
    VALUES(5, 'a5', '5', 55, 0, '2005-05-05 23:55:55', 1);
INSERT INTO pet (id, name, breed, age, dead, dob, parent)
    VALUES(6, 'a6', '6', 66, 1, '2005-05-05 23:55:55', 1);
INSERT INTO pet (id, name, breed, age, dead, dob, parent)
    VALUES(7, 'a7', '7', 77, 1, '2005-05-05 23:55:55', 1);

INSERT INTO person_pet (person_id, pet_id, p_on)
    VALUES (3, 3, '2003-03-02 23:33:33');
INSERT INTO person_pet (person_id, pet_id, p_on)
    VALUES (4, 4, '2004-04-04 23:44:44');
INSERT INTO person_pet (person_id, pet_id, p_on)
    VALUES (5, 5, '2005-05-05 23:55:55');
INSERT INTO person_pet (person_id, pet_id, p_on)
    VALUES (5, 6, '2005-05-05 23:55:55');
INSERT INTO person_pet (person_id, pet_id, p_on)
    VALUES (5, 7, '2005-05-05 23:55:55');


-- id, name, breed, age, dead, dob, parent


SELECT * FROM person;
SELECT * FROM pet;
SELECT * FROM person_pet;
-- id, fname, lname, age, hatred, dead, p_num, salary, dob 

SELECT person.fname, person.lname, pet.name
    FROM person, pet, person_pet
    WHERE
    person_pet.person_id = person.id AND
    person_pet.pet_id = pet.id AND
    person_pet.p_on > '2004-01-01';

SELECT name FROM pet
    WHERE id IN (
        SELECT parent FROM pet WHERE name = 'a6' 
    );
