# Global Terrorism Hotspots Analysis  
### SQL-Based Exploratory Data Analysis on Global Terrorism Trends

---

## Overview

This project analyzes global terrorism incidents using the **Global Terrorism Database (GTD)** to identify high-risk regions, attack patterns, casualty trends, and active terrorist organizations through SQL-driven exploratory data analysis.

The objective of this analysis is to transform raw terrorism incident data into actionable insights using structured querying, analytical reasoning, and visual storytelling.

This project demonstrates practical skills in:

- SQL analytics
- Cloud-based data processing
- Exploratory Data Analysis (EDA)
- Data visualization
- Trend analysis
- Geospatial analytics
- Insight generation
- Analytical reporting

---

## Business Problem

Governments, security agencies, and policy researchers require data-driven insights to understand:

- Which countries and regions experience the highest concentration of terrorist incidents
- How terrorism trends evolve over time
- Which attack methods are most frequently used
- Which terrorist organizations are most active
- How casualty severity differs across regions

This project uses structured analytical workflows to uncover meaningful patterns from historical terrorism data.

---

## Dataset

### Global Terrorism Database (GTD)

The dataset contains worldwide terrorism incident records including:

- Attack date
- Country and region
- Attack type
- Target type
- Terrorist organization
- Casualties
- Geographic coordinates

**Dataset Source:**  
https://www.kaggle.com/datasets/START-UMD/gtd

> Dataset files are excluded from this repository due to licensing and file size limitations.

---

## Tech Stack

| Category | Tools Used |
|---|---|
| Cloud Platform | Databricks |
| Storage | Databricks Volumes |
| Query Engine | Databricks SQL |
| Languages | SQL, Python |
| Data Processing | Pandas |
| Visualization | Matplotlib, Seaborn, Folium |
| Environment | Jupyter Notebook |

---

# Analytical Workflow

## 1. Data Exploration

Performed initial dataset exploration to understand:

- Total records
- Missing values
- Country distribution
- Regional coverage
- Attack classifications

### Key Operations
- Null analysis
- Frequency distributions
- Descriptive statistics
- Data quality inspection

---

## 2. Temporal Trend Analysis

Analyzed terrorism incidents over time to identify:

- Yearly growth trends
- Peak attack periods
- Long-term escalation patterns

### Example Insights
- Significant increase in attacks during the 2010s
- Temporal clustering in politically unstable regions

---

## 3. Geographic Hotspot Analysis

Identified countries and regions with the highest terrorism activity.

### Analysis Included
- Top affected countries
- Regional attack concentration
- Geographic distribution mapping

### Key Findings
- Iraq and Afghanistan recorded the highest attack frequencies
- Middle East and South Asia emerged as major hotspots

---

## 4. Attack Type Analysis

Studied operational patterns used in terrorist incidents.

### Metrics Analyzed
- Most common attack methods
- Success rates
- Weapon type distribution

### Findings
- Bombings and explosions represented the dominant attack category globally

---

## 5. Terrorist Organization Analysis

Analyzed the activity of terrorist organizations.

### Focus Areas
- Most active groups
- Group-wise attack volume
- Regional concentration of organizations

---

## 6. Casualty & Severity Analysis

Examined the human impact of terrorism incidents.

### Metrics
- Fatalities
- Injuries
- High-casualty events
- Country-wise casualty severity

---

# Key Insights

Detailed findings are documented in:

```text
insights/key_findings.md
```

---

# Visualizations

The project includes both static and interactive visualizations.

## Included Visual Outputs

- Attacks per year
- Top affected countries
- Regional heatmaps
- Interactive terrorism map

---


# Setup Instructions

## Environment

This project was developed using:

- Databricks SQL Workspace
- Databricks Query Editor
- Unity Catalog Volumes
- SQL
- Python Visualization Libraries

---

## Data Import Process

### 1. Create a Volume

A Databricks Volume was created to store the dataset file.

---

### 2. Upload Dataset

The Global Terrorism Database CSV file was uploaded into the Databricks Volume storage.

---

### 3. Create SQL Table

The dataset was imported into a structured table using Databricks SQL.

Example:

```sql
CREATE TABLE terrorism_data
USING CSV
OPTIONS (
  path '/Volumes/workspace/default/gtd/globalterrorismdb.csv',
  header 'true',
  inferSchema 'true'
);
```

---

### 4. Run SQL Analysis

All analysis queries were executed using the Databricks SQL Query Editor.

The project includes:
- Exploratory analysis
- Temporal trend analysis
- Hotspot detection
- Attack type analysis
- Casualty analysis
- Terrorist organization analysis

---

# Visualization Workflow

Query outputs were exported and visualized using:

- Python
- Pandas
- Matplotlib
- Seaborn
- Folium

Visual outputs are available in the `visualizations/` directory.

---

# Future Enhancements

Potential improvements for future versions:

- Power BI / Tableau dashboard integration
- Predictive hotspot modeling
- Time-series forecasting
- Machine learning clustering
- Real-time terrorism monitoring pipeline
- Interactive web dashboard deployment

---

# Skills Demonstrated

## Data Analytics
- Exploratory Data Analysis (EDA)
- Trend Analysis
- Geospatial Analysis
- Insight Generation

## SQL
- Aggregations
- GROUP BY analysis
- Window functions
- Joins
- Filtering and ranking queries

## Cloud Analytics
- Databricks SQL
- Databricks Volumes
- Cloud-based querying
- Structured data management

## Visualization
- Statistical visualization
- Geographic mapping
- Interactive dashboards

---

# Author

**Aditya**  
---

# License

This project is intended for educational, analytical, and research purposes only.
