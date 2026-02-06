# Retail Sales Intelligence & Forecasting Project (SQL + Python + Power BI)

## 📌 Project Overview
This project is an end-to-end Retail Analytics solution that analyzes sales performance, customer demand, product trends, and regional revenue using a real-world retail dataset.  
It also includes **AI-based time-series forecasting** to predict future monthly revenue and support business demonstrate data-driven decision making.

The final output is an **interactive Power BI dashboard** with historical + forecast insights.

---

## 🎯 Business Objectives
- Understand total sales, order volume, and customer distribution
- Analyze monthly and yearly revenue trends
- Identify top-performing products and product lines
- Analyze revenue contribution by country and territory
- Track deal size performance and order status trends
- Forecast future monthly revenue using AI (Prophet)
- Compare **Actual vs Forecast** and calculate forecast accuracy

---

## 📁 Datasets Used

This project uses **three datasets**:

### 1️⃣ Retail Sales Dataset (Raw)
- Used for detailed sales analysis (orders, customers, products, regions)
- File: `retail_sales.csv`
- Location: `data/`

---

### 2️⃣ Monthly Sales Dataset (Actual)
- Created from the raw dataset by aggregating monthly revenue
- Used for trend analysis and forecasting input
- File: `monthly_sales.csv`
- Location: `notebooks/`

---

### 3️⃣ Forecast Sales Dataset (AI Output)
- Generated using Python Prophet model
- Contains predicted revenue (`yhat`) with confidence intervals
- File: `forecast_sales.csv`
- Location: `notebooks/`

---

## 🛠 Tools & Technologies
- **SQL (SQLite)** – data storage, cleaning, KPI queries  
- **Python (Pandas, NumPy, Prophet, Matplotlib)** – preprocessing + forecasting  
- **Power BI** – dashboard, KPIs, visuals, business storytelling  
- **Jupyter Notebook** – full reproducible workflow  

---

## 📊 Project Phases

### Phase 1: Data Storage + SQL Analysis
- Loaded raw dataset into SQLite
- Performed KPI and business analysis queries:
  - Total Sales, Orders, Customers
  - Monthly & yearly revenue trend
  - Top products & product lines
  - Country and territory revenue
  - Deal size and order status analysis

---

### Phase 2: Python Forecasting (AI)
- Loaded `retail_sales.csv`
- Cleaned and converted date column
- Created monthly aggregated dataset
- Trained Prophet model for forecasting
- Generated:
  - Forecasted revenue
  - Upper & lower confidence bounds
  - Forecast accuracy

Outputs saved:
- `monthly_sales.csv`
- `forecast_sales.csv`

---

### Phase 3: Power BI Dashboard
Created a complete multi-page dashboard:

#### 📄 Page 1: Executive Overview
- KPI Cards:
  - Total Sales
  - Total Orders
  - Total Customers
  - Forecast Accuracy %
- Actual vs Forecast line chart
- Top product lines bar chart
- Country sales map

#### 📄 Page 2: Product & Region Insights
- Top 10 product codes by sales
- Sales by deal size
- Sales by territory
- Order status distribution

#### 📄 Page 3: Forecast & Alerts
- Forecast trend chart
- Forecast gap chart (Actual vs Forecast difference)
- Risk table:
  - Month
  - Forecast Revenue
  - Risk Flag (High Demand / Normal)

---

## 📈 Key Insights
- Revenue shows strong seasonal patterns across months
- Certain product lines contribute the majority of sales
- A few territories dominate overall revenue
- Medium and large deal sizes generate the highest revenue share
- Forecasting helps identify peak-demand months for inventory planning
- Forecast accuracy provides a clear reliability measure for prediction

---

## ▶️ How to Run the Project

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/aprajitad/Retail-Sales-Intelligence-Forecasting.git

2️⃣ Install Required Libraries
pip install -r requirements.txt

3️⃣ Run SQL Phase (Optional if already done)

Load the dataset into SQLite

Run SQL queries inside:

sql/retail_sales_full_pipeline.md

4️⃣ Run Python Notebook (Forecasting)

Open:

notebooks/sales_forecasting_prophet.ipynb

This will generate:

monthly_sales.csv

forecast_sales.csv

5️⃣ Open Power BI Dashboard

Open:

power bi/AI Sales Forecasting PowerBI Dashboard.pbix


📂 Repository Structure

Retail-Sales-Intelligence-Forecasting/
│
├── data/
│ └── retail_sales.csv
│
├── notebooks/
│ ├── sales_forecasting_prophet.ipynb
│ ├── monthly_sales.csv
│ └── forecast_sales.csv
│
├── sql/
│ └── retail_sales_full_pipeline.md
│
├── power bi/
│ └── AI Sales Forecasting PowerBI Dashboard.pbix
│
├── requirements.txt
└── README.md

👤 Author

Aprajita Dixit
Aspiring Data Analyst | SQL | Python | Power BI | AI Forecasting


---
