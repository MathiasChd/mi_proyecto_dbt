# mi_proyecto_dbt

Proyecto dbt para la Maestría en Inteligencia Artificial - MIA 03  
Facultad Politécnica - Universidad Nacional de Asunción

## Stack
- **Fuente:** PokeAPI + Open-Meteo
- **Transformación:** dbt-duckdb 1.9.0
- **Almacenamiento:** MotherDuck (DuckDB cloud)

## Estructura
```
models/
├── staging/
│   ├── stg_pokemon.sql
│   └── stg_openweather__current.sql
├── intermediate/
│   └── int_pokemon_enriched.sql
└── marts/
    └── obt_pokemon_analysis.sql
```

## DAG

![DAG del proyecto](docs/dag.png)

## Comandos
```bash
dbt run        # Ejecutar modelos
dbt test       # Ejecutar tests
dbt build      # Run + test
dbt docs serve # Ver documentación
```