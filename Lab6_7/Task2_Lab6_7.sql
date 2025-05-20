/*Task 2 
Write an anonymous block that will write the name of the database user you are 
working on. */
SET SERVEROUTPUT ON
BEGIN
    DBMS_OUTPUT.PUT_LINE('The name of the database user is: ' || USER);
END;