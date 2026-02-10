SELECT 
            --- id
            CAST(vendorid AS int) as vendor_id,
            ratecodeid as rate_code_id,
            pulocationid as pickup_location_id,
            dolocationid as dropoff_location_id,
            --- timestamps
            lpep_pickup_datetime as pickup_datetime,
            lpep_dropoff_datetime as dropoff_datetime,
            ---trip info
            store_and_fwd_flag as store_and_fwd_flag,
            passenger_count as passenger_count,
            trip_distance as trip_distance,
            trip_type as trip_type,
            --- payment info
            fare_amount as fare_amount,
            extra as extra,
            mta_tax as mta_tax,
            tip_amount as tip_amount,
            tolls_amount as tolls_amount,
            improvement_surcharge as improvement_surcharge,
            total_amount as total_amount,
            payment_type as payment_type

FROM {{ source('raw_data', 'green_tripdata') }}