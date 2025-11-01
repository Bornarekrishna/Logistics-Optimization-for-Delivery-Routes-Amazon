USE amazon_logistics_optimization;
# Task 5: Delivery Agent Performance
# Subtask 1: Rank agents (per route) by on-time delivery percentage
SELECT 
	Agent_ID,
    Route_ID, 
    On_Time_Percentage,
    RANK() OVER (PARTITION BY Route_ID ORDER BY On_Time_Percentage DESC ) AS Rank_In_Agent
FROM delivery_agents_table
ORDER BY Route_ID, Rank_In_Agent;
    
# Subtask 2: Find agents with on-time % < 80%.
SELECT *
FROM delivery_agents_table
WHERE On_Time_Percentage < 80
ORDER BY On_Time_Percentage;

# Subtask 3: Compare average speed of top 5 vs bottom 5 agents using subqueries.
SELECT 
    (SELECT 
	 ROUND(AVG(Avg_Speed_KM_HR), 2)
     FROM delivery_agents_table
     ORDER BY On_Time_Percentage DESC
     LIMIT 5) AS Top5_AvgSpeed,
     
    (SELECT 
	 ROUND(AVG(Avg_Speed_KM_HR), 2)
     FROM delivery_agents_table
     ORDER BY On_Time_Percentage ASC
     LIMIT 5) AS Bottom5_AvgSpeed;
