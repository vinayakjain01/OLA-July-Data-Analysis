create database ola;
use ola;

select * from bookings;

# SQL Questions

# 1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings
where Booking_status  = 'Success';

select * from Successful_Bookings;

# 2. Find the average ride distance for each vehicle type:
create view avg_ride_distance as
select Vehicle_Type , avg(Ride_Distance) as Average_Distance 
from Bookings
group by Vehicle_Type;

Select * from avg_ride_distance;

# 3. Get the total number of cancelled rides by customers:
create view Total_canceled_rides_by_customers as 
select count(*) as Total_Canceled_rides from Bookings 
where Booking_Status = 'Canceled by Customer';

select * from Total_canceled_rides_by_customers;

# 4. List the top 5 customers who booked the highest number of rides:
create view Top5_Customers as
select Customer_ID , count(Booking_ID) as Total_Rides
from bookings
group by Customer_ID
order by Total_Rides desc
limit 5;

select * from Top5_Customers;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Total_canceled_rides_by_driver as
select count(*) as Canceled_rides
from Bookings
where Booking_Status = 'Canceled by Driver' and Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Total_canceled_rides_by_driver;

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Prime_Sedan_rating as 
select max(Driver_Ratings) as Maximum_Rating , min(Driver_ratings) as Minimum_Rating 
from Bookings
where vehicle_type = 'Prime Sedan';

select * from Prime_Sedan_rating;

# 7. Retrieve all rides where payment was made using UPI
create view UPI_Rides as
select * from Bookings
where Payment_Method = 'UPI';

select * from UPI_Rides;

# 8. Find the average customer rating per vehicle type:
create view  Customer_rating as
select Vehicle_Type , avg(Customer_Rating) as Ratings
from Bookings
group by Vehicle_Type;

select * from Customer_rating;

#9. Calculate the total booking value of rides completed successfully:
create view Completed_rides as
select sum(Booking_value) as Total_Booking_value 
from Bookings
where Booking_Status ='Success';

select * from Completed_rides;

# 10. List all incomplete rides along with the reason:
create view Incomplete_rides as 
Select Booking_ID , Incomplete_Rides_Reason 
from Bookings
where Incomplete_Rides = 'Yes';

select * from Incomplete_rides ;

