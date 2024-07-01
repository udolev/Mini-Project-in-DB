CREATE OR REPLACE PROCEDURE upgrade_soldier_rank(
    p_rank IN soldier.Soldier_Rank%type, 
    p_unit IN soldier.unit%type, 
    p_avg_age IN NUMBER)
IS
    v_new_rank soldier.Soldier_Rank%type;
    v_current_rank soldier.Soldier_Rank%type;
    v_age NUMBER;
    
    -- Define rank hierarchy
    TYPE rank_type IS TABLE OF VARCHAR2(20);
    ranks rank_type := rank_type(
        'RavTurai', 'Turai', 'Samal', 'SamalRishon', 'RavSamal',
        'SamalRishonMishneh', 'RavSamalMishneh', 'Segen', 'SegenMishneh',
        'Rotem', 'RavReshoomSitum', 'ReshoomSitum', 'Aluf', 'TatAluf',
        'AlufMishne', 'RavAluf', 'RavAlufBait', 'RoshHamatehHaklali'
    );
    
    CURSOR c_soldiers IS
        SELECT Soldier_ID, Soldier_Rank, Birth_Date
        FROM Soldier
        WHERE Unit = p_unit
          AND Soldier_Rank = p_rank
          AND TRUNC(MONTHS_BETWEEN(SYSDATE, Birth_Date) / 12) > p_avg_age;
    
    -- Custom exceptions
    e_invalid_rank EXCEPTION;
    e_invalid_unit EXCEPTION;
    e_no_rows_to_update EXCEPTION;  -- Custom exception for no rows found
    
    -- Flag to track if any updates were performed
    v_updates_found BOOLEAN := FALSE;
BEGIN
    -- Input validation
    IF p_rank IS NULL OR p_rank = '' THEN
        RAISE e_invalid_rank;
    END IF;
    
    IF p_unit IS NULL OR p_unit = '' THEN
        RAISE e_invalid_unit;
    END IF;

    -- Process soldiers
    FOR r_soldier IN c_soldiers LOOP
        v_current_rank := r_soldier.Soldier_Rank;
        v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, r_soldier.Birth_Date) / 12);

        -- Perform rank upgrade logic
        FOR i IN ranks.FIRST .. ranks.LAST LOOP
            IF ranks(i) = v_current_rank THEN
                IF i < ranks.LAST THEN
                    v_new_rank := ranks(i + 1);
                ELSE
                    v_new_rank := v_current_rank; -- Stay at current rank if at the highest level
                END IF;

                -- Update soldier's rank
                UPDATE Soldier
                SET Soldier_Rank = v_new_rank
                WHERE Soldier_ID = r_soldier.Soldier_ID;

                DBMS_OUTPUT.PUT_LINE('Soldier ID: ' || r_soldier.Soldier_ID ||
                                     ' updated to Rank: ' || v_new_rank);
                
                v_updates_found := TRUE;  -- Flag that updates were performed
                EXIT; -- Exit loop once rank is upgraded
            END IF;
        END LOOP;
    END LOOP;

    -- Check if any updates were performed
    IF NOT v_updates_found THEN
        RAISE e_no_rows_to_update;
    END IF;

    -- Commit the updates
    COMMIT;

EXCEPTION
    WHEN e_invalid_rank THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid rank provided.');
    WHEN e_invalid_unit THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid unit provided.');
    WHEN e_no_rows_to_update THEN
        DBMS_OUTPUT.PUT_LINE('No soldiers found to update.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
