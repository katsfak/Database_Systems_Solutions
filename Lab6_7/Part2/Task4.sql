/*Task 4 
In the anonymous block, declare a variable to store the employee ID. Start it value 
7782. Write the employee's name and annual earnings with such an ID (annual 
earnings are 12 salary). Use anchor declarations and the SELECT ... INTO construct. 
Then test the block for an employee with an Employee ID equal to 7900 and 7327. 
Add the appropriate exception section.*/

SET SERVEROUTPUT ON
DECLARE
    emp_id NUMBER := 7782; -- Variable to store the employee ID
    emp_name VARCHAR2(100); -- Variable to store the employee name
    annual_earnings NUMBER; -- Variable to store the annual earnings
BEGIN
    -- Select the employee name and annual earnings based on the employee ID
    SELECT ENAME, SAL * 12
    INTO emp_name, annual_earnings
    FROM EMP
    WHERE EMPNO = emp_id;

    -- Display the results
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_name);
    DBMS_OUTPUT.PUT_LINE('Annual Earnings: ' || TO_CHAR(annual_earnings));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with ID: ' || emp_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/