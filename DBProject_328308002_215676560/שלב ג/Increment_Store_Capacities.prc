- Procedure: Increment_Store_Capacities
CREATE OR REPLACE PROCEDURE Increment_Store_Capacities(p_base_name IN VARCHAR2, p_increment IN NUMBER) IS
  CURSOR store_cursor IS
    SELECT Store_ID, Capacity
    FROM Stores
    WHERE Base = p_base_name
    FOR UPDATE OF Capacity;
  v_counter NUMBER := 0;   
  v_store store_cursor%ROWTYPE;
  v_default_capacity NUMBER := 100;
  v_message VARCHAR2(100);
BEGIN
  OPEN store_cursor;
  LOOP
    FETCH store_cursor INTO v_store;
    EXIT WHEN store_cursor%NOTFOUND;
    
    -- Check if increment does not exceed 3000
    IF v_store.Capacity + p_increment <= 3000 THEN
      v_store.Capacity := v_store.Capacity + p_increment;
      
      -- Ensure capacity is not negative
      IF v_store.Capacity < 0 THEN
        v_store.Capacity := 0;
      END IF;
      
      UPDATE Stores
      SET Capacity = v_store.Capacity
      WHERE CURRENT OF store_cursor;
      
      v_message := 'Updated store ' || v_store.Store_ID || ' capacity to ' || v_store.Capacity;
      DBMS_OUTPUT.PUT_LINE(v_message);
    ELSE
      v_message := 'Store ' || v_store.Store_ID || ' capacity increment skipped, would exceed 3000.';
      DBMS_OUTPUT.PUT_LINE(v_message);
    END IF;
  END LOOP;
  CLOSE store_cursor;
  
  -- Check if any store was updated
  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No stores found in the specified base.');
  END IF;
  
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred while updating store capacities.');
    ROLLBACK;
END;
/
/
