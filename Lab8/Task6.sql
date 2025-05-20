/*Task 6
Create the procedure that computes the square of the value of a passed value.*/
-- -- output from PL/SQL blocks.
SET SERVEROUTPUT ON;
-- -- Procedure definition
CREATE OR REPLACE PROCEDURE compute_square(
    input_value IN NUMBER,
    square_value OUT NUMBER
) IS
BEGIN
    -- Calculate the square of the input value
    square_value := input_value * input_value;
END;
/
-- -- Procedure call example
DECLARE
    num NUMBER := 5;
    square_result NUMBER;
BEGIN
    -- Call the procedure to compute the square
    compute_square(num, square_result);
    
    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Square of ' || num || ' is: ' || square_result);
END;
/
-- -- The above code defines a PL/SQL procedure named `compute_square` that takes an input number
-- -- and returns its square using an OUT parameter. The procedure is then called with a number,
-- -- and the result is displayed using `DBMS_OUTPUT.PUT_LINE`.
-- -- The output will be:
-- -- Square of 5 is: 25
-- -- This demonstrates how to create and call a PL/SQL procedure that performs a simple calculation