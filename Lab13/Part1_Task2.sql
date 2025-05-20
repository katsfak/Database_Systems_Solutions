/*Task 2  
Create a tables EMP, DEPT and insert data (use the file on the link IDB) 
Write a PL / SQL code that would output information from the EMP table. Should be 
displayed: - information about the employee number; - information about the name of the employee; - information about the time that this employee worked in the enterprise. If the 
time is more and equal to 10 years, the text "More or equal to 10 years" should be 
displayed. Otherwise, the text "Less than 10 years" should be displayed. 
Use an explicit cursor for this code. 
*/
SET SERVEROUTPUT ON;
DECLARE
    CURSOR emp_cursor IS
        SELECT empno, ename, hiredate FROM EMP;
    
    v_empno EMP.empno%TYPE;
    v_ename EMP.ename%TYPE;
    v_hiredate EMP.hiredate%TYPE;
    v_years_worked NUMBER;
BEGIN
    -- Open the cursor
    OPEN emp_cursor;
    
    -- Loop through the cursor
    LOOP
        -- Fetch the data into variables
        FETCH emp_cursor INTO v_empno, v_ename, v_hiredate;
        
        -- Exit the loop if no more rows
        EXIT WHEN emp_cursor%NOTFOUND;
        
        -- Calculate the number of years worked
        v_years_worked := TRUNC(MONTHS_BETWEEN(SYSDATE, v_hiredate) / 12);
        
        -- Display employee information
        DBMS_OUTPUT.PUT_LINE('Employee Number: ' || v_empno);
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_ename);
        DBMS_OUTPUT.PUT_LINE('Years Worked: ' || v_years_worked);
        
        -- Check if the employee has worked for more than or equal to 10 years
        IF v_years_worked >= 10 THEN
            DBMS_OUTPUT.PUT_LINE('Status: More or equal to 10 years');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Status: Less than 10 years');
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;
    
    -- Close the cursor
    CLOSE emp_cursor;
END;
/