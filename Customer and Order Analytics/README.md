# Customer and Order Analytics

## Business Question
Analyzing customer and order data across two months (January and February) 
to understand order volume, product performance, revenue, and customer 
purchasing behavior across different store locations.

## Dataset
- Source: `BIT_DB` — a relational database with separate sales tables for 
  January and February, plus a customer accounts table
- Tables used: `JanSales`, `FebSales`, `customers`
- Fields include: order ID, product, price, quantity, location, account number

## SQL Techniques Used
- Aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
- `INNER JOIN` and `LEFT JOIN` across sales and customer tables
- `GROUP BY` with `HAVING` for filtered aggregation
- Subqueries (finding the top revenue-generating product)
- String matching with `LIKE` for location-based filtering
- Data cleaning within queries (filtering out header rows and malformed order IDs)

## Key Questions Answered
- Total orders placed in January, and how many were for iPhones
- Customer account numbers for all February orders
- Cheapest product sold in January
- Total revenue per product in January
- Products sold at a specific Seattle location in February
- Customers who ordered more than 2 products at once, and their average spend
- Products sold in Los Angeles in February
- New York locations with 3+ orders in January
- Headphone sales breakdown for February
- Average spend and average quantity per account in February
- Highest revenue-generating product in January


## Notes
Queries were written to handle messy real-world data — filtering out header 
rows accidentally included in the raw data and validating order ID length 
to exclude bad records.
