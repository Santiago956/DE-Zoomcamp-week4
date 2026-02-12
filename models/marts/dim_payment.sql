WITH payment_type_lookup AS (
    SELECT * FROM {{ ref('payment_type_lookup') }}
)

SELECT 
    payment_type,
    description
FROM payment_type_lookup
