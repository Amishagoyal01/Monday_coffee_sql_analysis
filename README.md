# ☕ Monday Coffee SQL Analysis Project 📊

## 📖 Project Overview
This project is an end-to-end SQL analysis of a fictional coffee chain **Monday Coffee** ☕ operating across multiple cities 🌆.  
The objective is to analyze **sales performance, customer behavior, product performance, and city-level profitability** using SQL.

The project progresses from **basic SQL queries to advanced analytics**, reflecting real-world business reporting and data analysis use cases 💼📈.

---

## 🗄️ Database & Data Description

The database consists of **4 core tables** with transactional and master data:

- 🏙 **city** → city details, population, estimated rent, and city rank  
- 👥 **customers** → customer information and city mapping  
- 🛒 **products** → product catalog and pricing  
- 💰 **sales** → transaction-level sales data including revenue and ratings  

### 📁 CSV Files Used
- `city.csv`
- `customers.csv`
- `products.csv`
- `sales.csv`

---

## 🛠 Tools & Technologies
- 🧠 SQL (MySQL)
- 🖥 MySQL Workbench
- 🌐 GitHub
- 📄 CSV datasets

---

## 📂 Project Structure

- 🧱 **Schemas.sql** → Database & table creation  
- 🔍 **Basicselectqueries.sql** → Initial data validation (`SELECT *`)  
- 📊 **BasicQueries.sql (Level 1)** → Basic aggregations & KPIs  
- 🔗 **Joins.sql (Level 2)** → Multi-table join analysis  
- 💼 **BusinessAnalysisQueries.sql (Level 3)** → Business-focused insights  
- 🧩 **SubQuerybasedAnalytics.sql (Level 4)** → Subquery-driven analysis  
- 🚀 **AdvancedSql (Window Functions + CTE)** → Advanced SQL analytics  

---

## 🔍 SQL Concepts Demonstrated

### 🟢 Level 1 – Basic Queries
- COUNT, SUM, AVG, MIN, MAX  
- Total revenue & total transactions  
- Average order value (AOV)  
- Customer & product counts  
- Rating analysis ⭐  

---

### 🔵 Level 2 – Join-Based Analysis
- Revenue by product & city  
- Customer distribution across cities  
- Product performance by location  
- City-wise AOV and ratings  

---

### 🟠 Level 3 – Business Analysis
- Top revenue-generating cities 🏆  
- High-rent but low-revenue cities ⚠️  
- High-value customers 💎  
- Revenue vs rent profitability  
- City contribution to total revenue  

---

### 🟣 Level 4 – Subquery-Based Analytics
- Above/below average revenue products  
- High-spending customers  
- Cities performing above average  
- Products without highest ratings  

---

### 🔴 Level 5 – Advanced SQL (Window Functions & CTE)
- Ranking cities by revenue 🥇  
- Top-selling product per city  
- Top spending customers  
- Profit/Loss city classification using CTE  

---

## 📊 Key Business Insights Generated
- 📍 Identification of **top-performing cities and products**  
- 📉 Detection of **loss-making cities based on rent vs revenue**  
- 👑 Recognition of **high-value customers**  
- ⭐ Analysis of **product performance using customer ratings**  
- 🔄 Comparison between **city rankings and actual revenue**  

---

## ▶️ How to Run This Project (Complete Steps)

### 🔹 Step 1: Open MySQL
- Open **MySQL Workbench**
- Connect to your MySQL server

---

### 🔹 Step 2: Create Database
Run the following command:
```sql
CREATE DATABASE monday_coffee;
USE monday_coffee;
