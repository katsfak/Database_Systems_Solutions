/*Task 2. 
Create the definition and call of a simple PL / SQL function that calculates and returns the 
minimum of three values.
*/
SET SERVEROUTPUT ON;
-- Function definition
CREATE OR REPLACE FUNCTION min_of_three(val1 IN NUMBER, val2 IN NUMBER, val3 IN NUMBER)
RETURN NUMBER IS min_value NUMBER;
BEGIN
    -- Initialize min_value with the first value
    min_value := val1;

    -- Compare with the second value
    IF val2 < min_value THEN
        min_value := val2;
    END IF;

    -- Compare with the third value
    IF val3 < min_value THEN
        min_value := val3;
    END IF;

    RETURN min_value;
END;
/
-- Function call example
DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
    c NUMBER := 5;
    result NUMBER;
BEGIN
    result := min_of_three(a, b, c);
    DBMS_OUTPUT.PUT_LINE('Minimum value is: ' || result);
END;