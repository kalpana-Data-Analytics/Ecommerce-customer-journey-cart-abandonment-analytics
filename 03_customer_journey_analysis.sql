--- =====================================================
--- CUSTOMER JOURNEY ANALYSIS
--- =====================================================

--- =====================================================
--- SECTION 1 — OVERALL CUSTOMER JOURNEY
--- =====================================================
--- Q1. How many unique customer sessions are present in the dataset?
--- Business Purpose: Establish the total number of customer sessions available for analysis.
SELECT COUNT(DISTINCT SessionID) AS total_sessions FROM ecommerce_data;

--- Q2. How many sessions resulted in a purchase?
--- Business Purpose: Measure the number of sessions that successfully converted into customers.
SELECT COUNT(DISTINCT SessionID) AS purchasing_sessions FROM ecommerce_data WHERE Purchased = 1;

--- Q3. What is the overall session-to-purchase conversion rate?
--- Business Purpose: Measure how effectively customer sessions convert into purchases.
select COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) AS purchasing_sessions,
COUNT(DISTINCT SessionID) AS total_sessions,
ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) 
* 100.0/ COUNT(DISTINCT SessionID),2) AS conversion_rate_pct FROM ecommerce_data;

--- Q4. How are customer sessions distributed across the different journey stages?
--- Business Purpose: Understand where customers are positioned within the customer journey.
SELECT JourneyStage,COUNT(DISTINCT SessionID) AS sessions
FROM ecommerce_data
GROUP BY JourneyStage
ORDER BY sessions DESC;

--- =====================================================
--- SECTION 2 — CUSTOMER JOURNEY FUNNEL & DROP-OFF
--- =====================================================
--- Q5. How many unique sessions reached each major customer journey stage?
--- Business Purpose: Build the core customer journey funnel.
SELECT COUNT(DISTINCT SessionID) AS all_sessions,
COUNT(DISTINCT CASE WHEN JourneyStage IN ('consideration', 'checkout', 'cart', 'conversion')
THEN SessionID END) AS product_view_sessions,
COUNT(DISTINCT CASE WHEN JourneyStage IN ('cart', 'conversion')
THEN SessionID END) AS add_to_cart_sessions,
COUNT(DISTINCT CASE WHEN Purchased = 1
THEN SessionID END) AS purchase_sessions
FROM ecommerce_data;

---- Q7. What percentage of cart sessions converted into purchases?
--- Business Purpose: Measure checkout/purchase effectiveness and identify potential cart abandonment.
SELECT COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) AS purchase_sessions,
COUNT(DISTINCT CASE WHEN JourneyStage IN ('cart', 'conversion') THEN SessionID END) AS cart_sessions,
ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) * 100.0 /
COUNT(DISTINCT CASE WHEN JourneyStage IN ('cart', 'conversion') THEN SessionID END),2)
 AS cart_to_purchase_rate_pct FROM ecommerce_data;
 
 ---- =====================================================
--- SECTION 3 — DEVICE ANALYSIS
--- =====================================================
--- Q8. How many sessions and purchases come from each device type?
--- Business Purpose: Compare customer activity and purchasing behavior across devices.
SELECT DeviceType,COUNT(DISTINCT SessionID) AS sessions,
COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) AS purchases FROM ecommerce_data
GROUP BY DeviceType ORDER BY sessions DESC;

--- Q9. Which device type has the highest purchase  conversion rate?
--- Business Purpose: Identify which device provides the strongest  customer-to-purchase performance.
SELECT DeviceType,COUNT(DISTINCT SessionID) AS sessions,
COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) AS purchases,
ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END)
 * 100.0/ COUNT(DISTINCT SessionID),2) AS conversion_rate_pct
FROM ecommerce_data GROUP BY DeviceType ORDER BY conversion_rate_pct DESC;

--- Q10. How does customer journey stage distribution differ across devices?
--- Business Purpose: Identify whether customers behave differently across mobile, desktop and tablet.
SELECT  DeviceType, JourneyStage,COUNT(DISTINCT SessionID) AS sessions FROM ecommerce_data
GROUP BY DeviceType,JourneyStage ORDER BY DeviceType, sessions DESC;

--- =====================================================
--- SECTION 4 — REFERRAL SOURCE ANALYSIS
--- =====================================================
--- Q11. Which referral sources generate the most purchases and have the highest conversion rate?
--- Business Purpose: Identify referral sources that generate valuable converting traffic rather than just high traffic.
SELECT ReferralSource,COUNT(DISTINCT SessionID) AS sessions,
COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) AS purchases,
ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) * 100.0 /
COUNT(DISTINCT SessionID),2) AS conversion_rate_pct FROM ecommerce_data
GROUP BY ReferralSource ORDER BY conversion_rate_pct DESC;

--- =====================================================
--- SECTION 5 — TIME-BASED CUSTOMER JOURNEY ANALYSIS
--- =====================================================
--- Q12. Which day of the week generates the most purchasing sessions?
--- Business Purpose: Identify the strongest days for customer conversion.
SELECT DayOfWeek,COUNT(DISTINCT SessionID) AS sessions, COUNT(DISTINCT CASE WHEN Purchased = 1
THEN SessionID END) AS purchases,ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1
THEN SessionID END) * 100.0 / COUNT(DISTINCT SessionID),2) AS conversion_rate_pct FROM ecommerce_data
GROUP BY DayOfWeek ORDER BY conversion_rate_pct DESC;

--- Q13. Which hours of the day have the highest  number of purchasing sessions?
--- Business Purpose: Identify peak purchasing hours and potential opportunities for time-based marketing.
SELECT Hour,COUNT(DISTINCT SessionID) AS sessions,
COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) AS purchases,
ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) * 100.0 / COUNT(DISTINCT SessionID),2)
 AS conversion_rate_pct FROM ecommerce_data GROUP BY Hour ORDER BY Hour;
 
 --- Q14. Which months generate the highest number of purchasing sessions?
--- Business Purpose: Identify monthly patterns in customer purchasing  behavior.
SELECT MonthNumber,Month,COUNT(DISTINCT SessionID) AS sessions,
COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) AS purchases,
ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) * 100.0 / COUNT(DISTINCT SessionID),2)
 AS conversion_rate_pct FROM ecommerce_data
GROUP BY MonthNumber, Month ORDER BY MonthNumber;

--- Q15. At which customer journey stage do customers spend the most time?
--- Business Purpose: Understand customer engagement and identify stages where customers may experience friction.
SELECT JourneyStage,ROUND(AVG(TimeOnPage_seconds), 2) AS avg_time_on_page_seconds,
ROUND(MAX(TimeOnPage_seconds), 2) AS max_time_on_page_seconds FROM ecommerce_data
GROUP BY JourneyStage ORDER BY avg_time_on_page_seconds DESC;