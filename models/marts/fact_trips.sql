WITH trips_unioned AS (
    SELECT * FROM {{ref('int_trips_unioned')}}
)

SELECT
    GENERATE_UUID() AS trip_id,
    trips.vendor_id,
    trips.rate_code_id,
    trips.pickup_location_id,
    trips.dropoff_location_id,
    trips.payment_type,
    trips.store_and_fwd_flag,
    trips.trip_type,
    trips.pickup_datetime,
    trips.dropoff_datetime,
    DATETIME_DIFF(trips.dropoff_datetime, trips.pickup_datetime, MINUTE) AS trip_time_minutes,
    trips.passenger_count,
    trips.trip_distance,
    trips.fare_amount,
    trips.extra,
    trips.mta_tax,
    trips.tip_amount,
    trips.tolls_amount,
    trips.ehail_fee,
    trips.improvement_surcharge,
    trips.total_amount

FROM trips_unioned AS trips
