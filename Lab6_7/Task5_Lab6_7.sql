/*Task 5 
Write the program calculates the factorial of a given number by calling itself 
recursively */

CREATE OR REPLACE FUNCTION factorial(n IN NUMBER) RETURN NUMBER IS
    result NUMBER;
BEGIN
    IF n = 0 THEN
        result := 1;
    ELSE
        result := n * factorial(n - 1);
    END IF;
    RETURN result;
END;
/
-- Example usage:
SELECT factorial(5) FROM dual;

