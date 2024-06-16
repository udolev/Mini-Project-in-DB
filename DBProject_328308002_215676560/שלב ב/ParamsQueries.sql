-- Query 4: Get items manufactured in a specific year.
-- Parameter: &ManufactYear (INT)
SELECT Serial_Number, Manufact_Date, Price
FROM Item
WHERE EXTRACT(YEAR FROM Manufact_Date) = EXTRACT(YEAR FROM (
                            &<name = "ManufactYear"
                              hint = "Enter year between 1990 to 2023"
                              type = DATE>));

-- Query 2: Find all items owned by a specific soldier.
-- Parameter: SoldierID (INT)
SELECT I.Serial_Number, I.Manufact_Date, I.Price
FROM Owns O
JOIN Item I ON O.Serial_Number = I.Serial_Number
WHERE O.Soldier_ID = &<name = "SoldierID"
                       list ="select Soldier_ID from Soldier"
                       required = true>;

-- Query 3: List soldiers owning weapons with details, filtered by weapon reliability.
-- Parameter: Reliability (INT)
SELECT So.Soldier_ID, So.First_Name, So.Last_Name, So.Soldier_Rank, W.Weapon_Type, W.Weight
FROM Soldier So
JOIN Owns O ON So.Soldier_ID = O.Soldier_ID
JOIN Weapon W ON O.Serial_Number = W.Serial_Number
WHERE W.Reliability > &<name=Reliability
                        default = 5
                        list= "1,2,3,4,5,6,7,8,9"
                        required = true>
ORDER BY So.Soldier_Rank DESC;

-- Query 4: Get suppliers information if it is one of given Locations.
-- Parameter: Locations (VARCHAR(MAX))
SELECT Company_Name, Email, S.Location
FROM Supplier S
WHERE S.Location IN (&<name=Location
                       type = "string"
                       ifempty ="Williston"
                       list= "select Location from Supplier"
                       multiselect="yes">);
