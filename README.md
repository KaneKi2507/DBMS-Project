# E-Commerce Retail Database System 🛒

A highly normalized, robust relational database designed to manage the backend operations of an online retail platform. This project was built from scratch to demonstrate advanced Database Management System (DBMS) concepts, including strict adherence to Third Normal Form (3NF) and the implementation of PL/SQL programming constructs.

## 🗂️ Repository Structure

This repository follows an industry-standard directory layout, separating schema definitions, raw data, and programmatic queries.

* **`/Schema`**: Contains `create_tables.sql`, the Data Definition Language (DDL) script that establishes the 10-table 3NF architecture with all Primary and Foreign Key constraints.
* **`/Data`**: Contains `insert_data.sql`, the Data Manipulation Language (DML) script used to populate the database with realistic dummy records across all entities.
* **`/SQL`**: Contains the core business logic and advanced database programming:
  * `01_standard_queries.sql`: Multi-table `JOIN` operations, subqueries, and `GROUP BY` aggregations.
  * `02_triggers.sql`: Automated inventory management triggers.
  * `03_cursors.sql`: Explicit PL/SQL cursors wrapped in stored procedures for iterative row updates.

## 🏗️ Database Architecture (3NF)

The schema is divided into distinct Core Entities (Nouns) and Associative Entities (Verbs) to eliminate data redundancy and ensure transactional integrity.

**Core Entities:**
* `Categories`
* `Products`
* `Customers`
* `Suppliers`
* `Shippers`

**Associative Entities (Transaction & Bridging Tables):**
* `Orders` (Links Customers to their purchases)
* `Order_Items` (Resolves the Many-to-Many relationship between Orders and Products)
* `Inventory_Restock` (Links Suppliers to Products)
* `Shipments` (Links Orders to Shippers)
* `Reviews` (Links Customers to Products)

## 🚀 Key Academic Features Implemented

1. **Automated Triggers:** An `AFTER INSERT` trigger on the `Order_Items` table automatically deducts the purchased quantity from the master `Products` inventory, ensuring stock levels are always accurate without manual updates.
2. **Explicit Cursors:** A Stored Procedure utilizing a `CURSOR` loops through the inventory, identifying items with low stock (< 50 units) and automatically adjusting their prices to reflect high demand.
3. **Complex Aggregations:** Standardized queries to track total revenue per category and identify maximum price points using nested subqueries.

## ⚙️ Setup Instructions

To run this environment locally:
1. Open MySQL Workbench and execute `CREATE DATABASE retail_db; USE retail_db;`
2. Execute `Schema/create_tables.sql` to build the structure.
3. Execute `Data/insert_data.sql` to populate the tables.
4. Test the business logic by running the scripts in the `/SQL` directory.