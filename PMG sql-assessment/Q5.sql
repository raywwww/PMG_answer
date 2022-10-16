# Question 5 (Challenge)
# Generate a query to rank in order the top 10 revenue producing states

SELECT store_location
FROM(SELECT store_location,
	   RANK() OVER (ORDER BY SUM(revenue) DESC) AS ranking
       FROM store_revenue
       GROUP BY store_location)
WHERE ranking <= 10;