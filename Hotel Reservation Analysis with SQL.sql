create database intership;
use intership;

-- #Q1. What is the total number of reservation of the dataset?

select count(Booking_id) from hotel_reservation_dataset;

-- #Q2.Which meal plan is most popular among guest?

SELECT type_of_meal_plan, COUNT(*) AS count
FROM hotel_reservation_dataset
GROUP BY type_of_meal_plan
ORDER BY count DESC LIMIT 1;

-- #Q3.What is the average price per room for reservations involving children? 

select avg(avg_price_per_room) from hotel_reservation_dataset
where no_of_childrein>0;

-- Q4 How many reservations were made for the year 2018 (replace XX with the desired year)? 

SELECT COUNT(*) AS reservations_2018
FROM hotel_reservation_dataset
WHERE YEAR(arrival_date) = 2018;

         -- OR
         
select * from hotel_reservation_dataset
 where arrival_date>= "2018-01-01" AND arrival_date < "2019-01-01";
 
 -- Q5. What is the most commonly booked room type? 
SELECT room_type_reserved, COUNT(*) AS count
FROM hotel_reservation_dataset
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

-- Q6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
select count(no_of_weekend_nights) from hotel_reservation_dataset where no_of_weekend_nights > 0;

-- Q7. What is the highest and lowest lead time for reservations? 

 select max(lead_time) as highest_lead_time
 , min(lead_time) as lowest_lead_time from hotel_reservation_dataset;
 
 -- Q8. What is the most common market segment type for reservations? 

SELECT market_segment_type, COUNT(*) as common_market
FROM hotel_reservation_dataset
GROUP BY market_segment_type
ORDER BY common_market DESC
LIMIT 1;

-- Q9. How many reservations have a booking status of "Confirmed"? 

select booking_status, count(*) 
from hotel_reservation_dataset where booking_status = "Not_Canceled";

-- Q10. What is the total number of adults and children across all reservations? 

select sum(no_of_adults), sum(no_of_children) from hotel_reservation_dataset;

-- Q11. What is the average number of weekend nights for reservations involving children? 

select avg(no_of_weekend_nights) 
from hotel_reservation_dataset
where no_of_children > 1; 

-- Q12. How many reservations were made in each month of the year?

SELECT MONTH(arrival_date) AS month, COUNT(*) AS reservations_count
FROM hotel_reservation_dataset
GROUP BY MONTH(arrival_date)
ORDER BY month;

-- Q13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?

SELECT room_type_reserved, 
       AVG(no_of_weekend_nights + no_of_week_nights) AS avg_total_nights
FROM hotel_reservation_dataset
GROUP BY room_type_reserved;

-- Q14. For reservations involving children, what is the most common room type, and what is the average 
-- price for that room type?

SELECT room_type_reserved, COUNT(*) AS count, AVG(avg_price_per_room) AS avg_price
FROM hotel_reservation_dataset
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;


-- Q15. Find the market segment type that generates the highest average price per room.

SELECT market_segment_type, AVG(avg_price_per_room) AS avg_price
FROM hotel_reservation_dataset
GROUP BY market_segment_type
ORDER BY avg_price DESC
LIMIT 1;

