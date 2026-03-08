CREATE VIEW dbo.monthly_revenue AS
SELECT
    YEAR(TRY_CAST(_c4 AS DATETIME)) AS SalesYear,
    MONTH(TRY_CAST(_c4 AS DATETIME)) AS SalesMonth,
    SUM(TRY_CAST(_c3 AS INT) * TRY_CAST(_c5 AS FLOAT)) AS TotalRevenue
FROM dbo.dataa
WHERE _c0 <> 'Invoice'
  AND TRY_CAST(_c3 AS INT) IS NOT NULL
  AND TRY_CAST(_c3 AS INT) > 0
  AND _c0 NOT LIKE 'C%'
GROUP BY
    YEAR(TRY_CAST(_c4 AS DATETIME)),
    MONTH(TRY_CAST(_c4 AS DATETIME));

SELECT * FROM dbo.monthly_revenue;


CREATE OR ALTER VIEW monthly_revenue AS
WITH clean_data AS (
    SELECT
        _c0 AS Invoice,
        TRY_CAST(_c3 AS INT) AS Quantity,
        TRY_CAST(_c4 AS DATETIME) AS InvoiceDate,
        TRY_CAST(_c5 AS FLOAT) AS Price,
        TRY_CAST(_c3 AS INT) * TRY_CAST(_c5 AS FLOAT) AS Revenue
    FROM dataa
    WHERE _c0 <> 'Invoice'
      AND TRY_CAST(_c3 AS INT) IS NOT NULL
      AND TRY_CAST(_c3 AS INT) > 0
      AND _c0 NOT LIKE 'C%'
)

SELECT
    YEAR(InvoiceDate) AS SalesYear,
    MONTH(InvoiceDate) AS SalesMonth,
    DATENAME(month, InvoiceDate) AS MonthName,
    SUM(Revenue) AS TotalRevenue
FROM clean_data
GROUP BY
    YEAR(InvoiceDate),
    MONTH(InvoiceDate),
    DATENAME(month, InvoiceDate);