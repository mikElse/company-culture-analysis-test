# Company Culture & Business Performance

This project explores the relationship between **employee engagement** and **business outcomes**—specifically revenue and operational efficiency—through structured data analysis and basic machine learning techniques.

The work is part of a larger effort to:
- Understand how people-centric metrics (like survey responses) correlate with business performance
- Build intuition around real-world data science workflows
- Learn and apply core concepts in **Python**, **SQL**, **Pandas**, **visualization**, and **introductory ML**
- Practice good development habits, including documentation and reproducibility

---

## 🔍 Project Summary

This case study focuses on analyzing mock datasets representing:

- **Customer CRM records**, including contract value and onboarding times  
- **Employee engagement survey responses**, structured around Gallup-style questions  
- **Sales rep assignments**, connecting CRM records to individual employees

Using a PostgreSQL backend and a Jupyter notebook workflow, the following questions are explored:

- Are certain engagement survey responses correlated with higher customer ARR?
- Can we identify specific engagement factors that predict better onboarding performance?
- What does the data suggest about causality—or lack thereof?

---

## Tools Used

- **Python** (Pandas, Seaborn, Matplotlib, SQLAlchemy)
- **PostgreSQL** for relational data modeling
- **Jupyter Notebooks** for iterative analysis
- **SQL** for query logic and dataset assembly
- **Git** for version control and reproducibility

---

## Key Files

- `notebooks/what_employee_engagement_metrics_impact_business_most.ipynb`  
  → Main analysis notebook with detailed markdown annotations and visualizations

- `queries/sales_rep_engagement_vs_arr.sql`  
  → SQL query to assemble engagement scores + ARR outcomes at the sales rep level

- `data/raw/*.csv`  
  → Mock datasets used for loading into PostgreSQL

---

## Why This Project?

This project is designed for **hands-on learning**. It’s meant to simulate how a product or business analyst might approach ambiguous problems using data, and serve as a sandbox for learning skills in:

- Data preparation & preprocessing  
- SQL-to-Pandas workflows  
- Exploratory data visualization  
- Early-stage causal inference  
- Reproducible, well-documented analysis

---

## Future Ideas

- Incorporate basic **regression modeling** to evaluate predictive power
- Introduce **temporal slicing** to simulate before/after engagement impact
- Add **additional data sources** (performance reviews, product usage)
- Evaluate **feature importance** via scikit-learn pipelines

---

## Disclaimer

This dataset is **mock data** and not intended to reflect real-world employee or customer behavior. All insights are illustrative.

---

## Contact

Created and maintained by **Mike Else**  
[LinkedIn](https://www.linkedin.com/in/mike-else-462a8a20) · [GitHub](https://github.com/mikElse) · [Web](https://www.mikelse.com)
