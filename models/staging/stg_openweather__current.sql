-- Staging: limpieza de datos de clima de Asuncion
WITH source AS (
    SELECT * FROM {{ source('raw', 'weather') }}
),
renamed AS (
    SELECT
        date                AS weather_date,
        city,
        latitude,
        longitude,
        temp_max,
        temp_min,
        temp_mean,
        precipitation_mm,
        windspeed_max,
        weathercode,
        CASE
            WHEN weathercode = 0 THEN 'Clear sky'
            WHEN weathercode <= 3 THEN 'Partly cloudy'
            WHEN weathercode <= 67 THEN 'Rain'
            WHEN weathercode <= 77 THEN 'Snow'
            WHEN weathercode <= 99 THEN 'Thunderstorm'
            ELSE 'Unknown'
        END AS weather_description
    FROM source
)
SELECT * FROM renamed