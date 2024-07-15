PL/SQL Developer Test script 3.0
24
-- Main program to demonstrate function and procedure usage
DECLARE
    v_unit VARCHAR2(20) := 'Nahal';
    v_rank VARCHAR2(20) := 'RavSamal';
    v_avg_age NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Calculating average age for soldiers with rank ' || v_rank || ' in unit ' || v_unit);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
    -- Call the function to calculate the weighted average age for the given unit and rank
    v_avg_age := calculate_avg_age(v_rank, v_unit);
    
    -- Display the calculated average age
    IF v_avg_age IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Average age for ' || v_rank || ' rank in ' || v_unit || ': ' || ROUND(v_avg_age, 2));
        DBMS_OUTPUT.PUT_LINE('Upgrading ranks for soldiers in unit ' || v_unit);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
        -- Call the procedure to upgrade soldiers' ranks based on the calculated average age
        upgrade_soldier_rank(v_rank, v_unit, v_avg_age);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No soldiers found for ' || v_rank || ' rank in ' || v_unit);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
    END IF;
END;
