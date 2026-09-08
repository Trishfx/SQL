# Fortune 500 Company Analysis

## Business Question
Exploring company-level data (revenue, employee count, and benefits) to 
evaluate companies as potential employers based on healthcare benefits, 
paid time off, and maternity leave policy — plus general company size 
and tenure statistics.

## Dataset
- A custom `fortune_companies` table covering company name, industry, 
  revenue, employee count, healthcare benefits (boolean), paid time off 
  days, maternity leave weeks, and average employee tenure
- Note: several rows in the underlying dataset use placeholder company 
  names for demonstration purposes

## SQL Techniques Used
- Multi-tier categorization using `CASE WHEN` (e.g. rating companies as 
  "mother friendly," "acceptable," or "abysmal" based on maternity leave)
- Aggregate functions (`AVG`) grouped by industry
- Multi-condition filtering (`WHERE ... AND ...`)
- `GROUP BY` / `ORDER BY` / `LIMIT` for top-N questions

## Key Questions Answered
- Which companies are worth applying to, based on whether they offer 
  healthcare benefits
- How Healthcare-industry companies rank on maternity leave generosity
- Average revenue by industry, among companies offering healthcare benefits
- Companies offering both healthcare benefits and 20+ PTO days
- Companies with more than 2,000 employees
- Which company has the highest average employee tenure


## Notes
This project's core technique — using `CASE WHEN` to bucket 
records into meaningful categories based on multiple thresholds — is a 
practical pattern for turning raw data into decision-ready labels. Some 
company names in the source data are placeholders; a future iteration of 
this project would swap in a real Fortune 500 dataset to strengthen the 
analysis.
