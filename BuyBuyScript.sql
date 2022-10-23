---to create Database
CREATE DATABASE Buybuy_company;

---to create Schema and Table
create schema buybuysalesdata
create table buybuysalesdata.sales
(Sales_date date,
    Sales_year int,
 	Sales_month varchar,
 	Quarter_of_the_year varchar,
    Customer_id bigint,
	Customer_age int,
    Customer_gender varchar,
    Customer_country varchar,
    Customer_state varchar,
    Product_category varchar,
    Product_sub_category varchar,
    Product varchar,
    Order_quantity int,
    Unit_cost int,
    Unit_price int,
 	Unit_sold int,
    Cost int,
    Revenue int,
 	Profit int
    )

---to view all table
select * from buybuysalesdata.sales



--------------Time-Profit Analysis------------------

---query that returns the total profit made by BuyBuy Company from 1Q11 to 4Q16 (all quarters of every year)
select quarter_of_the_year,sum(profit) as total_profit from buybuysalesdata.sales
group by quarter_of_the_year
order by 1

---queries that return the total profit made by BuyBuy Company in Q2 of every year from 2011 to 2016.
select quarter_of_the_year,sales_year,sum(profit) as total_profit from buybuysalesdata.sales
where quarter_of_the_year = 'Q2'
group by sales_year,quarter_of_the_year
order by 2

---query that returns the annual profit made by BuyBuy Company from the year 2011 to 2016.
select sales_year,sum(profit) as total_profit from buybuysalesdata.sales
group by sales_year
order by 1

--------------Regional-Profit Analysis------------------

---queries that return the countries where BuyBuy has made the most profit and also the least profit of all-time. Your query must display both results on the same output.
select customer_country, max(profit) as max_profit, min(profit) as min_profit from buybuysalesdata.sales
group by customer_country

---query that shows the Top-10 most profitable countries for BuyBuy Company sales operations from 2011 to 2016
select customer_country, sum(profit) as most_profitable from buybuysalesdata.sales
group by customer_country
order by 2 desc
limit 3

---query that shows the all-time Top-10 least profitable countries for BuyBuy Company sales operations.
select customer_country, sum(profit) as most_profitable from buybuysalesdata.sales
group by customer_country
order by 2
limit 3

--------------Product-Revenue Analysis------------------

---query that ranks all product categories sold by Buybuy Company, from least amount to the most amount of all-time revenue generated.
select product_category, sum(revenue) as prodcat_rank from buybuysalesdata.sales
group by product_category
order by 2 

---query that returns Top-2 product categories offered by Buybuy Company with an all-time high number of units sold.
select product_category, sum(unit_sold) as total_unit_sold from buybuysalesdata.sales
group by product_category
order by 2
limit 2

---query that shows the Top 10 highest-grossing products sold by BuyBuy Company based on all-time profits.
select product, sum(profit) as prod_profit from buybuysalesdata.sales
group by product
order by 2 desc
limit 10
