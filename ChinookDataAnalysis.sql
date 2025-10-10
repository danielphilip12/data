-- Who are the top 5 customers?
select c.Email, sum(i.Total) as total_spent from Invoice i
join Customer c 
on i.CustomerId  = c.CustomerId
group by c.Email
order by total_spent desc
limit 5;
-- Which genre has the most tracks 
select g.Name, count(*) as n_tracks from Track t 
join Genre g 
on t.GenreId = g.GenreId
group by g.Name
order by n_tracks desc;
-- What is the total sales revenue per country
select i.BillingCountry, sum(i.Total) as revenue from Invoice i
group by i.BillingCountry
order by revenue desc;
-- Which employee made the most sales in dollars
select e.FirstName, e.LastName, e.Title, sum(i.Total) as total_sales_amount from Employee e 
join Customer c 
on e.EmployeeId = c.SupportRepId 
join Invoice i 
on i.CustomerId = c.CustomerId
group by e.FirstName
order by total_sales_amount desc
limit 1;
-- What are the top 10 most popular tracks sold
select t.Name, count(*) as total_sold from InvoiceLine il 
join Track t 
on il.TrackId = t.TrackId
group by t.Name
order by total_sold desc
limit 10;

