WITH trips_unioned AS (
    SELECT * FROM {{ref('int_trips_unioned')}}
)

SELECT
    GENERATE_UUID() AS trip_id,
    COUNT(*) AS duplicates
FROM trips_unioned
GROUP BY 1
HAVING COUNT(*) > 1