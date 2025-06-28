# 🛒 Zepto Inventory Analysis Project

This project involves analyzing an inventory dataset from Zepto using **SQL**. The analysis focuses on data exploration, cleaning, and generating insights by answering practical business-related questions. The objective is to understand product distribution, pricing efficiency, inventory status, and potential revenue opportunities.

---

## 📌 Objective

- Perform **data exploration** to understand the structure and contents of the inventory data.
- **Clean the data** for inconsistencies such as zero pricing or incorrect units.
- Answer a series of **business questions** to extract actionable insights.
- Use SQL queries to identify patterns and anomalies in the inventory.

---

## 🗂 Project Workflow

### 1. Database Creation and Setup
- A MySQL database `zepto_analysis` is created.
- Data from a CSV file is imported into a table named `zepto`.

### 2. Data Exploration
- Checked row count and sampled data.
- Identified null values and cleaned them.
- Analyzed product categories, stock status, and duplicate entries (SKUs).
- Explored overall structure and unique values in the dataset.

### 3. Data Cleaning
- Removed products with zero MRP or selling price.
- Converted pricing units from paise to rupees.
- Standardized columns for easier analysis.

### 4. Business Questions Answered

- **Top 10 Best-Value Products**: Based on the highest discount percentages.
- **High MRP but Out of Stock**: Identified products priced above ₹300 that are unavailable.
- **Estimated Revenue by Category**: Calculated revenue by multiplying quantity with selling price.
- **Low Discount on High-Priced Products**: Filtered premium products with minimal discounts.
- **Top Discounting Categories**: Found categories offering the highest average discounts.
- **Best Value by Weight**: Analyzed price per gram for heavier items.
- **Weight-Based Product Categorization**: Classified products into Low, Medium, and Bulk based on weight.
- **Total Inventory Weight per Category**: Summarized inventory weight in kilograms by category.

---

## 🛠 Tools Used

- **MySQL** for query execution and data analysis.
- **CSV** as the raw data source.

---

## 📊 Key Insights

- Certain product categories contribute significantly to potential revenue.
- Many high-MRP products are frequently out of stock.
- There are opportunities to optimize pricing strategies based on discount distribution.
- Inventory is unevenly distributed across categories, weights, and stock status.

---

## ✅ Conclusion

This SQL-based analysis provides a foundational understanding of Zepto’s inventory structure and performance. The insights can help in inventory planning, pricing strategies, and operational optimization. This project serves as a solid starting point for further exploration using BI tools or integration with real-time dashboards.

---
