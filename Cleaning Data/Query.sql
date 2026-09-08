--This is an Example of DATA CLEANING of NASSVILE house Cleaning data

select * 
From housing

-- Breaking out address into Individual colums (Address, city, State)

SELECT
    SUBSTR(PropertyAddress, 1, INSTR(PropertyAddress, ',') - 1) AS Address,
    SUBSTR(PropertyAddress, INSTR(PropertyAddress, ',') + 1) AS Address
FROM housing;

ALTER TABLE housing
ADD PropertySplitAddress Nvarchar(255);

UPDATE housing
SET PropertySplitAddress = SUBSTR(PropertyAddress, 1, INSTR(PropertyAddress, ',') - 1)

ALTER TABLE housing
ADD PropertySplitCity Nvarchar(255);

UPDATE housing
SET PropertySplitCity = SUBSTR(PropertyAddress, INSTR(PropertyAddress, ',') + 1);

-- alternative way to do this SQL 
Select 
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3), 
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM housing;

--Change Y and N to yes and no in sold as vacant 
Select SoldAsVacant, 
CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
WHEN SoldAsVacant = 'N' THEN 'No' 
ELSE SoldAsVacant
END 
FROM housing

UPDATE housing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
WHEN SoldAsVacant = 'N' THEN 'No' 
ELSE SoldAsVacant
END 

Select Distinct(SoldAsVacant), COUNT(SoldAsVacant)
FROM housing 
GROUP BY SoldAsVacant
ORDER By 2

--Remove Duplicates

WITH RowNumberCTE AS ( 
    SELECT rowid, 
           ROW_NUMBER() OVER (
               PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference 
               ORDER BY rowid  
           ) AS row_num
    FROM housing
)
DELETE FROM housing
WHERE rowid IN (
    SELECT rowid
    FROM RowNumberCTE
    WHERE row_num > 1
);

--check to see if duplicates are removed
WITH RowNumberCTE AS ( 
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference 
               ORDER BY rowid  
           ) AS row_num
    FROM housing
)
SELECT *
FROM RowNumberCTE
WHERE row_num > 1
ORDER BY PropertyAddress;


--DELETE Unused Columns

ALTER TABLE housing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress;
