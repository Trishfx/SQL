# Data Cleaning: Nashville Housing Dataset

## Business Question
Cleaning and standardizing a raw housing dataset so it's ready for 
analysis — splitting combined address fields, standardizing inconsistent 
values, removing duplicate records, and dropping unused columns.

## Dataset
- Source: Nashville housing dataset (a widely-used practice dataset for 
  SQL data cleaning)
- Contains property sale records with fields including parcel ID, 
  property address, owner address, sale price, sale date, and 
  sold-as-vacant status

## SQL Techniques Used
- String parsing (`SUBSTR`, `INSTR`) to split a combined address field 
  into individual address and city columns
- Alternative string-splitting approach using `PARSENAME` and `REPLACE`, 
  shown as a comparison method
- Data standardization using `CASE` statements (converting Y/N values to 
  Yes/No)
- **Window functions** (`ROW_NUMBER() OVER (PARTITION BY ...)`) to 
  identify and remove duplicate rows based on matching key fields
- Schema modification (`ALTER TABLE`, `ADD`, `DROP COLUMN`) to add 
  cleaned columns and remove unused ones
- `UPDATE` statements to apply cleaning logic directly to the table

## Key Steps Performed
- Split `PropertyAddress` into separate address and city columns
- Compared this to an alternative method using `PARSENAME` on the 
  `OwnerAddress` field
- Standardized the `SoldAsVacant` field from Y/N to Yes/No
- Verified the standardization by checking value counts before and after
- Identified and removed duplicate rows using a window function, based on 
  matching ParcelID, address, sale price, sale date, and legal reference
- Verified duplicates were fully removed
- Dropped unused columns (`OwnerAddress`, `TaxDistrict`, `PropertyAddress`) 
  once their cleaned replacements were in place

## Notes
This project focuses specifically on data preparation rather than 
analysis — a core part of the analytics engineering workflow, since raw 
data typically needs to be cleaned and standardized before it can be 
reliably analyzed. The `PARSENAME` query was written in SQL Server syntax 
as an alternative approach to the `SUBSTR`/`INSTR` method used elsewhere 
in this file, and was tested separately in a SQL Server environment.
