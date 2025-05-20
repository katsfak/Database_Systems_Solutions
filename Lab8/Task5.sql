/*Task 5
Create the procedure that takes two numbers using IN mode and returns the minimum using 
OUT parameters.*/
SET SERVEROUTPUT ON;
-- Procedure definition
CREATE OR REPLACE PROCEDURE find_minimum(
    num1 IN NUMBER,
    num2 IN NUMBER,
    min_value OUT NUMBER
) IS
BEGIN
    -- Compare the two numbers and assign the minimum to min_value
    IF num1 < num2 THEN
        min_value := num1;
    ELSE
        min_value := num2;
    END IF;
END;
/
-- Procedure call example
DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
    min_result NUMBER;
BEGIN
    -- Call the procedure to find the minimum
    find_minimum(a, b, min_result);
    
    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Minimum value is: ' || min_result);
END;
/
-- The above code defines a PL/SQL procedure named `find_minimum` that takes two input numbers
-- and returns the minimum of the two using an OUT parameter. The procedure is then called
-- with two numbers, and the result is displayed using `DBMS_OUTPUT.PUT_LINE`.