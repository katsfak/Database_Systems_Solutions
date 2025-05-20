/*Task 1 
Write an anonymous block that will print the current (system) date and time in the 
format of two digits of the day with a space name of the month (in lower case letters) 
space: four digits of the year, space for 24 hours in the 24-hour system two-digit two
digit colon. Make sure there is only one space between the name of the month and the 
year.*/
BEGIN
    DBMS_OUTPUT.PUT_LINE(
        TO_CHAR(SYSDATE, 'DD fmMonth YYYY HH24:MI')
    );
END;
/
