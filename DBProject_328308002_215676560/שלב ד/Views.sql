CREATE VIEW View_our_team AS
SELECT 
    sup.Company_Name,
    sup.Email,
    sup.Location AS Supplier_Location,
    st.Store_ID,
    st.Capacity AS Store_Capacity,
    it.Serial_Number,
    it.Price AS Item_Price,
    it.Manufact_Date AS Item_Manufacture_Date,
    uni.Uniform_Type,
    uni.Uniform_Size ,
    uni.Officiality AS Uniform_Officiality,
    wea.Weapon_Type,
    wea.Weight AS Weapon_Weight,
    wea.Reliability AS Weapon_Reliability
FROM 
    Supplier sup
JOIN 
    Supplies s ON sup.Company_ID = s.Company_ID
JOIN 
    Stores st ON s.Store_ID = st.Store_ID
JOIN 
    Item it ON it.Store_ID = st.Store_ID
LEFT JOIN 
    Uniform uni ON it.Serial_Number = uni.Serial_Number
LEFT JOIN 
    Weapon wea ON it.Serial_Number = wea.Serial_Number;




CREATE VIEW View_other_team AS
SELECT 
    s.Soldier_ID,
    s.First_Name,
    s.Last_Name,
    s.Soldier_Rank,
    s.Birth_Date,
    s.Unit,
    a.Aircraft_ID,
    a.Type AS Aircraft_Type,
    a.Status AS Aircraft_Status,
    m.Mission_ID,
    m.Type AS Mission_Type,
    m.Date_Of_Mission,
    f.Flight_ID,
    f.Type_Of_Flight,
    f.Date_Of_Flight
FROM 
    Soldier s
JOIN 
    Flown_By fb ON s.Soldier_ID = fb.Soldier_ID
JOIN 
    Aircraft a ON fb.Aircraft_ID = a.Aircraft_ID
JOIN 
    Assigned_To at ON a.Aircraft_ID = at.Aircraft_ID
JOIN 
    Mission m ON at.Mission_ID = m.Mission_ID
JOIN 
    Flight f ON m.Mission_ID = f.Mission_ID
