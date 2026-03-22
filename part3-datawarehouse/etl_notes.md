## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem: The raw dataset contained inconsistent date formats such as "01-01-2024", "2024/01/01", and text-based dates.
Resolution: Converted all dates into ISO format (YYYY-MM-DD) and created a structured date dimension (dim_date) with derived fields like month and year.

### Decision 2 — Handling NULL Values
Problem: Some records had NULL values in quantity or price fields, which would break revenue calculations.
Resolution: Removed incomplete records or replaced NULL values with default valid values after validation. Ensured all fact table entries contain valid numeric measures.

### Decision 3 — Fixing Category Inconsistency
Problem: Product categories appeared in inconsistent casing (e.g., "electronics", "ELECTRONICS", "Electronics").
Resolution: Standardized all category values to proper case (e.g., "Electronics", "Clothing", "Groceries") before loading into dim_product to ensure accurate aggregation.