SELECT 
    --- id
    CAST(vendorid AS integer) as vendor_id,
    CAST(ratecodeid AS integer) as rate_code_id,
    CAST(pulocationid AS integer) as pickup_location_id,
    CAST(dolocationid AS integer) as dropoff_location_id,
    --- timestamps
    CAST(lpep_pickup_datetime AS timestamp) as pickup_datetime,
    CAST(lpep_dropoff_datetime AS timestamp) as dropoff_datetime,
    ---trip info
    store_and_fwd_flag as store_and_fwd_flag,
    CAST(passenger_count AS integer) as passenger_count,
    CAST(trip_distance AS numeric) as trip_distance, 
    CAST(trip_type AS integer) as trip_type,
    --- payment info
    CAST(fare_amount AS numeric) as fare_amount,
    CAST(extra AS numeric) as extra,
    CAST(mta_tax AS numeric) as mta_tax,
    CAST(tip_amount AS numeric) as tip_amount,
    CAST(tolls_amount AS numeric) as tolls_amount,
    CAST(ehail_fee AS numeric) as ehail_fee,
    CAST(improvement_surcharge AS numeric) as improvement_surcharge,
    CAST(total_amount AS numeric) as total_amount,
    CAST(payment_type AS integer) as payment_type

FROM {{ source('raw_data', 'green_tripdata') }}
WHERE vendorid IS NOT NULL
