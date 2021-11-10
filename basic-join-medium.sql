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

-- Top Competitors
-- query the id and name of hackers who got full scores in more than one challenge
-- order the result set by the number of challenges completed where the hacker received full score
-- if multiple hackers completed the same number of challenges, then sort them by their id
/**
- Join hackers and submissions table because we need to know which challenges a hacker completed and the scores he/she got
- Join the intermediate table with challenges table because we need to know the difficulty level of the completed challenges
- Join the intermediate table with difficulty table because we need to know the max possible score for the completed challenges
- only keep the rows where received score is equal to the max possible score
    - this will give us the records where hackers received a full score
- group the result set by hacker id so that we can get a count of how many challenges each hacker completed
- only keep the groups containing more than one submission
*/
SELECT
    hackers.hacker_id,
    hackers.name
FROM hackers
JOIN submissions
ON hackers.hacker_id = submissions.hacker_id
JOIN challenges
ON submissions.challenge_id = challenges.challenge_id
JOIN difficulty
ON challenges.difficulty_level = difficulty.difficulty_level
WHERE submissions.score = difficulty.score
GROUP BY submissions.hacker_id, hackers.name
HAVING COUNT(submissions.submission_id) > 1
ORDER BY
    COUNT(submissions.submission_id) DESC,
    submissions.hacker_id;

-- Ollivander's Inventory
-- output a table containing id, age, coins_needed, and power of the cheapest wand for each combination of age and power
-- only consider the non-evil wands (is_evil = 0)
-- note that there can be multiple wands with different prices for a power-age combination
-- we only want the ones with the lowest price for each power-age combination
SELECT
    wands.id,
    wands_property.age,
    wands.coins_needed,
    wands.power
FROM wands
JOIN wands_property
ON wands.code = wands_property.code
WHERE
    wands_property.is_evil = 0
    AND wands.coins_needed = (
        SELECT MIN(w.coins_needed)
        FROM wands w
        JOIN wands_property wp
        ON w.code = wp.code
        WHERE
            w.power = wands.power
            AND wp.age = wands_property.age
    )
ORDER BY wands.power DESC, wands_property.age DESC;