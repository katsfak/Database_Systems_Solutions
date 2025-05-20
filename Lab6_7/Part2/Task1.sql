/*Task 1 
In the anonymous block, declare variables with_im (character string, maximum 15 
characters), with_name (string, max. 20 characters) and z_value (number). Initialize 
them in the declaration section values ANNA, SMITH, 1890.54. Make the block write 
the text: "Person: name, surname, salary value ", inserting in place of bolded names 
the values of the respective variables, where the data has be written so that the first 
letters of the first and last names are great, and the remaining ones – small, and the 
salary rounded to full of dollars. 
Person: Anna Smith, salary: 1891
*/
SET SERVEROUTPUT ON
DECLARE
    with_im VARCHAR2(15) := 'ANNA';
    with_name VARCHAR2(20) := 'SMITH';
    z_value NUMBER := 1890.54;
    formatted_name VARCHAR2(35);
    formatted_salary NUMBER;
BEGIN
    -- Format the name with proper capitalization
    formatted_name := INITCAP(with_im) || ' ' || INITCAP(with_name);
    
    -- Round the salary to the nearest whole number
    formatted_salary := ROUND(z_value);
    
    -- Output the formatted message
    DBMS_OUTPUT.PUT_LINE('Person: ' || formatted_name || ', salary: ' || formatted_salary);
END;