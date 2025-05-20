/*Task 3 
In the anonymous block, declare three non-empty numeric variables, initialize them 
with the selected values and display a message about the value of their sum. Write a 
block in two ways: once by entering the sum result into a variable, a once adding the 
numbers "on the fly" (inside the put_line statement, remembering the parentheses and, 
for elegance, about the function the converter).*/
SET SERVEROUTPUT ON
DECLARE
    num1 NUMBER := 10;
    num2 NUMBER := 20;
    num3 NUMBER := 30;
    sum_result NUMBER;
BEGIN
    -- Calculate the sum and store it in a variable
    sum_result := num1 + num2 + num3;
    DBMS_OUTPUT.PUT_LINE('The sum of the numbers is: ' || TO_CHAR(sum_result));
    
    -- Calculate the sum "on the fly" and display it directly
    DBMS_OUTPUT.PUT_LINE('The sum of the numbers is: ' || TO_CHAR(num1 + num2 + num3));
END;