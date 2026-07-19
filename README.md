# Global Terrorism Hotspots Analysis  

<div align="center">
  <img src="https://images.unsplash.com/photo-1451187580459-43490279c0fa?auto=format&fit=crop&q=80&w=1200" alt="Global Network/Crisis Banner" width="100%" />
</div>

### A Data-Driven Strategic Review of Global Terrorism Trends (1970–Present)

---

## Executive Objective

This project leverages advanced SQL-driven analytics on the **Global Terrorism Database (GTD)** to extract actionable intelligence regarding global terrorism trends. Moving beyond basic descriptive statistics, the primary objective is to equip policy-makers, security agencies, and defense researchers with data-backed insights into geographic vulnerabilities, tactical evolutions, and the changing lethality of terrorist organizations.

The ultimate goal is to identify patterns that can inform predictive resource allocation and strategic counter-terrorism interventions.

---

## Key Strategic Findings

Detailed analytical outputs and visualizations are documented in the [`key_insights/`](key_insights/) directory. Below is a high-level summary of the critical discoveries:

### 1. The 80/20 Rule of Geographic Concentration
Terrorism is not a globally uniform threat. Our data reveals a stark geographic concentration, with a small subset of nations bearing the overwhelming majority of global attacks. 
- **The Epicenters:** Iraq and Afghanistan consistently rank as the most volatile nations globally.
- **Strategic Impact:** International policy interventions and humanitarian aid yield the highest Return on Investment (ROI) when targeted specifically at stabilizing the Middle East & North Africa (MENA) and South Asia.

### 2. The Escalation of Lethality (YoY Trends)
By applying Window Functions to track Year-Over-Year (YoY) casualty metrics, a deeply concerning trend emerged:
- **Insight:** In several key regions (such as Sub-Saharan Africa), the total *volume* of attacks has plateaued or decreased, but the *casualties per attack* have spiked.
- **Strategic Impact:** Terrorist organizations are shifting from high-frequency, low-impact attacks to lower-frequency, high-casualty mass casualty events (MCEs), indicating a shift in strategic objectives toward maximizing civilian and structural damage.

### 3. Operational Tactics & The Dominance of Explosives
- **Insight:** "Bombing/Explosion" remains the overwhelmingly dominant attack type globally. Furthermore, as conventional military presence increased post-2000, major groups rapidly shifted their tactical pipelines towards Improvised Explosive Devices (IEDs) and suicide bombings.
- **Strategic Impact:** Counter-terrorism intelligence should heavily prioritize the interdiction of explosive supply chains (e.g., commercial mining explosives, agricultural fertilizers) as a primary preventative measure over static point defense.

---

## 🛠 Analytical Methodology

This project utilized a modern, cloud-based data processing stack to transform raw incident records into structured intelligence.

### Data Architecture
- **Environment:** Databricks SQL Workspace & Databricks Query Editor
- **Storage:** Unity Catalog Volumes
- **Core Engine:** Databricks SQL 
- **Visualization:** Python (Pandas, Matplotlib, Seaborn, Folium) inside Jupyter Notebooks

### Data Engineering & Analytics Pipeline
1. **Data Normalization & Cleaning:** 
   - Handled extensive missing data utilizing `COALESCE` functions to prevent the dropping of valuable partial records.
   - Engineered new composite metrics (e.g., combining fatalities and injuries into a unified `casualties` index) for more accurate severity tracking.
2. **Advanced SQL Querying:**
   - Deployed **Common Table Expressions (CTEs)** to modularize complex sub-queries and group historical data by decades and active organizations.
   - Utilized **Window Functions (`LAG()`, `RANK()`)** to calculate dynamic Year-Over-Year percentage changes and programmatically rank evolving weapon preferences over time.
3. **Geospatial & Trend Analysis:**
   - Mapped attack densities and temporal shifts to visually represent the migration of conflict zones.

---

## Project Structure

- `sql/`: Contains all foundational and advanced analytical SQL scripts used for data extraction and trend calculation.
  - *Highlights:* `advanced_analytics.sql` (CTEs and Window Function implementations)
- `key_insights/`: Houses detailed breakdowns of the findings, including the Executive Summary and Results Explanation.
- `notebooks/`: Jupyter Notebooks containing the Python code used for generating Matplotlib/Seaborn data visualizations.
- `visualizations/`: Exported static and interactive charts/maps representing the data narrative.

---

## Future Enhancements

To further increase the strategic utility of this data, future iterations of this project will aim to implement:
- **Predictive Hotspot Modeling:** Utilizing Machine Learning clustering algorithms to identify emerging regions at risk of destabilization before they hit peak casualty rates.
- **Interactive Web Dashboards:** Deploying a live Power BI or Tableau dashboard to allow stakeholders to dynamically filter trends by specific organizations or date ranges.
- **Time-Series Forecasting:** Predicting short-term attack volumes based on historical seasonal trends in volatile regions.

---

### Dataset Attribution
This analysis is built upon the **Global Terrorism Database (GTD)**.  
*Dataset Source:* [Kaggle - START-UMD GTD](https://www.kaggle.com/datasets/START-UMD/gtd)  
*(Note: The raw dataset file is excluded from this repository due to licensing and file size limitations.)*

---
**Author:** Aditya
