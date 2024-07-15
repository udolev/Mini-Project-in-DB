-- Main Program: Fetch Stores and Increment Capacities in a Base with Variable Base Name and Increment Value
DECLARE
  v_store_count NUMBER;
  v_base_name VARCHAR2(40) := 'Efraim'; 
  v_increment NUMBER := 50; -- it can be a negetive number!!
BEGIN
  -- Call the function to get all stores in a base
  v_store_count := Get_All_Stores_In_Base(v_base_name);
  DBMS_OUTPUT.PUT_LINE('Total Stores in ' || v_base_name || ': ' || v_store_count);
  
  -- Call the procedure to increment store capacities
  Increment_Store_Capacities(v_base_name, v_increment);
END;
