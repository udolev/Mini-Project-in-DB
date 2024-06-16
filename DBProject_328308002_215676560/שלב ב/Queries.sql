-- Query 1: select for each store the item with the max price. List the items in descening order.
SELECT I.Serial_Number, I.Manufact_Date, I.Price, S.Base
FROM Item I
JOIN Stores S ON I.Store_ID = S.Store_ID
WHERE I.Price = (SELECT MAX(I2.Price) FROM Item I2 WHERE I2.Store_ID = I.Store_ID)
ORDER BY I.Price DESC;

-- Query 2: Group the items by the year and month of manufacturing, showing the count and average price for each month.
SELECT 
    Year,
    Month,
    Total_Items,
    Avg_Price
FROM (
    SELECT 
        EXTRACT(YEAR FROM Manufact_Date) AS Year,
        EXTRACT(MONTH FROM Manufact_Date) AS Month,
        COUNT(Serial_Number) AS Total_Items,
        AVG(Price) AS Avg_Price
    FROM 
        Item
    GROUP BY 
        EXTRACT(YEAR FROM Manufact_Date),
        EXTRACT(MONTH FROM Manufact_Date)
) MonthlyStats
ORDER BY 
    Year DESC, 
    Month DESC;

-- Query 3: List soldiers owning weapons with reliability above 5(out of 10). order by the soldier's rank and total weapons this soldier ownes. 
SELECT So.Soldier_ID, So.First_Name, So.Last_Name, So.Soldier_Rank, W.Weapon_Type, W.Weight, 
       (SELECT COUNT(*) FROM Owns O2 WHERE O2.Soldier_ID = So.Soldier_ID) AS Total_Owned_Items
FROM Soldier So
JOIN Owns O ON So.Soldier_ID = O.Soldier_ID
JOIN Weapon W ON O.Serial_Number = W.Serial_Number
WHERE W.Reliability > 5
ORDER BY So.Soldier_Rank, Total_Owned_Items DESC;

-- Query 4: For each store with above-average capacity - find the average price of items in it. List the stores in descening order.
SELECT S.Store_ID, S.Base, S.Capacity, AvgItemPrices.Avg_Price
FROM Stores S
JOIN (
    SELECT Store_ID, AVG(Price) AS Avg_Price
    FROM Item
    GROUP BY Store_ID
) AvgItemPrices ON S.Store_ID = AvgItemPrices.Store_ID
WHERE S.Capacity > (SELECT AVG(Capacity) FROM Stores)
ORDER BY S.Capacity DESC;


-- Update the prices where the price is above the average
UPDATE Item
SET Price = Price * 1.10
WHERE Price > (SELECT AVG(Price) FROM Item);

-- Update Query 2: Update the rank of soldiers who manage more than 20 hours per week to 'Sergeant'.
UPDATE Soldier
SET Soldier_Rank = 'RavSamal'
WHERE Soldier_ID IN (
  SELECT Soldier_ID
  FROM Storeman
  WHERE Hours_Per_Week > 20
);

-- Delete Query 1: Delete all items stored in stores with a capacity below 50
DELETE FROM Weapon W
WHERE W.Serial_Number IN (
select serial_number FROM Item
WHERE Store_ID IN (
    SELECT Store_ID
    FROM Stores
    WHERE Capacity < 500)
); 
DELETE FROM Uniform W
WHERE W.Serial_Number IN (
select serial_number FROM Item
WHERE Store_ID IN (
    SELECT Store_ID
    FROM Stores
    WHERE Capacity < 500)
); 
DELETE FROM Owns W
WHERE W.Serial_Number IN (
select serial_number FROM Item
WHERE Store_ID IN (
    SELECT Store_ID
    FROM Stores
    WHERE Capacity < 500)
); 
DELETE FROM Item
WHERE Store_ID IN (
    SELECT Store_ID
    FROM Stores
    WHERE Capacity < 500
); 


-- Delete Query 2: Remove all soldiers who do not own any items.
DELETE FROM storeman S
WHERE  S.SOLDIER_ID IN (SELECT SOLDIER_ID FROM Soldier
WHERE Soldier_ID NOT IN (SELECT Soldier_ID FROM Owns));

DELETE FROM Soldier
WHERE Soldier_ID NOT IN (SELECT Soldier_ID FROM Owns);

