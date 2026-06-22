
update financial_ratios
SET Altman_Z_Score=1.277
WHERE company_id=1 AND year=2022;

update financial_ratios
SET Altman_Z_Score=-0.794
WHERE company_id=1 AND year=2021;

update financial_ratios
SET Altman_Z_Score=0.313
WHERE company_id=1 AND year=2020;

update financial_ratios
SET Altman_Z_Score=1.039
WHERE company_id=1 AND year=2019;

update financial_ratios
SET Altman_Z_Score=0.56
WHERE company_id=2 AND year=2019;

update financial_ratios
SET Altman_Z_Score=-0.48
WHERE company_id=2 AND year=2020;

update financial_ratios
SET Altman_Z_Score=1.18
WHERE company_id=2 AND year=2022;
