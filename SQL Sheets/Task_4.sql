USE amazon_logistics_optimization;
# Task 4: Warehouse Performance
# Subtask 1: Find the top 3 warehouses with the highest average processing time.
SELECT 
    Warehouse_ID,
    Location,
    ROUND(AVG(Processing_Time_Min), 2) AS Avg_Processing_Time_Min
FROM warehouses_table
GROUP BY Warehouse_ID, Location
ORDER BY Avg_Processing_Time_Min DESC
LIMIT 3;

# Subtask 2: Calculate total vs. delayed shipments for each warehouse.
SELECT 
    w.Warehouse_ID,
    w.Location,
    COUNT(o.Order_ID) AS Total_Shipments,
    SUM(CASE WHEN o.Delivery_Delay_Days > 0 THEN 1 ELSE 0 END) AS Delayed_Shipments
FROM warehouses_table w
JOIN orders_table o ON w.Warehouse_ID = o.Warehouse_ID
GROUP BY w.Warehouse_ID, w.Location;


# Subtask 3: Use CTEs to find bottleneck warehouses where processing time > global average.
WITH AvgProcessing AS (
    SELECT 
    AVG(Processing_Time_Min) AS Global_Avg_Processing_Time
    FROM warehouses_table
)
SELECT 
    w.Warehouse_ID,
    w.Location,
    w.Processing_Time_Min,
    a.Global_Avg_Processing_Time,
    CASE 
        WHEN w.Processing_Time_Min > a.Global_Avg_Processing_Time THEN 'Bottleneck'
        ELSE 'Normal'
    END AS Warehouse_Status
FROM warehouses_table w
JOIN AvgProcessing a
ORDER BY w.Processing_Time_Min DESC;

# Subtask 4: Rank warehouses based on on-time delivery percentage.
SELECT 
    w.Warehouse_ID,
    w.Location,
    ROUND((SUM(CASE WHEN o.Delivery_Status = 'On Time' THEN 1 ELSE 0 END) * 100) / COUNT(*), 2) AS OnTime_Percentage,
    RANK() OVER (ORDER BY (SUM(CASE WHEN o.Delivery_Status = 'On Time' THEN 1 ELSE 0 END) * 100 / COUNT(*)) DESC) 
				 AS Performance_Rank
FROM warehouses_table w
JOIN orders_table o ON w.Warehouse_ID = o.Warehouse_ID
GROUP BY w.Warehouse_ID, w.Location
ORDER BY OnTime_Percentage DESC;
