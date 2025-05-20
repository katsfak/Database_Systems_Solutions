/*Task 7 
Write an anonymous block, which will list the names of all branches along with 
the maximum information and the minimum wage in the institution (or with an 
appropriate message if the facility does not have any employees).*/
SET SERVEROUTPUT ON
DECLARE
    branch_name VARCHAR2(100); -- Variable to store the branch name
    max_salary NUMBER; -- Variable to store the maximum salary
    min_salary NUMBER; -- Variable to store the minimum salary
    branch_count NUMBER; -- Variable to store the number of employees in the branch
BEGIN
    -- Select the branch name, maximum salary, and minimum salary
    SELECT B.BRANCH_NAME, MAX(E.SAL), MIN(E.SAL)
    INTO branch_name, max_salary, min_salary
    FROM BRANCH B
    LEFT JOIN EMP E ON B.BRANCH_ID = E.BRANCH_ID
    GROUP BY B.BRANCH_NAME;
    
    -- Check if there are employees in the branch
    branch_count := (SELECT COUNT(*) FROM EMP WHERE BRANCH_ID = (SELECT BRANCH_ID FROM BRANCH WHERE BRANCH_NAME = branch_name));
    
    IF branch_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Branch Name: ' || branch_name);
        DBMS_OUTPUT.PUT_LINE('Maximum Salary: ' || TO_CHAR(max_salary));
        DBMS_OUTPUT.PUT_LINE('Minimum Salary: ' || TO_CHAR(min_salary));
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employees found in the branch: ' || branch_name);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No branches found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/