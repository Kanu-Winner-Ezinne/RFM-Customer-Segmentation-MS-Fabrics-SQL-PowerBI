select top 10 * from dataa;

WITH clean_data AS (
    SELECT
        _c0 AS Invoice,
        _c1 AS StockCode,
        _c2 AS Description,
        TRY_CAST(_c3 AS INT) AS Quantity,
        TRY_CAST(_c4 AS DATETIME) AS InvoiceDate,
        TRY_CAST(_c5 AS FLOAT) AS Price,
        _c6 AS CustomerID,
        _c7 AS Country,
        TRY_CAST(_c3 AS INT) * TRY_CAST(_c5 AS FLOAT) AS Revenue
    FROM dataa
    WHERE _c0 <> 'Invoice'
      AND TRY_CAST(_c3 AS INT) IS NOT NULL
      AND TRY_CAST(_c3 AS INT) > 0
      AND _c0 NOT LIKE 'C%'
      AND _c6 IS NOT NULL
),
SELECT *
FROM clean_data;