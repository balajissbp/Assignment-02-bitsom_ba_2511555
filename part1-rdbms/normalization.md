## Anomaly Analysis
- Insert Anomaly: 
    -
  - **Description:** Cannot add a new customer or
    product without creating a dummy order, because order_id, product_id are the primary key.

    **Example:** Trying to add a new customer (e.g., Balaji S) who hasn't placed an order yet. You cannot add his address to the table because all rows require an order_id and product_id
- Update Anomaly:
    -
    - **Description**: Changing a single piece of information requires updating multiple rows, leading to inconsistency if only some are updated.

        **Example:** If customer "Balaji S" (found in row 2 and 15) changes his address, it must be updated in both rows.
- Delete Anomaly:
    -
    -   **Description:** Deleting a record removes necessary information unintentionally.

        **Example:** Deleting the only order placed by a specific customer ("Balaji S" in row 2) accidentally deletes her personal contact information from the database.

## Normaliztion Justification

    - The manager’s argument that keeping everything in one table is simpler is only valid for very small and static datasets. While a single table may be easy to manage initially, it creates several serious problems as the data grows.

    In a combined table containing customer, product, and order details, the same information is repeated multiple times. This leads to data redundancy and causes different types of anomalies:

    Update Anomaly:
    If a customer’s details (such as phone number) need to be updated, the change must be made in multiple rows. If one row is missed, it leads to inconsistent data.
    Insertion Anomaly:
    New product information cannot be added unless there is a related order. This restricts the ability to store independent data.
    Deletion Anomaly:
    Deleting an order may also remove important customer or product information. For example, deleting a customer’s only order could result in losing their entire purchase history.

    As mentioned, changing product or customer data in a single table affects multiple records, and deleting orders may unintentionally remove valuable customer behavior data.

    To avoid these issues, normalization is used. It separates data into multiple related tables (such as Customers, Products, and Orders), ensuring:

    No data duplication
    Easier updates
    Better data integrity
    Scalability for larger datasets

## Conclusion

    Although a single table may seem simpler for small datasets, normalization is necessary to maintain accuracy, consistency, and reliability in any practical database system.



