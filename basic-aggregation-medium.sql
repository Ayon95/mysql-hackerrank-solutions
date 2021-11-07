-- query the Euclidean distance between points P1 and P2 and round your answer to 4 decimal places
-- P1(a, c) and P2(b, d) are two points where (a, b) are min and max northern latitudes respectively
-- (c, d) are min and max western longitudes respectively
-- Formula for Euclidean distance is sqrt((b - a)^2 + (d - c)^2)
SELECT
    ROUND(SQRT(
            POW(MAX(lat_n) - MIN(lat_n), 2)
            + POW(MAX(long_w) - MIN(long_w), 2)
        ), 4)
FROM station;