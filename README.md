# Logistics-Optimization-for-Delivery-Routes-Amazon
---

## **Project Overview**

This project was completed as part of the **Internshala Data Science Training Program**, focusing on optimizing **Amazon’s logistics network** through SQL-based analysis.

Amazon’s massive delivery network faces challenges in route delays, warehouse inefficiencies, and shipment disruptions. This project leverages **relational databases and analytical SQL** to uncover performance issues, identify delay patterns, and recommend operational improvements.

---

## **Project Objective**

To build a **data-driven logistics analytics system** using SQL that:
- Detects and analyzes delivery delays  
- Optimizes routes for speed and reliability  
- Evaluates warehouse and delivery agent performance  
- Enhances shipment tracking and transparency  
- Produces actionable insights for decision-makers  

---

## **Dataset Description**

The project utilizes five interlinked datasets:

| Table | Description |
|--------|--------------|
| **Orders** | Order details, delivery timelines, and statuses |
| **Routes** | Route start & end locations, distances, travel times, and traffic delays |
| **Warehouses** | Warehouse processing time and dispatch information |
| **DeliveryAgents** | Agent speed, shift hours, and on-time performance |
| **ShipmentTracking** | Checkpoints, timestamps, and delay reasons during shipment |

---

## **Task-by-Task Summary & Insights**

### **Task 1: Data Cleaning & Preparation**
**Goal:** Ensure high data quality by removing duplicates, replacing null values, standardizing dates, and flagging invalid records.  
**Result:** Clean, validated datasets ready for advanced analytics.

---

### **Task 2: Delivery Delay Analysis**
**Goal:** Measure and understand delivery delays per route and warehouse.  
**SQL Techniques:** `DATEDIFF()`, `AVG()`, `RANK()`

**Insights:**
- Calculated delivery delay days per order  
- Identified top 10 delayed routes  
- Ranked orders by delay within each warehouse  

**Finding:** Certain routes experienced consistent 3–5 day delays — primarily due to traffic and warehouse lag.

---

### **Task 3: Route Optimization Insights**
**Goal:** Evaluate route efficiency and traffic impact.  
**SQL Techniques:** `JOIN`, `GROUP BY`, `CASE`, `CTE`

**Insights:**
- Computed average delivery time and traffic delay per route  
- Calculated efficiency ratio = `Distance / Average_Travel_Time`  
- Identified top 3 inefficient routes  
- Highlighted routes with >20% delayed shipments  

**Finding:** Routes **R020 and R017** had the highest delay percentages and lowest efficiency → need route redesign and traffic optimization.

---

### **Task 4: Warehouse Performance**
**Goal:** Assess which warehouses cause delivery bottlenecks.  
**SQL Techniques:** `CTE`, `AVG()`, `CASE`, `RANK()`

**Insights:**
- Top 3 warehouses had the longest processing times  
- Found bottleneck warehouses (processing > global average)  
- Ranked warehouses by on-time shipment rate  

**Finding:** Two warehouses consistently exceeded average processing time → resource optimization recommended.

---

### **Task 5: Delivery Agent Performance**
**Goal:** Analyze agent efficiency and delivery discipline.  
**SQL Techniques:** `RANK() OVER()`, `CASE`, `SUBQUERIES`

**Insights:**
- Ranked agents by route based on on-time %  
- Identified agents with <80% on-time performance  
- Compared top vs bottom 5 agent speeds  

**Finding:** Strong positive correlation between **average speed** and **on-time delivery** — training for low-speed agents advised.

---

### **Task 6: Shipment Tracking Analytics**
**Goal:** Examine checkpoint-level delays and shipment flow.  
**SQL Techniques:** `MAX()`, `HAVING`, `JOIN`

**Insights:**
- Extracted last checkpoint and timestamp for each order  
- Found most common delay reasons (Traffic, Weather, Warehouse)  
- Listed orders with >2 delayed checkpoints  

**Finding:** “Traffic Congestion” and “Warehouse Processing” were the two most frequent delay causes.

---

### **Task 7: Advanced KPI Reporting**
**Goal:** Develop executive-level KPIs for overall logistics performance.  
**SQL Techniques:** Aggregations, Conditional Logic, Joins  

**KPIs Generated:**
| KPI | Description |
|-----|--------------|
| **Avg Delivery Delay / Region** | Average days delayed by starting region |
| **On-Time Delivery %** | Overall reliability measure |
| **Avg Traffic Delay / Route** | Identifies congestion-prone routes |

**Finding:**  
- **Delhi region** showed highest average delays.  
- **Chennai region** demonstrated top consistency and efficiency.

---

## **Key Outcomes & Recommendations**

| Area | Recommendation |
|-------|----------------|
| High-delay routes | Re-map delivery paths & schedule dynamic dispatches |
| Warehouse bottlenecks | Implement workflow automation & staff balancing |
| Agent performance | Provide targeted speed and time management training |
| Traffic-prone routes | Introduce AI-based rerouting and time-slot optimization |
| Regional operations | Use high-performing regions as standardization models |

---

## **Technologies & Tools Used**

| Category | Tools / Concepts |
|-----------|-----------------|
| Database | MySQL |
| Data Analysis | SQL Queries, Aggregations, Window Functions |
| Reporting | PPT + 5-Minute Video Summary |
| Skills | Data Cleaning, KPI Design, Route Optimization, Analytical SQL |

---

## **Conclusion**

This project strengthened my expertise in data analytics, SQL-based performance measurement, and logistics optimization.  
By identifying bottlenecks, quantifying performance metrics, and suggesting improvements, I demonstrated how **data science empowers business efficiency** in real-world supply chain systems.

---
