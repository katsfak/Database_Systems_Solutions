/*Task 6 
Using the anonymous block, write 20 consecutive numbers divisible by 4, starting 
from 28. */
DECLARE
    v_number NUMBER := 28; -- Starting number
    v_count  NUMBER := 0;  -- Counter for numbers found
BEGIN
    WHILE v_count < 20 LOOP
        IF MOD(v_number, 4) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(v_number);
            v_count := v_count + 1;
        END IF;
        v_number := v_number + 1; -- Increment the number
    END LOOP;
END;