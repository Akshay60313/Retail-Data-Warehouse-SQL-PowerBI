# 📦 Retail Sales Data Warehouse & Diagnostics Pipeline (51k+ Records)

![Power BI](https://img.shields.io/badge/Data_Viz-Power_BI-yellow) ![SQL](https://img.shields.io/badge/Database-MySQL-blue) ![Excel](https://img.shields.io/badge/Modeling-Excel_ETL-green) ![Status](https://img.shields.io/badge/Status-Project_Complete-success)

🎯 Project Overview
This project showcases an institutional-grade, full-stack data engineering and analytics pipeline. I transformed 51,000+ raw transactional records from Excel into a high-performance MySQL Star Schema Data Warehouse. The project concludes with a multi-page Power BI suite that identifies systemic profit leakages and supply chain bottlenecks through diagnostic modeling.

🖥️ Interactive Dashboard Demo

![Retail_Sales_Walkthrough](https://github.com/user-attachments/assets/f8af7878-7b68-49c9-b606-8798266399b6)


## 💡 Key Numerical & Mathematical Findings
The business is experiencing rapid scaling (+27% YoY), but faces **"Margin Dilution"** from specific loss-leader categories and a localized fulfillment crisis in Southern Africa.

| Metric | Calculation / Value | Strategic Insight |
| :--- | :--- | :--- |
| **Total Sales (CY)** | **$3.43 Million** | Robust top-line performance. |
| **YoY Sales Growth** | **+27.00%** | CY $3.43M vs. PY $2.70M (+$0.73M Delta). |
| **Return Rate %** | **11.74%** | Peak return rate identified in **Southern Africa**. |
| **Top Regional Manager** | **Gilbert Wolff** | Highest revenue contributor at **$17.4k**. |
| **High-Risk Category** | **Furniture (Tables)** | Identified as a loss-leader with **-10% net margins**. |

---

## 🛠️ Data Architecture & Pipeline

### **1. Data Engineering (MySQL)**
To maintain sub-second visual responsiveness over **51,000+ rows**, the complex join logic was offloaded to the database layer:
* **Bulk Ingestion:** Utilized optimized `LOAD DATA INFILE` logic to process the transactional volume from the `Data_Source` folder.
* **Star Schema Transformation:** Engineered a centralized `fact_sales` table and `dm_managers` dimension. 
* **Logic Layer:** Built a binary flagging system for returns at the SQL source, significantly reducing the DAX compute requirements in Power BI.

### **2. Diagnostic Analytics (Power BI)**

**📊 Executive Summary**

<img width="1347" height="722" alt="RETAIL SALES_Executive" src="https://github.com/user-attachments/assets/1bb3f739-53e5-4499-b2e0-48366904b30d" />

*Tracking core KPIs: $3.43M Total Sales and $2.70M Last Year (LY) Sales.*

**🔻 Profit Erosion & Waterfall Analysis**

<img width="1312" height="747" alt="RETAIL Sales_Profit Analysis" src="https://github.com/user-attachments/assets/abe83826-1044-40fd-a9db-92ccedb9a7f3" />


*Isolating categorical leakage: Technology remains the primary profit driver, while the Furniture segment creates significant margin drag.*

**📈 Regional Performance & Manager Benchmarking**

<img width="1350" height="753" alt="Retail Sales_Regional Performance" src="https://github.com/user-attachments/assets/a85f2637-a3bb-4134-bbe1-8ac23c767fa5" />

*Utilizing Treemaps and Manager Rankings to identify performance variance across Western Europe and Central America.*

**🔍 Root Cause & Reverse Logistics**

<img width="1367" height="745" alt="Retail Sales_Root Cause" src="https://github.com/user-attachments/assets/b81f81c6-a970-417d-b7aa-178798aa1b42" />

* **Strategic Margin Analysis:** The Bubble Chart identifies the "High Volume Risk Zone." **Tables** generate high revenue but negative margins ($~10k loss), suggesting a pricing or shipping crisis.
* **Return Rate Leakage Path:** Utilizing a **Decomposition Tree** to trace the 11.74% return rate. The critical node found: **Southern Africa $\rightarrow$ Home Office $\rightarrow$ Technology (21.74% Return Rate).**

---

## 📂 Project Repository Structure
This repository is organized to follow standard Data Engineering project conventions:

| Component | Path | Description |
| :--- | :--- | :--- |
| **SQL Master Script** | [📁 Sql_Scripts](./Sql_Scripts) | Star Schema transformation and DDL logic. |
| **Power BI Source** | [📈 PowerBI_Dashboard](./PowerBI_Dashboard) | `Retail_Sales_Executive_Intelligence_v1.pbix` |
| **Raw Staging Data** | [📑 Data_Source](./Data_Source) | `Retail Superstore Data.xlsx` (51k+ rows). |

---

## 🧠 Strategic Conclusions & Learning
1.  **Architecture Over Tooling:** For transactional datasets >50k rows, building the Fact table in SQL is essential for performance. Offloading join logic ensured zero lag during regional drill-downs.
2.  **Category Rationalization:** The **Tables** sub-category requires an immediate audit. It is currently a high-volume liability with a negative 10% margin.
3.  **Supply Chain Node Failure:** The localized fulfillment crisis in **Southern Africa** (peaking at 21.74% returns for Technology) indicates a specific quality control or logistics partner failure that requires an immediate audit.

