USE amazon_logistics_optimization;
# Task 1: Data Cleaning & Preparation
# Subtask 1: Identify and delete duplicate Order_ID records.
SELECT Order_ID, COUNT(*) AS duplicate_count
FROM orders_table
GROUP BY Order_ID
HAVING COUNT(*) > 1;

# Subtask 2: Replace null Traffic_Delay_Min with the average delay for that route.
SELECT Route_ID, COUNT(*) AS null_count
FROM routes_table
WHERE Traffic_Delay_Min IS NULL
GROUP BY Route_ID;

# Subtask 3: Convert all date columns into YYYY-MM-DD format using SQL functions.
-- For orders_table
UPDATE orders_table
SET Order_Date = STR_TO_DATE(Order_Date, '%Y-%m-%d'),
    Expected_Delivery_Date = STR_TO_DATE(Expected_Delivery_Date, '%Y-%m-%d'),
    Actual_Delivery_Date = STR_TO_DATE(Actual_Delivery_Date, '%Y-%m-%d');    
-- For shipment_tracking_table
UPDATE shipment_tracking_table
SET Checkpoint_Time = STR_TO_DATE(checkpoint_Time,'%Y-%m-%d');

# Subtask 4:  Ensure that no Actual_Delivery_Date is before Order_Date (flag such records).
SELECT Order_ID, Order_Date, Actual_Delivery_Date
FROM orders_table
WHERE Actual_Delivery_Date < Order_Date;
