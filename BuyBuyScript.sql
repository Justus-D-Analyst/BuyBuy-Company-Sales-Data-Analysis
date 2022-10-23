CREATE DATABASE Buybuy_company;
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
	
select * from buybuysalesdata.sales



--------------Time-Profit Analysis------------------

-----------------1a---------------------
select quarter_of_the_year,sum(profit) as total_profit from buybuysalesdata.sales
group by quarter_of_the_year
order by 1

-----------------1b------------------
select quarter_of_the_year,sales_year,sum(profit) as total_profit from buybuysalesdata.sales
where quarter_of_the_year = 'Q2'
group by sales_year,quarter_of_the_year
order by 2

-----------------1c------------------
select sales_year,sum(profit) as total_profit from buybuysalesdata.sales
group by sales_year
order by 1

-----------------1d-------------------
---Create a chart to visualize 1b


-----------------2a-----------------
select customer_country, max(profit) as max_profit, min(profit) as min_profit from buybuysalesdata.sales
group by customer_country

----------------2b------------------
select customer_country, sum(profit) as most_profitable from buybuysalesdata.sales
group by customer_country
order by 2 desc
limit 3

----------------2c------------------
select customer_country, sum(profit) as most_profitable from buybuysalesdata.sales
group by customer_country
order by 2
limit 3

----------------2d----------------
--Create a chart to visualize 2b


----------------3a----------------
select product_category, sum(revenue) as prodcat_rank from buybuysalesdata.sales
group by product_category
order by 2 

----------------3b-----------------
select product_category, sum(unit_sold) as total_unit_sold from buybuysalesdata.sales
group by product_category
order by 2
limit 2

----------------3c-----------------
select product, sum(profit) as prod_profit from buybuysalesdata.sales
group by product
order by 2 desc
limit 10

----------------3d------------------
---Create a chart to visualize 3b


