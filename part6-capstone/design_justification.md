## Storage Systems

This architecture uses a combination of specialized storage systems to meet the hospital’s four goals efficiently. For predicting patient readmission risk, a data warehouse is used because it stores cleaned, structured historical treatment data optimized for analytical queries and machine learning. It enables fast aggregation and feature extraction required for model training.

For enabling doctors to query patient history in plain English, a vector database is essential. Medical documents such as discharge summaries and clinical notes are unstructured, so they are stored in a data lake first. These are then converted into embeddings and stored in the vector database, allowing semantic search instead of simple keyword matching. This enables accurate answers to natural language queries.

For generating monthly reports like bed occupancy and department-wise costs, the data warehouse is again used. It supports OLAP workloads, aggregations, and integration with BI tools such as dashboards, making it ideal for management reporting.

For real-time ICU vitals, a streaming system (Kafka/Kinesis) combined with a time-series or NoSQL database is used. This allows continuous ingestion and fast retrieval of high-frequency sensor data. It also supports real-time dashboards and alert systems for critical care monitoring.

Overall, the architecture follows a data lakehouse-style approach, combining flexibility (data lake), performance (warehouse), and AI capability (vector DB).

## OLTP vs OLAP Boundary

The OLTP system consists of the hospital’s operational databases (EHR/EMR systems), where real-time patient transactions such as admissions, prescriptions, and updates occur. These systems are optimized for high concurrency and low-latency writes.

The OLAP system begins once data is extracted from OLTP systems via ETL pipelines and moved into the data warehouse. At this stage, data is transformed, cleaned, and structured for analytical use. All reporting, machine learning, and historical analysis occur in the OLAP layer.

This separation ensures that heavy analytical queries do not impact critical hospital operations like patient care.

T## rade-offs

A key trade-off in this design is increased architectural complexity due to multiple storage systems (data lake, warehouse, vector DB, streaming systems). While each component serves a specific purpose, managing and integrating them can be challenging.

To mitigate this, a unified orchestration layer (e.g., Airflow) and a metadata/catalog system can be used to track data lineage and ensure consistency. Additionally, adopting a lakehouse approach (e.g., Delta Lake) can reduce duplication between the data lake and warehouse, simplifying the architecture while retaining performance and flexibility.

If you want, I can also draw the architecture diagram for you as an image file so you can directly submit it.