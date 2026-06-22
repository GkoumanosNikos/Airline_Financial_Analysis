INSERT INTO financial_ratios
	(company_id, year, ROE, ROA, asset_turnover, working_capital, Debt_ratio, Net_Profit_Margin, cash_ratio, Altman_Z_Score)
	SELECT 
		c.company_id,i.year,
        ROUND((i.net_profit / b.equity) * 100, 2) AS ROE,
        ROUND((i.net_profit / b.assets) * 100, 2) AS ROA,
		ROUND(i.revenue/b.assets,2) as Asset_Turnover,
		ROUND((b.current_assets-b.current_liabilities)/b.assets,2) AS Working_Capital,
		ROUND((b.liabilities / b.assets) * 100, 2) AS Debt_Ratio,
		ROUND((i.net_profit / i.revenue) * 100, 2) AS Net_Profit_Margin,
		ROUND((b.cash / b.current_liabilities) * 100, 2) AS Cash_Ratio,
        NULL AS Altman_Z_Score
FROM companies c JOIN income_statements i ON c.company_id=i.company_id
	JOIN balance_sheets b ON c.company_id=b.company_id AND i.year = b.year;
    

    