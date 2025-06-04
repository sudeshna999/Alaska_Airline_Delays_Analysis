# alaska-airlines-delay-analysis-dashboard-PowerBI_MySQL

This project presents a Power BI dashboard built on a comprehensive flight delay dataset focused on Alaska Airlines. It analyzes performance patterns across airports, identifies root causes of delays, tracks seasonal impacts, and recommends data-driven strategies to enhance punctuality and operational efficiency.

Using advanced MySQL queries and interactive Power BI reports, the dashboard delivers actionable insights on delay sources, high-risk terminals, and improvement opportunities.

---

## Tech Stack

- **MySQL** for querying and aggregating raw flight data  
- **SQL** concepts: CTEs, window functions, and conditional aggregations  
- **Power BI Desktop** – Dashboard development and design  
- **Power Query** – Data transformation and modeling  
- **DAX** – Custom KPIs and calculated measures  
- **GitHub** – Version control and documentation

---

## Features

- **Airport-wise Delay Trends**: Compare total and average delay times across airports.  
- **Monthly Delay Patterns**: Identify seasonal spikes in delays due to holidays and weather.  
- **Root Cause Breakdown**: Analyze delay causes (Late Aircraft, Carrier, NAS, Weather, Security).  
- **Worst vs Best Airports**: Highlight airports with the highest average delay per flight and cancellation rates.  
- **Performance Summary**: Showcase airports with strong on-time performance for benchmarking.  
- **Actionable Recommendations**: Suggested solutions for each delay driver or underperforming terminal.

---

## Business Problem

Flight delays significantly impact airline revenue, customer satisfaction, and resource planning. Alaska Airlines, like many carriers, faces challenges such as:

- Persistent delays at specific high-traffic airports  
- Poor performance during winter months and holiday travel  
- Aircraft unavailability and inefficient turnaround times  
- High cancellation rates in remote or weather-sensitive locations  
- Lack of clarity on root causes and airport-specific bottlenecks  

This dashboard helps identify and address these issues using real operational data.

---

## Solution & Approach

To address the above challenges, this project combines SQL-based data analysis with Power BI dashboards. The approach includes:

- Tracking delay time trends at airport, monthly, and national levels  
- Breaking down delays by cause and correlating them with external conditions  
- Identifying airports with chronic delay issues vs. best-in-class performers  
- Using conditional logic and ranking to show delay contributors and outliers  
- Providing solutions based on insights drawn from delay behavior patterns

---

## Overview of Outputs

##### Delay Trends by Airport (Total Minutes)

Output:
> Dallas Fort Worth and Chicago O'Hare top the list with over 1 million minutes of delays.

##### Monthly Delay Patterns

Output:
> Delay spikes in January and November indicate winter weather and holiday demand impact.

##### Reason-wise Breakdown of Delays

Output:
> Late Aircraft (66.85%) is the top cause, followed by Carrier (21.63%) and NAS (9.69%).

##### Highest Delay per Flight

Output:
> Marquette Sawyer Regional Airport has the worst performance with 89 minutes average delay.

##### Best Performing Airports

Output:
> Mobile Downtown and Pitt-Greenville achieved 100% on-time arrivals.

##### Cancellation Trends

Output:
> Mammoth Yosemite has the highest cancellation rate at 30.56%.

---

##  Dashboard Snips

![image](https://github.com/user-attachments/assets/adf79ba5-ad9a-4586-8c63-3dd70a747ce5)

![image](https://github.com/user-attachments/assets/55bb149d-1715-4bae-b86b-90c6b476e574)

![image](https://github.com/user-attachments/assets/cec8c7a4-b35a-4464-984b-78d678eb61ac)

![image](https://github.com/user-attachments/assets/d372e996-1e7f-4d6b-8b27-9b0afe990e40)

summary
![image](https://github.com/user-attachments/assets/696473b6-b627-4c09-94be-1b90dab2e382)





##  Dashboard Views

- **Overview Page**: Monthly delay trends, total delay time per airport  
- **Delay Reason Analysis**: Pie charts and airport-wise breakdown of delay causes  
- **Performance Summary**: Best/worst airports, average delays per flight, and cancellations  
- **Heatmap View**: Monthly color-coded delay trends across airports  
- **Solutions Section**: Insights and recommendations beside each visual

---

## Project Workflow

1. **Data Collection**  
   - Flight delay dataset from fp20Analytics

2. **SQL Data Analysis**  
   - Extracted trends, ranked airports, and calculated average delay metrics

3. **Data Transformation**  
   - Cleaned and shaped in Power Query (Power BI)  
   - Created DAX measures for KPIs and percentages

4. **Dashboard Development**  
   - Multi-page layout with structured story flow  
   - Used slicers for month, airport, and delay reason

5. **Insights & Recommendations**  
   - Each chart is accompanied by key takeaways and improvement suggestions

---

## Key Analysis Questions

- Which airports contribute most to delays in Alaska Airlines operations?  
- What are the top reasons behind delays and how do they vary monthly?  
- Which airports maintain strong performance despite traffic/weather constraints?  
- How can delay-prone terminals be optimized for better on-time performance?  
- What can be learned from airports with zero delays or cancellations?

---

### Overview Dashboard  
- Monthly trends in delay minutes  
- Top 5 delay-heavy airports  
- Seasonal performance variation

### Delay Reason Dashboard  
- Share of delay causes: Late Aircraft, Carrier, NAS, etc.  
- Monthly breakdown of Late Aircraft trends  
- Airport-specific cause patterns

### Performance Summary  
- Airports with highest average delay per flight  
- Airports with high on-time performance  
- Cancellation rate comparison  
- Insights and suggested solutions

---

## Sample DAX Measures

```DAX
Total Delay Minutes = SUM(Delays[Delay_Minutes])
Average Delay per Flight = AVERAGE(Delays[Delay_Minutes])
Late Aircraft % = DIVIDE([Late Aircraft Delay], [Total Delay Minutes], 0)
```

## Sample Insights
- 66.85% of all delay minutes are due to aircraft unavailability or late arrival.
- Chicago O’Hare faces delays across almost all months—indicating structural challenges.
- Mobile Downtown and Pitt-Greenville serve as high-performance benchmarks with 0 delays.
- Delay minutes peak in January and November—likely tied to snow and festive travel.

### Limitations
- Data only reflects Alaska Airlines—not an industry-wide comparison.
- No cost-based data is included (fuel cost, crew overtime, etc.).
- Weather impact is implied by season, not directly mapped from weather APIs.
- Forecasting models are not implemented in this version.



## Repository Structure

- `.sql` — Contains all SQL scripts for data analysis and queries.
- `README.md` — Project overview and documentation.
- `dataset` — Folder for sample or raw data files.
- `.pdf` - powerbi report in pdf
- `.pbix`- visualizations

---

## Author
### — Sudeshna Dey
###  — Contact & Contributions

####  Email: sudeshnadey1000@gmail.com
####  LinkedIn: https://www.linkedin.com/in/sudeshna-dey-724a811a0/
 Have feedback or suggestions? I'm always open to improving and collaborating!
 
If you find this project helpful:
Give it a star
Thanks for visiting — and happy data analyzing!
