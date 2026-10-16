 E-commerce Customer Journey & Cart Abandonment Analytics

Project Overview

This project focuses on understanding how customers interact with an e-commerce website, from their first visit to making a purchase. The main aim is to identify where customers drop off during their shopping journey, which factors are associated with cart abandonment, and how businesses can improve their conversion rate.

I worked on this project using Excel, MySQL, Power BI, and Tableau. Each tool was used for a different part of the analysis, from preparing the data to presenting the findings through dashboards and visualizations.

Business Objectives

The project answers the following business questions:

- How many shopping sessions result in a purchase?
- What is the overall conversion rate?
- At which stage of the customer journey do most sessions drop off?
- How does conversion performance vary across devices and referral sources?
- During which hours and days do customers show better conversion performance?
- How many shopping sessions end without a purchase despite having items in the cart?
- How are cart abandonment patterns related to device type, country, engagement level, and cart size?
- What actions could help improve the customer journey and reduce lost sales opportunities?

Dataset:

The dataset contains e-commerce customer journey and shopping session information, including page visits, device types, referral sources, time spent on pages, cart activity, and purchase status.

Dataset details:
- Total records in the raw Excel sheet: 12,720
- Unique shopping sessions in the analysis: 5,000
- Unique customers identified in the analysis: 1,872
- Purchases recorded in the analysis: 1,010


 Tools & Technologies

Microsoft Excel: Data cleaning, calculated columns, data validation, and preliminary analysis.
MySQL: Data validation and SQL queries for customer journey, conversion, and cart abandonment analysis.
Power BI: Interactive dashboards, KPI cards, charts, slicers, and business insights.
Tableau: Worksheets, dashboards, and a story presenting customer behavior and business recommendations.
GitHub: Project documentation, SQL scripts, datasets, and portfolio presentation
 
Project Workflow

 1. Data Cleaning and Preparation — Excel
Inspected the raw dataset and prepared a cleaned dataset.
Worked with date and time fields and customer activity variables.
Created supporting calculations and a data dictionary.
Calculated key metrics and prepared customer journey funnel summaries.
Organized the data for SQL analysis and visualization.

 2. MySQL — Data Analysis
SQL was used to validate the dataset and analyze customer behavior.
Key analysis areas included:
Data validation and session-level aggregation.
Customer journey stage distribution.
Overall purchase conversion rate.
Conversion by device type and referral source.
Hourly and day-wise conversion trends.
Cart abandonment by device, referral source, country, and engagement level.
Relationship between items in the cart, time spent, and purchase outcomes.

SQL techniques included filtering, grouping, aggregate functions, conditional logic, distinct counts, and analytical queries.

3. Power BI — Interactive Dashboard Development

The Power BI report is organized into three analytical pages.

Page 1: Executive Overview

Total sessions
Purchase sessions
Overall conversion rate
Cart abandonment rate
Customer journey funnel
Conversion by device type
Conversion by referral source
Hourly conversion trend

Page 2: Cart Abandonment Analysis

Abandoned sessions
Cart abandonment rate
Abandonment by device type
Abandonment by referral source and country
Cart size and customer engagement patterns
Time and purchase outcome analysis
Relevant filters for exploring customer behavior

Page 3: Conversion Analysis & Business Insights

Deeper analysis of customer conversion patterns
Device and referral performance
Customer journey and time-based trends
Key business findings and recommendations

DAX measures were used for KPI calculations, and interactive filters help explore the data from different perspectives.

4. Tableau — Customer Journey Storytelling

Tableau is used to explore the customer journey from a different analytical perspective rather than simply duplicating the Power BI report.

The Tableau work includes:
Customer journey and stage analysis.
Customer engagement analysis.
Session-level journey detail.
Supporting dashboards.
A Tableau story connecting the findings and business recommendations.

The story emphasizes how customers interact with the online store, where friction may occur, and which areas deserve further investigation.

Preliminary Observations
Conversion opportunity: 1,010 out of 5,000 sessions resulted in purchases, giving an overall funnel conversion rate of 20.2%.
Consideration-to-cart drop-off: The funnel decreases from 3,987 consideration sessions to 1,599 cart-stage sessions, making this an important area to investigate.
Cart-to-checkout drop-off: The number of sessions decreases from 1,599 at the cart stage to 1,123 at checkout.
Checkout completion: 1,010 of the 1,123 checkout sessions resulted in purchases.
Segmentation opportunity: Device type, referral source, customer engagement, and time-based trends can help identify where conversion improvements may have the greatest impact.

These observations describe the overall funnel. The device, referral, country, and time-based findings should be interpreted using their respective dashboard results and filters.

Business Recommendations

1.Improve the transition from consideration to cart: Review product information, pricing clarity, product availability, and calls to action.
2.Reduce cart abandonment: Examine the cart and checkout experience, including unexpected costs, unnecessary steps, and payment friction.
3.Optimize the mobile experience: Compare mobile, desktop, and tablet conversion rates before prioritizing device-specific improvements.
4.Evaluate marketing channels: Compare conversion rates across referral sources rather than relying on session volume alone.
5.Use time-based insights: Investigate periods with stronger or weaker conversion and align marketing and support activities accordingly.
6.Monitor performance regularly: Track conversion rate, cart abandonment rate, and funnel drop-offs to evaluate whether improvements are working.

These are recommended actions to investigate and test; they are not claims that the dataset proves a particular cause of abandonment.

Project Folder Structure

The repository is organized to keep the files for each stage of the project easy to locate.

ecommerce-customer-journey-cart-abandonment-analytics/
│
├── README.md
│
├── data/
│   ├── ecommerce _cleam(2).csv
│        
│
├── excel/
│   ├── Ecommerce_Customer_Journey_project.xlsx
│   
│
├── SQL/
│   ├── 01_data_setup.sql
|   ├── 02_data_validation.SQL
│   ├── 03_customer_journey_analysis.SQL
│   ├── 04_cart_abandonment_analysis.SQL
│   └── 05_conversion_analysis.sql
│
├── Power bi/
│   └── Ecommerce_ Customer_ Journey_ Analytics.PBIX
│
└── Tableau/
|        └── Ecommerce_ customer_ journey_ story_ TWBX
│
│
├── Images
      └──Cart abandonment analysis power bi.PNG
      └─executive overview (power bi).PNG
      └── Screenshot conversion analysis.PNG
      └──Screenshot SQL customer journey.PNG
      └──Tableau dashboard.PNG


Skills Demonstrated

Data cleaning and preparation
Exploratory data analysis
Excel formulas and KPI calculations
SQL querying and aggregation
Customer journey and funnel analysis
Conversion and cart abandonment analysis
Power BI dashboard design and DAX
Tableau dashboard development and storytelling
Business insight generation
Data-driven decision support
Project documentation using GitHub

Conclusion

This project demonstrates an end-to-end data analytics workflow using Excel, MySQL, Power BI, and Tableau. It transforms raw e-commerce activity data into structured analysis, interactive dashboards, and business recommendations.                                                                                     
                                                                                                                                                                     The objective is to help an e-commerce business understand its customer journey, identify potential conversion barriers, investigate cart abandonment, and make more informed decisions to improve the shopping experience.

Note: This is an analytical portfolio project. The findings reflect the available dataset and do not establish causal relationships without further testing.

Tools: Excel | MySQL | Power BI | Tableau | GitHub
