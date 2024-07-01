Function: Get_All_Stores_In_Base
CREATE OR REPLACE FUNCTION Get_All_Stores_In_Base(p_base_name IN VARCHAR2) 
RETURN NUMBER IS
  TYPE store_record IS RECORD (
    store_id Stores.Store_ID%TYPE,
    base Stores.Base%TYPE,
    capacity Stores.Capacity%TYPE
  );
  
  CURSOR store_cursor IS
    SELECT Store_ID, Base, Capacity
    FROM Stores
    WHERE Base = p_base_name;
    
  v_store store_record;
  v_counter NUMBER := 0;
BEGIN
  OPEN store_cursor;
  LOOP
    FETCH store_cursor INTO v_store;
    EXIT WHEN store_cursor%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Store ID: ' || v_store.store_id || ', Base: ' || v_store.base || ', Capacity: ' || v_store.capacity);
    v_counter := v_counter + 1;
  END LOOP;
  CLOSE store_cursor;
  
  RETURN v_counter;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred while fetching stores.');
    RETURN NULL;
END;
