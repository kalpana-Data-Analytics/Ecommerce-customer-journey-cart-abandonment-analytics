use ecommerce_analytics;
--- =====================================================
--- PROJECT: E-commerce Customer Journey Analytics
--- FILE: 05_conversion_analysis.sql
--- PURPOSE: Analyse purchase conversion performance
--- TABLE: ecommerce_data
--- =====================================================
--- Q1. What is the overall conversion rate?
--- Business Purpose: Measure the percentage of sessions that resulted in a purchase.
SELECT COUNT(DISTINCT SessionID) AS total_sessions,
COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) AS purchased_sessions,
ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END)
 * 100.0 / NULLIF(COUNT(DISTINCT SessionID), 0),2) AS conversion_rate_pct
FROM ecommerce_data;

--- Q2. Which device has the highest conversion rate?
--- Business Purpose: Compare conversion performance across mobile, desktop and tablet devices.
SELECT DeviceType,COUNT(DISTINCT SessionID) AS total_sessions,
COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) AS purchased_sessions,
ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) * 100.0
/ NULLIF(COUNT(DISTINCT SessionID), 0),2) AS conversion_rate_pct
FROM ecommerce_data GROUP BY DeviceType
ORDER BY conversion_rate_pct DESC;

---- Q3. Which referral source has the highest conversion rate?
--- Business Purpose:  Identify traffic sources that bring sessions  most likely to result in a purchase.
SELECT ReferralSource,
COUNT(DISTINCT SessionID) AS total_sessions,
COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) AS purchased_sessions,
ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) * 100.0
/ NULLIF(COUNT(DISTINCT SessionID), 0),2) AS conversion_rate_pct
FROM ecommerce_data GROUP BY ReferralSource
ORDER BY conversion_rate_pct DESC;

--- Q4. During which hours do sessions convert most successfully?
--- Business Purpose: Identify hours with high purchase conversion  and understand when customers are most likely to buy.
SELECT Hour, COUNT(DISTINCT SessionID) AS total_sessions, COUNT(DISTINCT CASE
WHEN Purchased = 1 THEN SessionID END) AS purchased_sessions,
ROUND(COUNT(DISTINCT CASE WHEN Purchased = 1 THEN SessionID END) * 100.0
/ NULLIF(COUNT(DISTINCT SessionID), 0),2) AS conversion_rate_pct
FROM ecommerce_data GROUP BY Hour ORDER BY Hour;

--- Q5. How are sessions distributed across customer journey stages?
---  Business Purpose: Understand the distribution of sessions across awareness, consideration, checkout, cart and conversion.

SELECT JourneyStage, COUNT(DISTINCT SessionID) AS sessions,
ROUND(COUNT(DISTINCT SessionID) * 100.0 / NULLIF(
(SELECT COUNT(DISTINCT SessionID) FROM ecommerce_data),0),2) AS pct_of_all_sessions
FROM ecommerce_data GROUP BY JourneyStage
ORDER BY sessions DESC;