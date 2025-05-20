/*Task 1. 
Write a program to create an array that contains names Students and their marks. Change the 
dimension of the array and supplement the data.
*/
SET SERVEROUTPUT ON
DECLARE
    TYPE StudentArray IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    TYPE MarksArray IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    
    students StudentArray;
    marks MarksArray;
    
    i PLS_INTEGER;
BEGIN
    -- Initialize the array with some data
    students(1) := 'Alice';
    students(2) := 'Bob';
    students(3) := 'Charlie';
    
    marks(1) := 85;
    marks(2) := 90;
    marks(3) := 78;
    
    -- Display the initial data
    DBMS_OUTPUT.PUT_LINE('Initial Data:');
    FOR i IN 1 .. students.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Student: ' || students(i) || ', Marks: ' || marks(i));
    END LOOP;
    
    -- Change the dimension of the array and supplement the data
    students(4) := 'David';
    marks(4) := 88;
    
    -- Display the updated data
    DBMS_OUTPUT.PUT_LINE('Updated Data:');
    FOR i IN 1 .. students.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Student: ' || students(i) || ', Marks: ' || marks(i));
    END LOOP;
END;
/