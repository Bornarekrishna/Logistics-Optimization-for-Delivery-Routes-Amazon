USE amazon_logistics_optimization;
# Task 6: Shipment Tracking Analytics 
# Subtask 1: For each order, list the last checkpoint and time
SELECT 
    Order_ID,
    MAX(Checkpoint) AS Last_Checkpoint,
    MAX(Checkpoint_Time) AS Last_Checkpoint_Time
FROM shipment_tracking_table 
GROUP BY Order_ID
ORDER BY Order_ID;

# Subtask 2: Find the most common delay reasons (excluding None).
SELECT 
    Delay_Reason,
    COUNT(Order_ID) AS Frequency
FROM shipment_tracking_table
WHERE Delay_Reason <> 'None'
GROUP BY Delay_Reason
ORDER BY Frequency DESC;

# Subtask 3: Identify orders with >2 delayed checkpoints.
SELECT 
    Order_ID,
    COUNT(Checkpoint) AS Delayed_Checkpoint_Count
FROM shipment_tracking_table
WHERE Delay_Reason <> 'None'
GROUP BY Order_ID
HAVING COUNT(Checkpoint) > 2
ORDER BY Delayed_Checkpoint_Count DESC;


