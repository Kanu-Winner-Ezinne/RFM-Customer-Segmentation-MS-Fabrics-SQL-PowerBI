CREATE VIEW dbo.customer_segments AS
WITH clean_data AS (
    SELECT
        _c0 AS Invoice,
        TRY_CAST(_c3 AS INT) AS Quantity,
        TRY_CAST(_c4 AS DATETIME) AS InvoiceDate,
        TRY_CAST(_c5 AS FLOAT) AS Price,
        _c6 AS CustomerID,
        TRY_CAST(_c3 AS INT) * TRY_CAST(_c5 AS FLOAT) AS Revenue
    FROM dbo.dataa
    WHERE _c0 <> 'Invoice'
      AND TRY_CAST(_c3 AS INT) IS NOT NULL
      AND TRY_CAST(_c3 AS INT) > 0
      AND _c0 NOT LIKE 'C%'
      AND _c6 IS NOT NULL
),
rfm AS (
    SELECT
        CustomerID,
        DATEDIFF(day, MAX(InvoiceDate), GETDATE()) AS Recency,
        COUNT(DISTINCT Invoice) AS Frequency,
        SUM(Revenue) AS Monetary
    FROM clean_data
    GROUP BY CustomerID
),
scored AS (
    SELECT
        CustomerID,
        Recency,
        Frequency,
        Monetary,
        NTILE(5) OVER (ORDER BY Recency DESC) AS r_score,
        NTILE(5) OVER (ORDER BY Frequency) AS f_score,
        NTILE(5) OVER (ORDER BY Monetary) AS m_score
    FROM rfm
)
SELECT
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    r_score,
    f_score,
    m_score,
    CASE
        WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
        WHEN r_score >= 4 AND f_score >= 3 THEN 'Loyal'
        WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
        WHEN r_score = 1 AND f_score = 1 THEN 'Lost'
        ELSE 'Others'
    END AS Segment
FROM scored;

SELECT * FROM dbo.customer_segments;


