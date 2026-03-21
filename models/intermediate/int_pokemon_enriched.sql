-- Intermediate: enriquece pokemon con tipos extraidos del JSON
WITH pokemon AS (
    SELECT * FROM {{ ref('stg_pokemon') }}
),
enriched AS (
    SELECT
        pokemon_id,
        pokemon_name,
        height,
        weight,
        base_experience,
        types->0->'type'->>'name' AS type_primary,
        types->1->'type'->>'name' AS type_secondary,
        ROUND(weight * 1.0 / NULLIF(height, 0), 2) AS bmi_ratio
    FROM pokemon
)
SELECT * FROM enriched