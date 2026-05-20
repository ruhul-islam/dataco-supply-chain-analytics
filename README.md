# DataCo Supply Chain Analytics
### What is driving late deliveries across the global supply chain?

An end-to-end supply chain analytics project analyzing 180,519 global orders across 5 markets, 4 shipping modes, and 3 customer segments to identify the root causes of late deliveries and provide actionable recommendations for operations leadership.

---

## Key Findings

| Finding | Detail |
|---|---|
| Overall late delivery rate | 57.28% of all orders arrive late |
| Worst shipping mode | First Class — 100% late delivery rate across all markets |
| Second worst | Second Class — 79.73% late delivery rate |
| Best performing mode | Standard Class — 39.77% late (carries 60% of all volume) |
| Geographic spread | All 5 markets between 56.81% and 57.69% — systemic not regional |
| Time trend | Flat at 55–59% for 3 years — no improvement over time |
| Most affected category | Golf Bags and Carts — 68.85% late delivery rate |

---

## The Counterintuitive Finding

Standard Class, the cheapest shipping mode, outperforms every premium tier. First Class has a 100% late delivery rate with exactly 1 day delay on every single order — suggesting a systemic SLA misconfiguration where the scheduled delivery window is set too aggressively for what the carrier network can actually deliver.

---

## Tech Stack

| Layer | Tool |
|---|---|
| Data Cleaning and Feature Engineering | Python, Pandas |
| Database | Snowflake |
| Schema Design | Star Schema — 1 fact table, 5 dimension tables |
| Analysis | SQL |
| Development Environment | VS Code, Jupyter Notebooks |
| Version Control | Git, GitHub |

---

## Project Structure

```
dataco-supply-chain-analytics/
├── notebooks/
│   ├── 01_data_cleaning.ipynb        # Data cleaning and feature engineering
│   ├── 02_database_loading.ipynb     # Star schema creation and Snowflake loading
│   └── 03_sql_queries.ipynb          # SQL analysis — 8 business questions
├── sql/
│   └── schema.sql                    # Star schema DDL
├── .gitignore
└── README.md
```

---

## Database Design

Star schema with one central fact table and five dimension tables:

```
dim_customer   ──┐
dim_product    ──┤
dim_category   ──┤──► fact_orders (180,519 rows)
dim_department ──┤
dim_location   ──┘
```

**Engineered features added to fact_orders:**
- `delay_days` — actual shipping days minus scheduled shipment days
- `is_late` — binary flag, 1 if delay_days greater than 0

---

## SQL Analysis Queries

Eight business questions answered using pure SQL on Snowflake:

1. Overall late delivery rate across all orders
2. Late delivery rate by shipping mode
3. Late delivery rate by market
4. Top 10 worst performing regions
5. Late delivery rate by customer segment
6. Top 10 worst product categories by late delivery rate
7. Monthly trend of late delivery rate over time
8. Average delay days by shipping mode and market combined

---

## Business Recommendations

**1. Immediately audit First Class carrier SLAs**
Every First Class order arrives exactly 1 day late across all 5 global markets. This points to a scheduled delivery window that is set too aggressively for what the carrier network can deliver. Either renegotiate carrier commitments or extend the promised delivery window to customers.

**2. Review Second Class performance**
At 79.73% late, Second Class is nearly as problematic as First Class. The same SLA audit should cover Second Class carrier agreements.

**3. Recalibrate scheduled delivery estimates system-wide**
The average delay of only 0.57 days across all orders suggests the system promises faster delivery than operations can consistently execute. Adjusting customer expectations rather than overhauling operations may deliver a quick win on paper performance.

**4. Consider volume rebalancing toward Standard Class**
Until First and Second Class issues are resolved, routing more volume through Standard Class would improve overall on-time delivery performance given its significantly better track record.

---

## Data Quality Observation

Every First Class order has exactly DELAY_DAYS = 1 with zero variation across 27,814 orders spanning multiple years and 5 global markets. In a real supply chain, natural variation would be expected. This anomaly suggests either a structural SLA mismatch where the system always promises 1 day less than the carrier delivers, or a data generation artifact given this dataset was originally compiled for academic purposes.

---

## Dataset

DataCo Supply Chain Dataset 
Source: https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis
180,519 rows covering global supply chain operations.

---

## Author

**Ruhul Islam**  
Data Analytics Professional | Warren, MI  
[LinkedIn](https://linkedin.com/in/ruhulislam07) | [GitHub](https://github.com/ruhul-islam) | [Tableau](https://public.tableau.com/app/profile/ruhul.islam)
