/*Task 5 
In the anonymous block, declare a variable to store dates and initiate it on Dec 17, 
1980. 
Find a person who was hired that day. If it's a clerk, write his  name, and if a sales 
representative, then write his salary. Test the block also for the dates May 20, 
2007. Add the appropriate section exceptions.*/
SET SERVEROUTPUT ON
DECLARE
    hire_date DATE := TO_DATE('17-DEC-1980', 'DD-MON-YYYY'); -- Variable to store the hire date
    emp_name VARCHAR2(100); -- Variable to store the employee name
    emp_salary NUMBER; -- Variable to store the employee salary
BEGIN
    -- Select the employee name and salary based on the hire date
    SELECT ENAME, SAL
    INTO emp_name, emp_salary
    FROM EMP
    WHERE HIREDATE = hire_date;

    -- Check the job title and display the appropriate information
    IF (SELECT JOB FROM EMP WHERE HIREDATE = hire_date) = 'CLERK' THEN
        DBMS_OUTPUT.PUT_LINE('Clerk Name: ' || emp_name);
    ELSIF (SELECT JOB FROM EMP WHERE HIREDATE = hire_date) = 'SALESMAN' THEN
        DBMS_OUTPUT.PUT_LINE('Salesman Salary: ' || TO_CHAR(emp_salary));
    ELSE
        DBMS_OUTPUT.PUT_LINE('No matching employee found for the given hire date.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with the hire date: ' || TO_CHAR(hire_date, 'DD-MON-YYYY'));
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/