# Modern Data Stack E-Commerce Analytics (dbt + BigQuery + Looker Studio)

## Resumen del Proyecto
Este proyecto implementa una arquitectura moderna de datos (Modern Data Stack) para transformar datos crudos de transacciones e-commerce en un modelo dimensional listo para la toma de decisiones.

## Tecnologías Utilizadas
* **Data Warehouse:** Google BigQuery
* **Transformación y Modelado:** dbt Cloud
* **Control de Versiones:** GitHub
* **Business Intelligence:** Looker Studio

## Arquitectura y Modelo de Datos (Star Schema)
El pipeline transforma los datos desde la capa cruda hasta la capa de consumo usando un enfoque modular:

1. **Staging Layer (`stg_`)**:
   * `stg_orders`: Deduplicación mediante Window Functions (`ROW_NUMBER()`), filtrado de estados válidos y limpieza de montos.
   * `stg_customers`: Estandarización de formato de correos y nombres.
2. **Marts / Fact Layer (`fct_`)**:
   * `fct_orders`: Tabla de hechos principal unificada mediante `ref()` con métricas agregadas por orden y cliente.

## Dashboard Interactivo
Puedes explorar el tablero de control final aquí: https://datastudio.google.com/s/ppbmqmgyHEM

## Cómo Replicar este Proyecto
1. Clonar el repositorio: `git clone https://github.com/Sarai7887/ecommerce-analytics-dbt.git`
2. Configurar las credenciales de Service Account en Google BigQuery.
3. Ejecutar `dbt run` desde dbt Cloud o CLI para construir el modelo en el warehouse.
