/*Task 2  
Write an anonymous block, which will display information about the minimum salary 
paid to employees of the facility called SALES. Use the anchor declaration for the 
variable holding the minimum wage and SELECT ... INTO construction.*/
SET SERVEROUTPUT ON
DECLARE
    min_salary NUMBER; -- Variable to hold the minimum salary
BEGIN
    -- Select the minimum salary from the EMPLOYEES table for the SALES department
    SELECT MIN(SAL)
    INTO min_salary
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
    
    -- Display the minimum salary
    DBMS_OUTPUT.PUT_LINE('The minimum salary in the SALES department is: ' || TO_CHAR(min_salary));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in the SALES department.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
-- The above code block retrieves the minimum salary from the EMPLOYEES table for
-- employees in the SALES department and displays it. It also handles exceptions