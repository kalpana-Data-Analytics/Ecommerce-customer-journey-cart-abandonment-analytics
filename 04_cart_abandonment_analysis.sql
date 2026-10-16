--- ==========================================================
--- E-COMMERCE CUSTOMER JOURNEY & CART ABANDONMENT ANALYSIS
--- File: 04_cart_abandonment_analysis.sql
--- ==========================================================
--- ==========================================================
--- SECTION 1: OVERALL CART ABANDONMENT
--- ==========================================================
--- Q1. How many sessions resulted in cart abandonment?
--- Business Purpose: Measure the total number of sessions where customers  added items to cart but did not complete the purchase.
SELECT COUNT(DISTINCT SessionID) AS abandoned_sessions FROM ecommerce_data WHERE AbandonedCart = 1;

--- Q2. What is the overall cart abandonment rate?
--- Business Purpose: Measure the percentage of sessions that resulted in cart abandonment.
SELECT COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) * 100.0/ COUNT(DISTINCT SessionID) AS abandonment_rate
FROM ecommerce_data;

--- Q3. How many sessions were abandoned versus purchased?
--- Business Purpose: Compare successful purchases with abandoned carts.
SELECT CASE
WHEN AbandonedCart = 1 THEN 'Abandoned'
WHEN Purchased = 1 THEN 'Purchased' ELSE 'Other' END AS session_status,
COUNT(DISTINCT SessionID) AS sessions FROM ecommerce_data
GROUP BY CASE WHEN AbandonedCart = 1 THEN 'Abandoned' WHEN Purchased = 1 THEN 'Purchased' ELSE 'Other'
END;
--- ==========================================================
--- SECTION 2: ABANDONMENT BY CUSTOMER CHARACTERISTICS
--- ==========================================================

--- Q4. Which device has the highest cart abandonment?
--- Business Purpose: Identify whether customers using different devices have different cart abandonment behaviour.
SELECT DeviceType,COUNT(DISTINCT SessionID) AS total_sessions,
COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) AS abandoned_sessions,
ROUND(COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) 
* 100.0 / COUNT(DISTINCT SessionID),2) AS abandonment_rate
FROM ecommerce_data GROUP BY DeviceType ORDER BY abandonment_rate DESC;

--- Q5. Which referral sources have the highest cart abandonment?
--- Business Purpose: Identify marketing/referral channels that bring customers who are more likely to abandon their carts.
SELECT ReferralSource,COUNT(DISTINCT SessionID) AS total_sessions,
COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) AS abandoned_sessions,
ROUND(COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) 
* 100.0/ COUNT(DISTINCT SessionID),2) AS abandonment_rate 
FROM ecommerce_data GROUP BY ReferralSource ORDER BY abandonment_rate DESC;

--- Q6. Which countries have the highest cart abandonment?
--- Business Purpose:Identify geographic markets where cart abandonment is particularly high.
SELECT Country,COUNT(DISTINCT SessionID) AS total_sessions,
COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) AS abandoned_sessions,
ROUND(COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) * 100.0
/ COUNT(DISTINCT SessionID),2) AS abandonment_rate FROM ecommerce_data
GROUP BY Country HAVING COUNT(DISTINCT SessionID) >= 10
ORDER BY abandonment_rate DESC;

--- ==========================================================
--- SECTION 3: CART BEHAVIOUR
--- ==========================================================

--- Q7. Does the number of items in the cart affect abandonment?
---- Business Purpose: Determine whether customers with larger carts are more likely to abandon.
SELECT ItemsInCart, COUNT(DISTINCT SessionID) AS total_sessions,COUNT(DISTINCT CASE
WHEN AbandonedCart = 1 THEN SessionID END) AS abandoned_sessions,
ROUND(COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END)
 * 100.0 / COUNT(DISTINCT SessionID),2) AS abandonment_rate FROM ecommerce_data
WHERE ItemsInCart > 0 GROUP BY ItemsInCart ORDER BY ItemsInCart;

--- Q8. Does time spent on the website differ between abandoned and purchased sessions?
--- Business Purpose: Compare customer engagement time between customers  who abandoned their carts and customers who purchased.
SELECT CASE WHEN AbandonedCart = 1 THEN 'Abandoned'
WHEN Purchased = 1 THEN 'Purchased' END AS customer_outcome,COUNT(DISTINCT SessionID) AS sessions,
ROUND(AVG(TimeOnPage_seconds), 2) AS avg_time_on_page_seconds FROM ecommerce_data
WHERE AbandonedCart = 1 OR Purchased = 1 GROUP BY CASE WHEN AbandonedCart = 1 THEN 'Abandoned'
WHEN Purchased = 1 THEN 'Purchased' END;

--- Q9. Does engagement level affect cart abandonment?
--- Business Purpose: Determine whether highly engaged customers are more or less likely to abandon their carts.
SELECT EngagementLevel,COUNT(DISTINCT SessionID) AS total_sessions,COUNT(DISTINCT CASE
WHEN AbandonedCart = 1 THEN SessionID END) AS abandoned_sessions,
ROUND(COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) * 100.0
/ COUNT(DISTINCT SessionID),2) AS abandonment_rate
FROM ecommerce_data GROUP BY EngagementLevel
ORDER BY abandonment_rate DESC;

--- ==========================================================
--- SECTION 4: TIME-BASED ABANDONMENT
---  ==========================================================
--- Q10. Which day of the week has the highest cart abandonment?
--- Business Purpose: Identify days when cart abandonment is particularly high.
SELECT DayOfWeek,COUNT(DISTINCT SessionID) AS total_sessions,COUNT(DISTINCT CASE
WHEN AbandonedCart = 1 THEN SessionID END) AS abandoned_sessions,
ROUND(COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) * 100.0
/ COUNT(DISTINCT SessionID),2) AS abandonment_rate FROM ecommerce_data
GROUP BY DayOfWeek ORDER BY abandonment_rate DESC;

--- Q11. Which hour has the highest cart abandonment?
--- Business Purpose: Identify peak hours when customers are most likely to abandon their carts.
SELECT Hour,COUNT(DISTINCT SessionID) AS total_sessions,
COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) AS abandoned_sessions,
ROUND(COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) * 100.0
/ COUNT(DISTINCT SessionID),2) AS abandonment_rate FROM ecommerce_data
GROUP BY Hour ORDER BY Hour;

--- Q12. Does cart abandonment vary by month?
--- Business Purpose: Identify monthly patterns in customer cart abandonment.
SELECT MonthNumber, Month,COUNT(DISTINCT SessionID) AS total_sessions,COUNT(DISTINCT CASE
WHEN AbandonedCart = 1 THEN SessionID END) AS abandoned_sessions,
ROUND(COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) 
* 100.0/ COUNT(DISTINCT SessionID),2) AS abandonment_rate
FROM ecommerce_data GROUP BY MonthNumber,Month ORDER BY MonthNumber;

--- ==========================================================
--- SECTION 5: SEGMENT-LEVEL ANALYSIS
--- ==========================================================

--- Q13. Which device and engagement-level combination has the highest cart abandonment?
--- Business Purpose: Identify specific customer segments with unusually high abandonment.
SELECT DeviceType, EngagementLevel, COUNT(DISTINCT SessionID) AS total_sessions,
COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) AS abandoned_sessions,
ROUND(COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) * 100.0
/ COUNT(DISTINCT SessionID),2) AS abandonment_rate
FROM ecommerce_data GROUP BY DeviceType, EngagementLevel
HAVING COUNT(DISTINCT SessionID) >= 20 ORDER BY abandonment_rate DESC;

---  Q14. Which device and referral source combination has the highest cart abandonment?
---  Business Purpose: Identify marketing channels and devices where customers are particularly likely to abandon.
SELECT DeviceType, ReferralSource, COUNT(DISTINCT SessionID) AS total_sessions,
COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) AS abandoned_sessions,
ROUND(COUNT(DISTINCT CASE WHEN AbandonedCart = 1 THEN SessionID END) * 100.0
/ COUNT(DISTINCT SessionID),2) AS abandonment_rate FROM ecommerce_data
GROUP BY DeviceType, ReferralSource
HAVING COUNT(DISTINCT SessionID) >= 20
ORDER BY abandonment_rate DESC;
