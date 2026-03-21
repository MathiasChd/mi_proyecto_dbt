-- OBT final para analisis de Pokemon
WITH pokemon AS (
    SELECT * FROM {{ ref('int_pokemon_enriched') }}
),
final AS (
    SELECT
        pokemon_id,
        pokemon_name,
        height,
        weight,
        base_experience,
        type_primary,
        type_secondary,
        bmi_ratio,
        CASE
            WHEN base_experience >= 200 THEN 'Legendary'
            WHEN base_experience >= 100 THEN 'Strong'
            ELSE 'Normal'
        END AS power_tier
    FROM pokemon
)
SELECT * FROM final