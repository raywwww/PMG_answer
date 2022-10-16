# Question 3
# Merge these two datasets so we can see impressions, clicks, and revenue together by date and geo.
# Please ensure all records from each table are accounted for.

SELECT M.date, M.geo, M.impressions, M.clicks, SUM(R.revenue) AS total_revenue
FROM store_revenue R
FULL OUTER JOIN marketing_data M
ON S.id = R.id
GROUP BY M.date, M.geo;