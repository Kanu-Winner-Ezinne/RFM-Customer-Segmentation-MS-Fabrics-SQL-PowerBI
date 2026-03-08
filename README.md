 # Customer Segmentation & Revenue Dashboard

## Project Overview
This project analyzes customer purchasing behavior for an e-commerce business and visualizes insights through an interactive dashboard built in Power BI. The objective of the analysis was to segment customers using the RFM model (Recency, Frequency, Monetary) and evaluate how each customer segment contributes to overall revenue performance.

All data analysis and transformations were performed using SQL in Microsoft Fabric, and the results were visualized in Power BI through a semantic model.

---

## Business Problem
The Head of E-Commerce observed that the company was treating all customers the same despite having thousands of customers with different purchasing patterns. The business wanted to better understand customer behavior in order to design more effective marketing campaigns and promotions.

Key questions included:

- Which customers generate the most revenue?
- Which customers are at risk of churning?
- How does revenue change over time?
- How do different customer segments contribute to overall sales?

Understanding these patterns helps the business focus marketing efforts on the most valuable customers.

---

## Dataset

The dataset used for this project can be downloaded here:

https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci?resource=download

-----

## Dashboard Preview

![00ffd6b1-1](https://github.com/user-attachments/assets/3119e776-74b1-4509-bfd1-b3aa2bb49e4c)


## Tools Used

- SQL (Microsoft Fabric Warehouse)
- Microsoft Fabric Semantic Model
- Power BI

---

## Dataset
The dataset contains e-commerce transaction data with information about customer purchases, including invoice details, quantities, prices, and transaction dates. From this dataset, revenue was calculated and used to analyze customer behavior and performance trends.

---

## Project Workflow

Raw Transaction Data  
↓  
Data Cleaning using SQL  
↓  
RFM Analysis  
↓  
Customer Segmentation  
↓  
Monthly Revenue Aggregation  
↓  
Semantic Model Creation  
↓  
Power BI Dashboard  

---

## Data Cleaning
The raw dataset required cleaning and transformation before performing analysis. Data types were standardized, incorrect records were removed, and revenue was calculated from quantity and price values. This step ensured that the dataset was ready for further analysis.

---

## RFM Analysis
Customer value was analyzed using the RFM framework:

- **Recency** – how recently a customer made a purchase  
- **Frequency** – how often the customer makes purchases  
- **Monetary** – how much the customer spends  

These metrics were calculated for each customer and used to measure overall customer value.

---

## Customer Segmentation
Based on the RFM scores, customers were grouped into behavioral segments such as:

- Champions
- Loyal Customers
- At Risk
- Lost
- Others

This segmentation helps businesses understand which customers are highly valuable and which customers may require re-engagement strategies.

---

## Monthly Revenue Analysis
Revenue performance was analyzed across time by aggregating total revenue by month and year. This allowed the identification of trends and changes in revenue patterns over time.

---

## Semantic Model
After completing the SQL analysis, the results were imported into a Microsoft Fabric semantic model. The semantic model organized the processed data into tables that were used as the data source for the Power BI dashboard.

The main tables included:

- `customer_segments`
- `monthly_revenue`

---

## Power BI Dashboard
The final dashboard was built in Power BI to visualize key insights from the analysis.

### Key Performance Indicators (KPIs)

- Total Revenue
- Average Customer Value
- Total Customers
- Number of Customer Segments

### Visualizations

- Revenue by Customer Segment
- Monthly Revenue Trends
- Customers by Segment

---

## Key Insights

The analysis revealed several important findings:

- Champion customers generate the highest revenue.
- Some segments contain many customers but contribute less revenue.
- Revenue trends fluctuate across months and years.
- Customer segmentation can significantly improve targeted marketing strategies.

---

## Repository Structure

customer-segmentation-dashboard  
│  
├── README.md  
├── sql  
│   ├── data_cleaning.sql  
│   ├── rfm_analysis.sql  
│   ├── customer_segments.sql  
│   └── monthly_revenue.sql  
│  
├── dashboard  
│   └── dashboard.png  
