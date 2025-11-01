USE amazon_logistics_optimization;
# Task 7: Advanced KPI Reporting
# Calculate KPIs using SQL queries:
# Subtask 1: Average Delivery Delay per Region (Start_Location).
SELECT 
	r.Start_Location AS Region,
    ROUND(AVG(o.Delivery_Delay_Days),2) AS Avg_Delivery_Delay_Days,
    COUNT(o.Order_ID) AS Total_orders
FROM orders_table o
INNER JOIN routes_table r
ON o.Route_ID  = r.Route_ID 
GROUP BY Region
ORDER BY Avg_Delivery_Delay_Days DESC;


# Subtask 2: On-Time Delivery % = (Total On-Time Deliveries / Total Deliveries) * 100.
SELECT 
    ROUND((SUM(CASE WHEN Delivery_Delay_Days <= 0 THEN 1 ELSE 0 END)) / COUNT(*) * 100, 2) 
		   AS OnTime_Delivery_Percentage
FROM orders_table;

# Subtask 3: Average Traffic Delay per Route.
SELECT 
    Route_ID,
    Start_Location,
    End_Location,
    ROUND(AVG(Traffic_Delay_Min), 2) AS Avg_Traffic_Delay_Min
FROM routes_table
GROUP BY Route_ID, Start_Location, End_Location
ORDER BY Avg_Traffic_Delay_Min DESC;



