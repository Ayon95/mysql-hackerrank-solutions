-- The Report
-- generate a table containing student's name, grade, and marks
-- if grade is less than 8 then name should be NULL
-- students table has ID, name, and marks
-- grades table has grade, min_mark, and max_mark
-- the join condition for the two tables is marks for a student has to be within a min_mark and a max_mark 
SELECT
    IF(grades.grade < 8, NULL, students.name),
    grades.grade,
    students.marks
FROM students
JOIN grades
ON students.marks BETWEEN grades.min_mark AND grades.max_mark
ORDER BY grades.grade DESC, students.name, students.marks;