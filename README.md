# 🛒 Zepto SQL Data Analysis Project

This project is a SQL-based data analytics project built using a real-world e-commerce inventory dataset from Zepto. The goal of this project is to perform data cleaning, exploratory data analysis, and business analysis using SQL to generate meaningful insights from raw inventory data.

The project helped me understand how analysts work with large business datasets and use SQL to solve real-world problems related to pricing, inventory, discounts, and stock availability.

---

## 📌 Project Overview

In this project, I worked with an e-commerce inventory dataset containing product details such as pricing, discounts, stock quantity, and product categories.

Using SQL, I performed:

- Data Cleaning
- Exploratory Data Analysis (EDA)
- Inventory Analysis
- Business Insight Generation

This project focuses on understanding business data and extracting useful insights through SQL queries.

---

## 📁 Dataset Overview

The dataset was sourced from Kaggle and contains inventory-related information from Zepto products.

Each row represents a unique product SKU and includes details such as:

- Product Name
- Category
- MRP
- Discount Percentage
- Selling Price
- Available Quantity
- Product Weight
- Stock Availability

The dataset also contains duplicate products with different package sizes and pricing variations, similar to real-world e-commerce platforms.

---

## 🛠️ Technologies Used

- SQL
- PostgreSQL
- pgAdmin
- CSV Dataset

---

## 🔧 Project Workflow

### 1️⃣ Database Creation
Created tables using appropriate SQL data types and constraints for storing inventory data.

### 2️⃣ Data Import
Imported the CSV dataset into PostgreSQL using pgAdmin.

### 3️⃣ Data Exploration
Performed exploratory analysis to:
- Understand dataset structure
- Identify unique product categories
- Check stock availability
- Detect duplicate products
- Analyze missing and inconsistent data

### 4️⃣ Data Cleaning
Cleaned the dataset by:
- Removing invalid records
- Handling zero-value pricing entries
- Converting pricing values from paise to rupees
- Improving overall data consistency

### 5️⃣ Business Analysis
Generated insights using SQL queries such as:
- Top discounted products
- High-value out-of-stock products
- Revenue estimation by category
- Categories with highest average discounts
- Value-for-money product analysis
- Inventory weight analysis

---

## 📊 Sample SQL Query

```sql
SELECT category,
       AVG(discountPercent) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC;
