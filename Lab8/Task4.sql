/*Task 4.
Create a simple procedure that displays the string "Hello World!" on the screen during 
execution. */
SET SERVEROUTPUT ON;
-- Procedure definition 
CREATE OR REPLACE PROCEDURE hello_world IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!');
END;
/
-- Procedure call example
BEGIN
    hello_world;
END;
/
-- The above code defines a simple PL/SQL procedure named `hello_world` that, when executed,
-- prints "Hello World!" to the output. The `SET SERVEROUTPUT ON` command is used to enable