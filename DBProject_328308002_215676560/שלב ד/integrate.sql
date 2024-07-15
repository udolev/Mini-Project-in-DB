
--Connect original Soldier to Aircraft
-- Step 1: Drop the existing constraint in the Flown_by table
ALTER TABLE Flown_by DROP CONSTRAINT FK_PERSONAL_ID;

-- Step 2: Drop the soldier table
DROP TABLE soldier;

-- Step 3: Rename the soldierr table to soldier
ALTER TABLE soldierr
RENAME TO soldier;

-- Step 5: Add temporary row number columns to the soldier and Flown_by tables
ALTER TABLE soldier
ADD TEMP_RN INTEGER;

ALTER TABLE Flown_by
ADD TEMP_RN INTEGER;

-- Step 6: Populate the TEMP_RN columns with row numbers
UPDATE soldier
SET TEMP_RN = ROWNUM;

UPDATE Flown_by
SET TEMP_RN = ROWNUM;

-- Step 7: Rename the personnel_ID column to Soldier_ID in the Flown_by table
ALTER TABLE Flown_by
RENAME COLUMN personnel_ID TO Soldier_ID;

-- Step 8: Delete rows from the Flown_by table where TEMP_RN is greater than 273
DELETE FROM Flown_By
WHERE TEMP_RN > 273;

-- Step 9: Update the Soldier_ID column in the Flown_by table based on the TEMP_RN column from the soldier table
UPDATE Flown_by f
SET f.Soldier_ID = (
    SELECT so.Soldier_ID
    FROM soldier so
    WHERE so.TEMP_RN = f.TEMP_RN
);

-- Step 10: Add foreign key constraints to the Flown_by table
ALTER TABLE Flown_by
ADD CONSTRAINT fk_Flown_by_soldier
FOREIGN KEY (Soldier_ID)
REFERENCES soldier(SOLDIER_ID);

-- Step 11: Drop the temporary row number columns
ALTER TABLE Flown_by
DROP COLUMN TEMP_RN;

ALTER TABLE soldier
DROP COLUMN TEMP_RN;

-- Verify the changes by selecting data from the soldier and Flown_by tables
SELECT * FROM soldier;
SELECT * FROM Flown_by;


--Connect Stores to Base
-- Step 1: Add the row_num column to the STORES and BASE tables
ALTER TABLE STORES
ADD TEMP_RN INTEGER;

ALTER TABLE BASE
ADD TEMP_RN INTEGER;

-- Step 2: Populate the row_num column with index values
UPDATE STORES
SET TEMP_RN = ROWNUM;

UPDATE BASE
SET TEMP_RN = ROWNUM;

-- Step 3: Add the BASE_ID column to the STORES table
ALTER TABLE STORES
ADD BASE_ID INTEGER;

-- Step 4: Populate the BASE_ID column with keys from base
UPDATE STORES s
SET s.BASE_ID = (
    SELECT b.BASE_ID
    FROM BASE b
    WHERE b.TEMP_RN = s.TEMP_RN
);

-- step 5: Add foreign key constraints
ALTER TABLE STORES
ADD CONSTRAINT fk_store_base
FOREIGN KEY (base_id)
REFERENCES BASE(BASE_ID);

-- step 6:drop temporary columns
ALTER TABLE STORES
DROP COLUMN TEMP_RN;

ALTER TABLE BASE
DROP COLUMN TEMP_RN;

-- step 7:drop Base column
ALTER TABLE STORES
DROP COLUMN Base;

SELECT * from STORES;

DROP TABLE Supply;
