USE ecommerce_analytics;
--- ============================================================
--- E-COMMERCE CUSTOMER JOURNEY ANALYTICS
---- SQL DATA VALIDATION
--- ============================================================
---- 1. Check total number of rows
--- Purpose: Validate the total number of records imported into MySQL.
SELECT COUNT(*) AS total_rows FROM ecommerce_data;
---  2. Check number of unique sessions
---  Purpose: Validate the session-level data.
SELECT COUNT(DISTINCT SessionID) AS unique_sessions FROM ecommerce_data;
---  3. Check number of unique users
---  Purpose: Validate the number of unique customers/users in the dataset.
SELECT COUNT(DISTINCT UserID) AS unique_users FROM ecommerce_data;
---  4. Check duplicate SessionID + Timestamp records
---  Purpose: Identify completely duplicated session events.
SELECT SessionID, Timestamp, COUNT(*) AS duplicate_count FROM ecommerce_data
GROUP BY SessionID, Timestamp HAVING COUNT(*) > 1;
---  5. Check NULL values in important columns
---  Purpose: Identify missing values in key customer journey fields.
SELECT SUM(SessionID IS NULL) AS null_session_id,
SUM(UserID IS NULL) AS null_user_id,
SUM(Timestamp IS NULL) AS null_timestamp,
SUM(JourneyStage IS NULL) AS null_journey_stage,
SUM(CartStatus IS NULL) AS null_cart_status,
SUM(PurchaseStatus IS NULL) AS null_purchase_status,
SUM(DeviceType IS NULL) AS null_device_type,
SUM(Country IS NULL) AS null_country,
SUM(ReferralSource IS NULL) AS null_referral_source
FROM ecommerce_data;
---  6. Check unique JourneyStage values
---  Purpose: Validate that customer journey stages contain expected categories.
SELECT DISTINCT JourneyStage FROM ecommerce_data ORDER BY JourneyStage;
--- 7. Check number of records by JourneyStage
--- Purpose: Validate the distribution of customers/events across journey stages.
SELECT JourneyStage,
COUNT(*) AS record_count
FROM ecommerce_data
GROUP BY JourneyStage
ORDER BY record_count DESC;
---  8. Check unique CartStatus values
--- Purpose: Validate the categories used to describe cart activity.
SELECT DISTINCT CartStatus FROM ecommerce_data ORDER BY CartStatus;
---  9. Check unique PurchaseStatus values
---  Purpose: Validate the categories used to describe purchase activity.
SELECT DISTINCT PurchaseStatusFROM ecommerce_data ORDER BY PurchaseStatus;
--- 10. Check unique DeviceType values
--- Purpose: Validate the device categories used in the dataset.
SELECT DISTINCT DeviceType FROM ecommerce_data ORDER BY DeviceType;
---  11. Check unique ReferralSource values
--- Purpose: Validate the marketing/referral source categories.
SELECT DISTINCT ReferralSource FROM ecommerce_data ORDER BY ReferralSource;
--- 12. Check unique Country values
--- Purpose: Validate the geographic categories in the dataset.
SELECT DISTINCT Country FROM ecommerce_data ORDER BY Country;
--- 13. Check invalid negative TimeOnPage values
--- Purpose: Ensure that time spent on a page is not negative.
SELECT * FROM ecommerce_data WHERE TimeOnPage_seconds < 0;
--- 14. Check invalid negative ItemsInCart values
--- Purpose: Ensure that the number of items in a cart is not negative.
SELECT * FROM ecommerce_data WHERE ItemsInCart < 0;
--- 15. Check invalid Purchased values
--- Purpose: Validate that Purchased contains only expected binary values.
SELECT DISTINCT Purchased FROM ecommerce_data ORDER BY Purchased;
--- 16. Check invalid AbandonedCart values
--- Purpose: Validate that AbandonedCart contains only expected binary values.
SELECT DISTINCT AbandonedCart FROM ecommerce_data ORDER BY AbandonedCart;
--- 17. Check consistency between ItemsInCart and AbandonedCart
--- Purpose: Identify records where carts contain items but are not marked correctly as abandoned.
SELECT * FROM ecommerce_data WHERE ItemsInCart > 0 AND Purchased = 0 AND AbandonedCart <> 1;
--- 18. Check consistency between Purchased and PurchaseStatus
--- Purpose: Identify records where the Purchased flag and PurchaseStatus disagree.
SELECT * FROM ecommerce_data WHERE (Purchased = 1 AND PurchaseStatus <> 'Purchased')
OR (Purchased = 0 AND PurchaseStatus = 'Purchased');
--- 19. Check purchase records with zero items in cart
--- Purpose: Identify potentially inconsistent purchase records.
SELECT * FROM ecommerce_data WHERE Purchased = 1 AND ItemsInCart = 0;
--- 20. Check abandoned carts that have a purchase
---  Purpose: Identify logically inconsistent records where a session is both abandoned and purchased.
SELECT * FROM ecommerce_data WHERE AbandonedCart = 1 AND Purchased = 1;
---  21. Final validation summary
---  Purpose: Create a quick summary of the main dataset metrics.
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT SessionID) AS unique_sessions,
    COUNT(DISTINCT UserID) AS unique_users,
    SUM(Purchased = 1) AS purchase_records,
    SUM(AbandonedCart = 1) AS abandoned_cart_records
FROM ecommerce_data;