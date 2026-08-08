# 📈 Retail Sales Intelligence & Forecasting System (SQL + Python + Power BI)

![Python](https://img.shields.io/badge/-Python-3776AB?style=flat&logo=python&logoColor=white)
![Prophet](https://img.shields.io/badge/-Prophet-000000?style=flat)
![SQL](https://img.shields.io/badge/-SQL-4479A1?style=flat&logo=sqlite&logoColor=white)
![Power BI](https://img.shields.io/badge/-Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)

## 📌 Project Overview

An end-to-end retail analytics solution analyzing sales performance, customer demand, product trends, and regional revenue on a real-world retail transactions dataset (2,823 orders, 2003–2005). Includes **AI-based time-series forecasting** (Prophet) to predict future monthly revenue, brought together in an **interactive 3-page Power BI dashboard**.

---

## 🎯 Business Objectives

- Understand total sales, order volume, and customer distribution
- Analyze monthly and yearly revenue trends
- Identify top-performing products and product lines
- Analyze revenue contribution by country and territory
- Track deal size performance and order status trends
- Forecast future monthly revenue using AI (Prophet)
- Compare Actual vs Forecast and calculate forecast accuracy

---

## 📁 Datasets Used

### 1️⃣ Retail Sales Dataset (Raw)
- 2,823 orders across 92 customers, 2003–2005
- **Large file — not uploaded to GitHub due to size limits**
- Source: [Kaggle — Sample Sales Data](https://www.kaggle.com/datasets/kyanyoga/sample-sales-data)

> Download from Kaggle and place it at `data/retail_sales.csv` to run the full pipeline.

### 2️⃣ Monthly Sales Dataset (Actual)
Aggregated monthly revenue, generated from the raw dataset — `data/monthly_sales.csv`

### 3️⃣ Forecast Sales Dataset (AI Output)
Prophet-generated predicted revenue (`yhat`) with confidence intervals — `data/forecast_sales.csv`

---

## 🛠 Tools & Technologies

| Category | Tools |
|---|---|
| Data Storage & Cleaning | SQL (SQLite) |
| Forecasting | Python (Pandas, NumPy, Prophet) |
| Visualization | Matplotlib, Power BI |
| Notebook Environment | Jupyter Notebook |

---

## 📊 Project Phases

### Phase 1: SQL Analysis
Loaded raw data into SQLite, cleaned nulls/duplicates, standardized date formats, and ran KPI queries — monthly revenue, 3-month moving average, revenue by product line/territory/deal size. Full pipeline in `sql/retail_sales_full_pipeline.sql`.

### Phase 2: Python Forecasting
Cleaned and aggregated `retail_sales.csv` into monthly revenue, trained a Prophet model, and generated forecasted revenue with confidence intervals. Notebook: `notebooks/sales_forecasting_prophet.ipynb`.

### Phase 3: Power BI Dashboard
A 3-page interactive dashboard:

**Page 1 — Executive Overview:** KPI cards (Total Sales, Orders, Customers, Forecast Accuracy %), Actual vs Forecast line chart, top product lines, country sales map

**Page 2 — Product & Region Insights:** top product codes by sales, sales by deal size, sales by territory, order status distribution

**Page 3 — Forecast & Alerts:** forecast trend chart, forecast gap chart (Actual vs Forecast), risk table flagging high-demand months

📂 **File:** `power_bi/Retail_Sales_Forecasting_Dashboard.pbix`

---

## 🔍 Key Insights

- **Total revenue: $10.03M** across 2,823 orders and 92 customers (2003–2005)
- **Classic Cars is the top product line**, driving **39.1%** of total revenue ($3.92M)
- **EMEA is the dominant territory**, accounting for **49.6%** of revenue — more than APAC and Japan combined
- **Medium-sized deals drive 60.7% of revenue** ($6.09M), far outweighing small (26.3%) and large (13.0%) deals
- **November is a massive, recurring outlier**: average November revenue is **$1.06M**, roughly **3.6x** the average of every other month (~$293K) — a clear, consistent seasonal spike worth planning inventory around
- **USA is the top country** by revenue ($3.63M), followed by Spain ($1.22M) and France ($1.11M)
- **92.3%** of orders were successfully shipped; only **2.1%** were cancelled

---

## 🤖 Forecast Performance

The Prophet model was evaluated against actual monthly revenue across the full historical period:

| Metric | Value |
|---|---|
| Mean Absolute Percentage Error (MAPE) | 9.03% |
| **Forecast Accuracy** | **90.97%** |

**Read:** a ~91% forecast accuracy is strong for monthly revenue forecasting on a dataset this size, though it's worth noting the model is tested on the same period it was trained on rather than a held-out future period — a more rigorous evaluation would forecast forward on unseen months.

---

## ▶️ How to Run the Project

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/aprajitad/Retail-Sales-Intelligence-Forecasting-System.git
cd Retail-Sales-Intelligence-Forecasting-System
```

### 2️⃣ Install Required Libraries
```bash
pip install -r requirements.txt
```

### 3️⃣ Add the Raw Dataset
Download from Kaggle and place it at `data/retail_sales.csv`.

### 4️⃣ Run the SQL Pipeline
Load `sql/retail_sales_full_pipeline.sql` into SQLite (or any SQL client) to reproduce the cleaning and KPI queries.

### 5️⃣ Run the Forecasting Notebook
Open `notebooks/sales_forecasting_prophet.ipynb` — generates `data/monthly_sales.csv` and `data/forecast_sales.csv`.

### 6️⃣ Open the Power BI Dashboard
Open `power_bi/Retail_Sales_Forecasting_Dashboard.pbix` in Power BI Desktop.

---

## 📂 Repository Structure

```
Retail-Sales-Intelligence-Forecasting-System/
│
├── data/
│   ├── retail_sales.csv       (download from Kaggle)
│   ├── monthly_sales.csv
│   └── forecast_sales.csv
│
├── notebooks/
│   └── sales_forecasting_prophet.ipynb
│
├── sql/
│   └── retail_sales_full_pipeline.sql
│
├── power_bi/
│   └── Retail_Sales_Forecasting_Dashboard.pbix
│
├── requirements.txt
└── README.md
```

---

## 👤 Author

**Aprajita Dixit**
Data & Business Analyst | SQL | Python | Power BI | AI Forecasting

- **LinkedIn:** [linkedin.com/in/dixitaprajita](https://www.linkedin.com/in/dixitaprajita/)
- **GitHub:** [@aprajitad](https://github.com/aprajitad)
