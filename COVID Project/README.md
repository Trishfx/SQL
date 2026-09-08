# COVID-19 Data Exploration

## Business Question
Exploring global COVID-19 case, death, and vaccination data to understand 
infection and mortality rates by country and continent, and to calculate 
rolling vaccination progress over time.

## Dataset
- Source: COVID-19 case, death, and vaccination data (two tables: 
  `coviddeaths` and `covidvacc`)
- Fields include: location, continent, date, total cases, new cases, 
  total deaths, population, and new vaccinations

## SQL Techniques Used
- Data cleaning (`UPDATE` to normalize blank continent values to `NULL`)
- Type casting (`CAST(... AS REAL)`, `CAST(... AS INT)`) to safely perform 
  calculations on fields stored as text
- **Window functions** (`SUM() OVER (PARTITION BY ... ORDER BY ...)`) to 
  calculate a rolling vaccination count per country over time
- **Common Table Expressions (CTEs)** to structure the rolling vaccination 
  logic before calculating a percentage
- Joins across two related tables (`coviddeaths`, `covidvacc`)
- Aggregate functions (`MAX`, `SUM`)
- Temp table creation, to persist calculated results for downstream use 
  (e.g. feeding into a visualization tool)

## Key Questions Answered
- Likelihood of dying from COVID in a specific country (death percentage)
- Percentage of a country's population infected over time
- Countries with the highest infection rate relative to population
- Countries and continents with the highest total death counts
- Global case and death totals, and overall death percentage
- Rolling count of people vaccinated per country over time, and what 
  percentage of the population that represents


## Notes
This project follows a common real-world analytics pattern: exploratory 
querying first, followed by building a reusable temp table to store a more 
complex calculation (the rolling vaccination percentage) for downstream 
use, such as feeding into a BI tool or dashboard.
