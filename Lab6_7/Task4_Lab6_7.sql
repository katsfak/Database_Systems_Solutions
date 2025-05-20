-- Enable DBMS_OUTPUT in SQL*Plus or SQL Developer
SET SERVEROUTPUT ON;

-- Function definition
CREATE OR REPLACE FUNCTION max_of_two(val1 IN NUMBER, val2 IN NUMBER)
RETURN NUMBER
IS
BEGIN
    IF val1 > val2 THEN
        RETURN val1;
    ELSE
        RETURN val2;
    END IF;
END;
/

-- Function call example
DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
    result NUMBER;
BEGIN
    result := max_of_two(a, b);
    DBMS_OUTPUT.PUT_LINE('Maximum value is: ' || result);
END;
/