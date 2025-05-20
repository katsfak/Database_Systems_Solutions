/*Task 3 
Write an anonymous block that will display information about the number of 
employed Manager and the number of employees Sales (are employees' 
occupations). Use the SELECT construction twice ...  INTO. 
Manager: 3, Sales: 4*/
SET SERVEROUTPUT ON
DECLARE
    num_managers NUMBER; -- Variable to hold the number of managers
    num_sales NUMBER; -- Variable to hold the number of sales employees
BEGIN
    -- Select the number of managers from the EMPLOYEES table
    SELECT COUNT(*)
    INTO num_managers
    FROM EMP
    WHERE JOB = 'MANAGER';
    
    -- Select the number of sales employees from the EMPLOYEES table
    SELECT COUNT(*)
    INTO num_sales
    FROM EMP
    WHERE JOB = 'SALESMAN';
    
    -- Display the results
    DBMS_OUTPUT.PUT_LINE('Number of Managers: ' || TO_CHAR(num_managers));
    DBMS_OUTPUT.PUT_LINE('Number of Sales Employees: ' || TO_CHAR(num_sales));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/