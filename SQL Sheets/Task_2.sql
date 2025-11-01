USE amazon_logistics_optimization;
# Task 2: Delivery Delay Analysis
# Subtask 1: Calculate delivery delay (in days) for each orde
# Create New Column
ALTER TABLE orders_table ADD COLUMN Delivery_Delay_Days INT;
# Calculate Delivery Delay in Days
UPDATE orders_table
SET Delivery_Delay_Days = DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date);
# Table View
SELECT * FROM orders_table;

# Subtask 2: Find Top 10 delayed routes based on average delay days.
SELECT r.Route_ID, r.Start_Location,r.End_Location,
    ROUND(AVG(o.Delivery_Delay_Days), 2) AS Avg_Delay_Days,
    COUNT(o.Order_ID) AS Total_Orders
FROM orders_table o
INNER JOIN routes_table r ON o.Route_ID = r.Route_ID
WHERE o.Delivery_Delay_Days > 0
GROUP BY r.Route_ID, r.Start_Location, r.End_Location
ORDER BY Avg_Delay_Days DESC
LIMIT 10;

# Subtask 3: Use window functions to rank all orders by delay within each warehouse.
SELECT * , RANK() OVER (PARTITION BY Warehouse_ID 
						ORDER BY Delivery_Delay_Days) AS Delay_Rank
FROM orders_table;


