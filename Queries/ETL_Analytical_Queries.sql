-- =====================================================
-- Q1 Total Booking & Cancellation Rate per Hotel
-- =====================================================

SELECT h.hotel_name,
COUNT(*) AS total_booking,
SUM(f.is_canceled) AS total_canceled,
ROUND(SUM(f.is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct
FROM fact_bookings f
JOIN dim_hotel h ON f.hotel_id = h.hotel_id
GROUP BY h.hotel_name
ORDER BY total_booking DESC;

-- =====================================================
-- Q2 Total Revenue & Average ADR per Hotel per Year
-- =====================================================

SELECT h.hotel_name,
d.year,
ROUND(SUM(f.total_revenue)::numeric, 2) AS total_revenue,
ROUND(AVG(f.adr)::numeric, 2) AS avg_adr
FROM fact_bookings f
JOIN dim_hotel h ON f.hotel_id = h.hotel_id
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY h.hotel_name, d.year
ORDER BY h.hotel_name, d.year;

-- =====================================================
-- Q3 Top 10 Countries by Total Bookings
-- =====================================================

SELECT c.country,
COUNT(*) AS total_booking
FROM fact_bookings f
JOIN dim_customer c ON f.customer_id = c.customer_id
WHERE c.country <> 'Unknown'
GROUP BY c.country
ORDER BY total_booking DESC
LIMIT 10;

-- =====================================================
-- Q4 Monthly Booking Distribution
-- =====================================================

SELECT d.arrival_month_name,
d.month,
COUNT(*) AS total_booking,
ROUND(AVG(f.total_revenue)::numeric, 2) AS avg_revenue
FROM fact_bookings f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.arrival_month_name, d.month
ORDER BY d.month;

-- =====================================================
-- Q5 High Season vs Low Season Analysis
-- =====================================================

SELECT
CASE
WHEN d.is_high_season = 1 THEN 'High Season (Jun-Jul-Aug-Dec)'
ELSE 'Low Season'
END AS season,
COUNT(*) AS total_booking,
ROUND(AVG(f.adr)::numeric, 2) AS avg_adr,
ROUND(AVG(f.total_nights)::numeric, 2) AS avg_nights
FROM fact_bookings f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.is_high_season;

-- =====================================================
-- Q6 Cancellation Rate & Lead Time by Deposit Type
-- =====================================================

SELECT f.deposit_type,
COUNT(*) AS total_booking,
ROUND(AVG(f.lead_time)::numeric, 1) AS avg_lead_time_days,
ROUND(SUM(f.is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct
FROM fact_bookings f
GROUP BY f.deposit_type
ORDER BY cancellation_rate_pct DESC;

-- =====================================================
-- Q7 Revenue per Guest: Family vs Non-Family
-- =====================================================

SELECT
CASE
WHEN c.is_family = 1 THEN 'Family'
ELSE 'Non-Family'
END AS guest_type,
COUNT(*) AS total_booking,
ROUND(AVG(f.revenue_per_guest)::numeric, 2) AS avg_revenue_per_guest,
ROUND(AVG(f.total_nights)::numeric, 2) AS avg_nights,
ROUND(SUM(f.is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct
FROM fact_bookings f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.is_family;

-- =====================================================
-- Q8 Hotel Review Score vs Revenue & Cancellation Rate
-- =====================================================

SELECT h.hotel_name,
h.booking_review_score,
h.booking_positive_rate,
COUNT(*) AS total_booking,
ROUND(SUM(f.is_canceled) * 100.0 / COUNT(*), 2) AS cancellation_rate_pct,
ROUND(AVG(f.total_revenue)::numeric, 2) AS avg_revenue
FROM fact_bookings f
JOIN dim_hotel h ON f.hotel_id = h.hotel_id
GROUP BY h.hotel_name,
h.booking_review_score,
h.booking_positive_rate
ORDER BY h.booking_review_score DESC;
