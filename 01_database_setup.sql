CREATE DATABASE ecommerce_project;

USE ecommerce_project;

CREATE TABLE ecommerce_data (
    SessionID VARCHAR(100),
    UserID VARCHAR(100),
    Timestamp DATETIME,
    Date DATE,
    Time TIME,
    Hour INT,
    DayOfWeek VARCHAR(20),
    Month VARCHAR(20),
    MonthNumber INT,
    JourneyStage VARCHAR(30),
    CartStatus VARCHAR(30),
    PurchaseStatus VARCHAR(30),
    EngagementLevel VARCHAR(30),
    AbandonedCart INT,
    PageType VARCHAR(50),
    DeviceType VARCHAR(30),
    Country VARCHAR(50),
    ReferralSource VARCHAR(50),
    TimeOnPage_seconds INT,
    ItemsInCart INT,
    Purchased INT
);