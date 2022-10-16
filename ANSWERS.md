# SQL Challenge

The database contains two tables, store_revenue and marketing_data.  Refer to the two CSV
files, store_revenue and marketing_data to understand how these tables have been created.

store_revenue contains revenue by date, brand ID, and location:

 >  create table store_revenue (
 >    id int not null primary key auto_increment,
 >    date datetime,
 >    brand_id int,
 >    store_location varchar(250),
 >    revenue float  
 >  );

marketing_data contains ad impression and click data by date and location:

> create table marketing_data (
>  id int not null primary key auto_increment,
>  date datetime,
>  geo varchar(2),
>  impressions float,
>  clicks float
> );

### Please provide a SQL statement under each question.

* Question #0 (Already done for you as an example)
 Select the first 2 rows from the marketing data
​
>  select *
>  from marketing_data
> limit 2;
​

*  Question #1
 Generate a query to get the sum of the clicks of the marketing data
​
> SELECT SUM(clicks) AS total_clicks
> FROM marketing_data;


*  Question #2
 Generate a query to gather the sum of revenue by geo from the store_revenue table
​
> SELECT store_location, SUM(revenue) AS total_revenue
> FROM store_revenue
> GROUP BY store_location;


*  Question #3
 Merge these two datasets so we can see impressions, clicks, and revenue together by date
and geo.
 Please ensure all records from each table are accounted for.
​
> SELECT M.date, M.geo, M.impressions, M.clicks, SUM(R.revenue) AS total_revenue
> FROM store_revenue R
> FULL OUTER JOIN marketing_data M
> ON S.id = R.id
> GROUP BY M.date, M.geo;


* Question #4
 In your opinion, what is the most efficient store and why?
 
​My understanding of ‘efficiency’ for a store is making more profit with less effort. To grow the profit, we can increase the revenue or reduce the cost. A perfect location is a prerequisite for the most efficient store because adequate customer traffic determines the basic exposure to potential customers. Once enough potential customers know about the store, attracting them to the store is the next big deal. I think we can leverage creative marketing strategy for advertisement and social media promotion. Through data analysis and A/B testing, the most efficient store needs to know how to provide diversified product categories and satisfying customer services. Various product can meet the needs of different customers while high-quality service builds a good brand reputation and enhance more returning buyers. Once we gain customers’ trust, their word-of-mouth will be a powerful and invaluable marketing asset. The most efficient store is not only decided by buyers but also built by the sellers. Good team chemistry ensures everyone on the board can communicate smoothly, solve problems quickly, and save a huge amount of time and labor costs. A store is like a machine, each segment makes it the most efficient one. I believe a store located in a perfect spot, attracting and satisfying customers, and having good team chemistry is the most efficient store.


* Question #5 (Challenge)
 Generate a query to rank in order the top 10 revenue producing states

> ​SELECT store_location
> FROM(SELECT store_location,
> 	     RANK() OVER (ORDER BY SUM(revenue) DESC) AS ranking
>        FROM store_revenue
>        GROUP BY store_location)
> WHERE ranking <= 10;