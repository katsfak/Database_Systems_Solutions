/*Task 6 
The head offered a one-time supplement to the salary. For people with work 
experience: 
shorter or equal to one year - PLN 2 for each full month worked in the company more 
than a year, but less than or equal to 5 years - PLN 25 for each full year worked in the 
company longer than 5 years, but less than or equal to 10 years - 30 PLN for each full 
year worked in the company longer than 10 years, but shorter or equal to 15 years - 40 
PLN for each full year worked in the company more than 15 years - 50 PLN for each 
full year worked in the company. In the anonymous block, declare a variable that 
stores the employee ID (7782) and initialize it. For employee with such an identifier, 
write the name, internship in full months, internship in full years and the amount of 
the supplement. Consider possible exceptions. 
CLARK, internship in full months: 451, internship in full years: 37, supplement: 
1850
*/
SET SERVEROUTPUT ON
DECLARE
    emp_id NUMBER := 7782; -- Variable to store the employee ID
    emp_name VARCHAR2(100); -- Variable to store the employee name
    months_of_experience NUMBER; -- Variable to store months of experience
    years_of_experience NUMBER; -- Variable to store years of experience
    supplement_amount NUMBER; -- Variable to store the supplement amount
    hire_date DATE; -- Variable to store the hire date
    current_date DATE := SYSDATE; -- Variable to store the current date
    months_difference NUMBER; -- Variable to store the difference in months
BEGIN
    -- Select the employee name, hire date, and calculate months of experience
    SELECT ENAME, HIREDATE
    INTO emp_name, hire_date
    FROM EMP
    WHERE EMPNO = emp_id;

    -- Calculate the difference in months between the current date and hire date
    months_difference := MONTHS_BETWEEN(current_date, hire_date);
    
    -- Calculate years of experience
    years_of_experience := TRUNC(months_difference / 12);
    
    -- Calculate months of experience
    months_of_experience := MOD(months_difference, 12);

    -- Determine the supplement amount based on years of experience
    IF years_of_experience <= 1 THEN
        supplement_amount := 2 * months_of_experience;
    ELSIF years_of_experience <= 5 THEN
        supplement_amount := 25 * years_of_experience;
    ELSIF years_of_experience <= 10 THEN
        supplement_amount := 30 * years_of_experience;
    ELSIF years_of_experience <= 15 THEN
        supplement_amount := 40 * years_of_experience;
    ELSE
        supplement_amount := 50 * years_of_experience;
    END IF;

    -- Display the results
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_name);
    DBMS_OUTPUT.PUT_LINE('Experience in Full Months: ' || TO_CHAR(months_difference));
    DBMS_OUTPUT.PUT_LINE('Experience in Full Years: ' || TO_CHAR(years_of_experience));
    DBMS_OUTPUT.PUT_LINE('Supplement Amount: ' || TO_CHAR(supplement_amount));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with ID: ' || emp_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/