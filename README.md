# DE-Zoomcamp Week 4 - Analytics Engineering with dbt

This repository contains the Week 4 homework and project materials from the [DataTalks.Club Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp), focusing on **Analytics Engineering** using **dbt (data build tool)**.

## 📋 Project Overview

This project demonstrates the implementation of a data transformation pipeline using dbt to build analytics-ready models from taxi trip data. The pipeline transforms raw taxi trip data into dimensional models suitable for analytical queries and business intelligence.

## 🏗️ Architecture

The project uses dbt to transform raw taxi data stored in BigQuery into a series of staging, intermediate, and fact/dimension tables following analytics engineering best practices.

### Key Components:
- **Raw Data**: NYC Taxi & Limousine Commission trip records (Green and Yellow taxi data)
- **Transformation Layer**: dbt models for data cleaning, transformation, and aggregation
- **Target Platform**: Google BigQuery
- **Models Built**:
  - Staging models for data cleaning and standardization
  - Fact tables for trip-level and aggregated metrics
  - Dimension tables for lookup data (zones, dates, etc.)
  - Monthly zone revenue aggregations

## 📊 Data Models

### Fact Tables
- **`fct_trips`**: Core fact table containing individual trip records with calculated metrics
- **`fct_monthly_zone_revenue`**: Aggregated monthly revenue by pickup zone and service type

### Key Metrics
- Trip counts and aggregations
- Revenue analysis by zone and service type
- Time-based aggregations (monthly, yearly)

## 🔍 Sample Queries

### Question 4: Zone with Highest Revenue for Green Taxis in 2020

```sql
SELECT 
  pickup_zone,
  SUM(revenue_monthly_total_amount) AS max_revenue
FROM `<your_project>.<your_dataset>.fct_monthly_zone_revenue`
WHERE service_type = 'Green'
  AND EXTRACT(YEAR FROM revenue_month) = 2020
GROUP BY pickup_zone
ORDER BY max_revenue DESC;
```

### Question 5: Total Trips for Green Taxis in October 2019

```sql
SELECT
  service_type,
  COUNT(trip_id) AS trips_qntd
FROM `<your_project>.<your_dataset>.fct_trips`
WHERE EXTRACT(YEAR FROM pickup_datetime) = 2019
  AND EXTRACT(MONTH FROM pickup_datetime) = 10
  AND service_type = 'Green'
GROUP BY service_type;
```


## 🚀 Getting Started

### Prerequisites
- Google Cloud Platform account with BigQuery enabled
- dbt Cloud account or dbt Core installed locally
- Access to NYC taxi trip data in BigQuery

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/Santiago956/DE-Zoomcamp-week4.git
   cd DE-Zoomcamp-week4
   ```

2. **Configure dbt profile**
   - Set up your `profiles.yml` with BigQuery credentials
   - Update the project and dataset names

3. **Install dependencies**
   ```bash
   dbt deps
   ```

4. **Run the models**
   ```bash
   dbt run
   ```

5. **Test the models**
   ```bash
   dbt test
   ```

## 📁 Project Structure

```
DE-Zoomcamp-week4/
├── models/
│   ├── staging/        # Staging models for raw data cleaning
│   ├── core/           # Core fact and dimension tables
│   └── marts/          # Business-specific aggregations
├── tests/              # Data quality tests
├── macros/             # Reusable SQL macros
├── dbt_project.yml     # dbt project configuration
└── README.md
```

## 🛠️ Technologies Used

- **dbt** - Data transformation framework
- **Google BigQuery** - Cloud data warehouse
- **SQL** - Query language for transformations
- **Jinja** - Templating for dynamic SQL generation

## 📚 Learning Outcomes

Through this project, you'll learn:
- How to structure a dbt project following best practices
- Building staging, fact, and dimension tables
- Implementing data quality tests
- Creating reusable macros and models
- Optimizing queries for analytical workloads
- Documenting data models

## 🔗 Resources

- [DataTalks.Club Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp)
- [dbt Documentation](https://docs.getdbt.com/)
- [NYC TLC Trip Record Data](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

## 👤 Author

**Santiago956**

---

*This project is part of the DataTalks.Club Data Engineering Zoomcamp - Week 4: Analytics Engineering*
