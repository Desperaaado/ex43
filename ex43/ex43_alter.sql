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



SELECT * FROM person;
SELECT * FROM pet;
SELECT * FROM person_pet;
-- id, fname, lname, age, hatred, dead, p_num, salary, dob 
