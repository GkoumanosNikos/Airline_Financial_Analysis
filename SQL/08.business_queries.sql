-- 1. Which company has the better average revenue through the years?

SELECT company_id, company_name, round(AVG(revenue),2) AS average_revenue
FROM vw_financial
where year between 2019 AND 2022
GROUP BY company_id
ORDER BY 3 DESC;

-- 2. Which company has the highest revenues through the years?

SELECT company_name, company_id, sum(revenue) AS total_revenue
FROM vw_financial
GROUP BY company_id
ORDER BY 2 DESC;

-- 3. Which company had the lowest revenue performance through the years?

SELECT company_id, year, company_name, revenue 
FROM vw_financial
WHERE year BETWEEN 2019 AND 2022
ORDER BY company_id, revenue;

-- 4. Which company had the highest average ROE?
SELECT company_id, company_name,  AVG(ROE) AS Average_ROE
FROM vw_financial
WHERE year between 2019 AND 2022
GROUP BY company_name, company_id
order by 3 desc;

-- 5. Which company had the highest average liquidity?
SELECT company_id, company_name, ROUND(AVG(cash_ratio),2) AS Average_Liquidity
FROM vw_financial
WHERE year BETWEEN 2019 AND 2022
GROUP BY company_id, company_name;

-- 6. Which company used its assets more efficiently based on average ROA and Asset Turnover between 2019 and 2022?
SELECT company_id, company_name, ROUND(AVG(ROA),2) AS Average_ROA, ROUND(AVG(asset_turnover),2) AS Average_Asset_Turnover
FROM vw_financial
WHERE year BETWEEN 2019 AND 2022
GROUP BY company_id, company_name
ORDER BY 3 DESC,4 DESC;

-- 7. Which company had the highest average finacial performance based on ROA, ROE, Net Profit Margin, Debt Ratio?
SELECT company_id, company_name, ROUND(AVG(ROA),2) AS Average_ROA, 
	ROUND(AVG(ROE),2) AS Average_ROE, 
    ROUND(AVG(Net_Profit_Margin),2) AS Average_Net_Profit_Margin,
    ROUND(AVG(Debt_Ratio),2) AS Average_Debt_Ratio
FROM vw_financial
WHERE year between 2019 and 2022
GROUP BY company_id, company_name
ORDER BY 3 DESC, 4 DESC, 5 DESC, 6 ASC;

-- 8 Which company had the lowest Average Debt Ratio through the years?
SELECT company_id, company_name, ROUND(AVG(Debt_ratio),2) AS Average_Debt_Ratio 
FROM vw_financial
WHERE year BETWEEN 2019 AND 2022
GROUP BY company_id, company_name
ORDER BY 3;

-- 9. Which company had better financial performance post-Covid?
SELECT company_id, company_name, ROUND(AVG(revenue), 2) AS Average_Post_Covid_Revenue,
    ROUND(AVG(net_profit), 2) AS Average_Post_Covid_Net_Profit,
    ROUND(AVG(Net_Profit_Margin), 2) AS Average_Post_Covid_Net_Profit_Margin
FROM vw_financial
where year between 2021 and 2022
GROUP BY company_id, company_name
ORDER BY 1 DESC, 2 DESC;

-- 10. Which company had better average financial stability based on Altman Z-Score between 2019 and 2022?
SELECT
    company_id, company_name, year, Altman_Z_Score,
    CASE
        WHEN Altman_Z_Score > 2.61 THEN 'Safe Zone'
        WHEN Altman_Z_Score BETWEEN 1.11 AND 2.80 THEN 'Grey Zone'
        WHEN Altman_Z_Score < 1.10 THEN 'Danger Zone'
        ELSE 'Unknown'
    END AS Altman_Risk_Category
FROM vw_financial
WHERE year BETWEEN 2019 AND 2022
ORDER BY 1,3;

-- 11. Which years did each company record net losses between 2019 and 2022?
SELECT
    company_id,
    company_name,
    year,
    net_profit
FROM vw_financial
WHERE year BETWEEN 2019 AND 2022
  AND net_profit < 0
ORDER BY 1,3;

-- 12. How do the companies compare across key financial ratios between 2019 and 2022? 
SELECT
    company_id,	company_name,
    'Average ROE' AS Ratio_Name,
    ROUND(AVG(ROE), 2) AS Ratio_Value
FROM vw_financial
WHERE year BETWEEN 2019 AND 2022
GROUP BY company_id, company_name

UNION ALL

SELECT
    company_id, company_name,
    'Average Cash Ratio' AS Ratio_Name,
    ROUND(AVG(cash_ratio), 2) AS Ratio_Value
FROM vw_financial
WHERE year BETWEEN 2019 AND 2022
GROUP BY company_id, company_name

UNION ALL

SELECT
    company_id, company_name,
    'Average Debt Ratio' AS Ratio_Name,
    ROUND(AVG(Debt_ratio), 2) AS Ratio_Value
FROM vw_financial
WHERE year BETWEEN 2019 AND 2022
GROUP BY company_id, company_name

ORDER BY 3,4 DESC;