CREATE OR REPLACE FUNCTION calculate_avg_age(
    p_rank IN soldier.Soldier_Rank%type,
    p_unit IN soldier.unit%type
) RETURN NUMBER IS
    v_total_age NUMBER := 0;
    v_count_soldiers NUMBER := 0;
    v_age NUMBER;
    
    -- Declare the cursor with additional fields
    CURSOR c_soldiers IS
        SELECT First_Name, Last_Name, Birth_Date
        FROM Soldier
        WHERE Unit = p_unit AND Soldier_Rank = p_rank;
        
    soldier_not_found EXCEPTION;
BEGIN
    -- Use a FOR loop to iterate over the cursor
    FOR r_soldier IN c_soldiers LOOP
        -- Calculate age for each soldier
        v_age := MONTHS_BETWEEN(SYSDATE, r_soldier.Birth_Date) / 12;
        
        -- Print soldier details
        DBMS_OUTPUT.PUT_LINE('Soldier: ' || r_soldier.First_Name || ' ' || 
                             r_soldier.Last_Name || ', Age: ' || 
                             ROUND(v_age, 2) || ' years');
        
        -- Add to total age
        v_total_age := v_total_age + v_age;
        v_count_soldiers := v_count_soldiers + 1;
    END LOOP;

    -- Raise exception if no soldiers found
    IF v_count_soldiers = 0 THEN
        RAISE soldier_not_found;
    END IF;

    -- Calculate and return the average age
    DBMS_OUTPUT.PUT_LINE('Total soldiers: ' || v_count_soldiers);
    RETURN v_total_age / v_count_soldiers;

EXCEPTION
    WHEN soldier_not_found THEN
        DBMS_OUTPUT.PUT_LINE('No soldiers found for the given unit and rank.');
        RETURN NULL; -- Return NULL if no soldiers found for the given unit and rank
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RETURN NULL; -- Handle any other unexpected errors gracefully
END;
/
