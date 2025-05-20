/*Part 1  ARRAYS (VARRAY),  Cursors Task 1 
Write a program to create an array that contains the names of teachers and 
subjects they teach. Change the dimension of the array and supplement the data.*/
SET SERVEROUTPUT ON
DECLARE
    TYPE TeacherArray IS VARRAY(10) OF VARCHAR2(50);
    TYPE SubjectArray IS VARRAY(10) OF VARCHAR2(50);
    
    teachers TeacherArray := TeacherArray('John Doe', 'Jane Smith', 'Alice Johnson');
    subjects SubjectArray := SubjectArray('Mathematics', 'Physics', 'Chemistry');
BEGIN
    -- Display the original arrays
    DBMS_OUTPUT.PUT_LINE('Original Teachers:');
    FOR i IN 1 .. teachers.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(teachers(i));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Original Subjects:');
    FOR i IN 1 .. subjects.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(subjects(i));
    END LOOP;

    -- Change the dimension of the arrays
    teachers.EXTEND(2);
    subjects.EXTEND(2);

    -- Supplement the data
    teachers(4) := 'Bob Brown';
    teachers(5) := 'Charlie Green';
    
    subjects(4) := 'Biology';
    subjects(5) := 'History';

    -- Display the updated arrays
    DBMS_OUTPUT.PUT_LINE('Updated Teachers:');
    FOR i IN 1 .. teachers.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(teachers(i));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Updated Subjects:');
    FOR i IN 1 .. subjects.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(subjects(i));
    END LOOP;
END;
/
-- The above code defines two VARRAY types: `TeacherArray` and `SubjectArray`, each with a maximum size of 10.
-- It initializes these arrays with some teacher names and subjects, displays the original data,
-- extends the arrays to accommodate more data, supplements the arrays with new entries, and finally displays the updated data.
-- The output will show the original and updated lists of teachers and subjects.
-- This demonstrates how to create and manipulate VARRAYs in PL/SQL.
-- The output will be:
-- Original Teachers:
