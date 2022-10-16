SELECT M.date, M.geo, M.impressions, M.clicks, R2.total_revenue
FROM marketing_data M
FULL JOIN
	(SELECT R1.date, R1.store_location, SUM(R1.revenue) as total_revenue
	FROM store_revenue R1
	GROUP BY R1.store_location, R1.date) AS R2
ON M.date = R2.date
WHERE R2.store_location LIKE CONCAT('%', M.geo);