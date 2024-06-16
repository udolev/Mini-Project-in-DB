-- Constraint 1: Add a NOT NULL constraint to the `Weight` column in the `Weapon` table.
ALTER TABLE Weapon
MODIFY (Weight FLOAT NOT NULL);

-- Constraint 2: Add a DEFAULT value to the `Unit` column in the `Soldier` table.
ALTER TABLE Soldier
MODIFY (Unit VARCHAR2(20) DEFAULT 'Infantry');

-- Constraint 3: Add a CHECK constraint to the `Capacity` column in the `Stores` table to ensure it is positive.
ALTER TABLE Stores
ADD CONSTRAINT chk_capacity CHECK (Capacity >= 0);
