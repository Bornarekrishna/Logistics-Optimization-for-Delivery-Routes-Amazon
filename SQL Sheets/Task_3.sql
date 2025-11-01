USE amazon_logistics_optimization;
# Task 3: Route Optimization Insights
# Subtask 1: For each route, calculate:
 				-- Average delivery time (in days).
				-- Average traffic delay.
				-- Distance-to-time efficiency ratio: Distance_KM / Average_Travel_Time_Min.
# Average delivery time (in days).
SELECT r.Route_ID, r.Start_Location, r.End_Location,
    ROUND(AVG(DATEDIFF(o.Actual_Delivery_Date, o.Order_Date)),2) AS Avg_Delivery_Time_Days
FROM routes_table r
INNER JOIN orders_table o ON r.Route_ID = o.Route_ID
GROUP BY 1 , 2 , 3;

# Average traffic delay.
SELECT Route_ID, Start_Location, End_Location,
	ROUND(AVG(Traffic_Delay_Min),2) AS Avg_Traffic_Delay_Min
FROM routes_table
GROUP BY 1,2,3;
    
# Distance-to-time efficiency ratio: Distance_KM / Average_Travel_Time_Min.
# Create New Column
ALTER TABLE routes_table ADD COLUMN Efficiency_Ratio DECIMAL(10,4);
# Calculate the Efficiency Ratio
UPDATE routes_table
SET Efficiency_Ratio = ROUND(Distance_KM / Average_Travel_Time_Min, 4);
# Check the result
SELECT Route_ID, Distance_KM, Average_Travel_Time_Min, 
	Efficiency_Ratio
FROM routes_table
ORDER BY Efficiency_Ratio DESC;

# Subtask 2: Identify 3 routes with the worst efficiency ratio.
SELECT * FROM routes_table
ORDER BY Efficiency_Ratio DESC
LIMIT 3;

# Subtask 3: Find routes with >20% delayed shipments.
SELECT 
    o.Route_ID,
    r.Start_Location,
    r.End_Location,
	ROUND(SUM(CASE WHEN o.Delivery_Delay_Days > 0 THEN 1 ELSE 0 END)  * 100 / COUNT(*), 2)
			  AS Delay_Shipment_Percentage
FROM orders_table o
JOIN routes_table r ON o.Route_ID = r.Route_ID
GROUP BY o.Route_ID, r.Start_Location, r.End_Location
HAVING SUM(CASE WHEN o.Delivery_Delay_Days > 0 THEN 1 ELSE 0 END)  * 100 / COUNT(*) > 0.20
ORDER BY Delay_Shipment_Percentage DESC
limit 10;

# Subtask 4: Recommend potential routes for optimization.
SELECT 
    r.Route_ID,
    r.Start_Location,
    r.End_Location,
    ROUND(AVG(DATEDIFF(o.Actual_Delivery_Date, o.Order_Date)), 2) AS Avg_Delivery_Time_Days,
    ROUND(AVG(r.Traffic_Delay_Min), 2) AS Avg_Traffic_Delay_Min,
    ROUND(SUM(CASE WHEN o.Delivery_Delay_Days > 0 THEN 1 ELSE 0 END) * 100 / COUNT(*), 2)
			  AS Delay_Shipment_Percentage,
	r.Efficiency_Ratio
FROM orders_table o
JOIN routes_table r ON o.Route_ID = r.Route_ID
GROUP BY r.Route_ID, r.Start_Location, r.End_Location,r.Efficiency_Ratio
ORDER BY Delay_Shipment_Percentage DESC, Efficiency_Ratio ASC;
