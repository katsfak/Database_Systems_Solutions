/*Task 3  
Using varray,% ROWTYPE or% TYPE for any field of the database table (emp, 
dept), write the cursor. The cursor should illustrate the concept of using these elements.*/
SET SERVEROUTPUT ON;
DECLARE
    TYPE emp_table IS TABLE OF EMP%ROWTYPE INDEX BY PLS_INTEGER;
    emp_data emp_table;
    
    CURSOR emp_cursor IS
        SELECT * FROM EMP;
BEGIN
    -- Open the cursor
    OPEN emp_cursor;
    
    -- Fetch data into the table type
    LOOP
        FETCH emp_cursor BULK COLLECT INTO emp_data LIMIT 10;
        EXIT WHEN emp_data.COUNT = 0;
        
        -- Display the fetched data
        FOR i IN 1 .. emp_data.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Employee Number: ' || emp_data(i).empno);
            DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_data(i).ename);
            DBMS_OUTPUT.PUT_LINE('Hire Date: ' || TO_CHAR(emp_data(i).hiredate, 'DD-MON-YYYY'));
            DBMS_OUTPUT.PUT_LINE('-----------------------------');
        END LOOP;
    END LOOP;
    
    -- Close the cursor
    CLOSE emp_cursor;
END;
/
-- The above code defines a VARRAY type `emp_varray` that can hold up to 10 rows of the EMP table.
-- It uses a cursor to fetch data from the EMP table and stores it in the varray.
-- The fetched data is then displayed using `DBMS_OUTPUT.PUT_LINE`.
-- The output will show the employee number, name, and hire date for each employee in the varray.