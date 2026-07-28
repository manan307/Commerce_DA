# Commerce_DA

### SQL Analysis of the Olist Brazilian E-Commerce Dataset using PostgreSQL

Commerce_DA is a SQL portfolio project that analyzes the Olist Brazilian E-Commerce dataset using PostgreSQL. The project focuses on solving real-world business problems through SQL by exploring customer behavior, sales performance, seller performance, product demand, and payment trends.

---

## Dataset

This project uses a subset of the **Olist Brazilian E-Commerce Dataset**.

**Source:**  
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

### Tables Used

- Customers
- Orders
- Order Items
- Products
- Sellers
- Payments

---

## Database Schema

The database consists of six related tables connected using primary and foreign keys.

![ER Diagram](ER_Diagram/ER_diagram.png)

---

## Business Questions Solved

This project answers questions such as:

- Which product categories generate the highest revenue?
- Which sellers contribute the highest sales?
- Which customer states place the most orders?
- Which payment methods are used most frequently?
- Which customers are repeat buyers?
- What is the average delivery time for completed orders?
- How do monthly order volumes change over time?
- Which product categories rank highest by demand?

---

## SQL Skills Demonstrated

- Data Validation
- Data Aggregation
- Multi-table JOINs
- GROUP BY & HAVING
- CASE Statements
- Window Functions (RANK)
- Date Functions
- SQL Views
- Business-Oriented Analysis

---

## Project Structure

```
Commerce_DA
│
├── SQL
│   ├── 01_data_check.sql
│   ├── 02_analysis.sql
│   ├── 03_business_queries.sql
│   └── 04_views.sql
│
├── ER_Diagram
│   └── ER_diagram.png
│
├── .gitignore
└── README.md
```

---

## Tools Used

- PostgreSQL
- pgAdmin 4
- SQL

---

## Key Highlights

- Designed a relational database with six interconnected tables.
- Performed data validation and exploratory analysis.
- Built business-focused SQL queries to extract meaningful insights.
- Used SQL Views for reusable analysis.
- Applied JOINs, Window Functions, CASE statements, and Aggregate Functions to solve analytical problems.

---

## Future Improvements

- Develop an interactive Power BI dashboard.
- Expand the analysis using additional Olist dataset tables.
- Build KPI dashboards for business reporting.
- Perform customer segmentation and sales trend analysis.

---

## Author

**Manan Poddar**

GitHub: https://github.com/manan307
