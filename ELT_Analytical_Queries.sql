-- =====================================================
-- QUERY 1: Monthly Booking Volume and Average ADR
-- =====================================================

SELECT
d.year_month,
COUNT(*) AS booking_count,
ROUND(CAST(AVG(fb.adr) AS NUMERIC), 2) AS avg_adr
FROM public.elt_fact_bookings AS fb
JOIN public.elt_dim_date AS d
ON fb.arrival_date_id = d.date_id
GROUP BY d.year_month
ORDER BY d.year_month
LIMIT 24;

-- =====================================================
-- QUERY 2: Cancellation Rate by Hotel Type
-- =====================================================

SELECT
ht.hotel_type,
COUNT(*) AS booking_count,
ROUND(
CAST(AVG(fb.is_canceled) * 100 AS NUMERIC),
2
) AS cancellation_rate_pct
FROM public.elt_fact_bookings AS fb
JOIN public.elt_dim_booking_hotel_type AS ht
ON fb.booking_hotel_type_id = ht.booking_hotel_type_id
GROUP BY ht.hotel_type
ORDER BY cancellation_rate_pct DESC;

-- =====================================================
-- QUERY 3: Average ADR by Market Segment
-- =====================================================

SELECT
ms.market_segment,
COUNT(*) AS booking_count,
ROUND(CAST(AVG(fb.adr) AS NUMERIC), 2) AS avg_adr
FROM public.elt_fact_bookings AS fb
JOIN public.elt_dim_market_segment AS ms
ON fb.market_segment_id = ms.market_segment_id
GROUP BY ms.market_segment
ORDER BY avg_adr DESC
LIMIT 10;

-- =====================================================
-- QUERY 4: Revenue Proxy by Customer Type
-- Revenue Proxy = ADR × Total Nights
-- =====================================================

SELECT
ct.customer_type,
COUNT(*) AS booking_count,
ROUND(
CAST(SUM(fb.adr * fb.total_nights) AS NUMERIC),
2
) AS revenue_proxy
FROM public.elt_fact_bookings AS fb
JOIN public.elt_dim_customer_type AS ct
ON fb.customer_type_id = ct.customer_type_id
GROUP BY ct.customer_type
ORDER BY revenue_proxy DESC;

-- =====================================================
-- QUERY 5: Room Change Rate by Reserved Room Type
-- =====================================================

SELECT
rr.room_type AS reserved_room_type,
COUNT(*) AS booking_count,
ROUND(
CAST(AVG(fb.room_changed) * 100 AS NUMERIC),
2
) AS room_change_rate_pct
FROM public.elt_fact_bookings AS fb
JOIN public.elt_dim_room_type AS rr
ON fb.reserved_room_type_id = rr.room_type_id
GROUP BY rr.room_type
ORDER BY room_change_rate_pct DESC
LIMIT 10;

-- =====================================================
-- QUERY 6: Review Score by Reviewer Country
-- =====================================================

SELECT
c.country_name AS reviewer_country,
COUNT(*) AS review_count,
ROUND(
CAST(AVG(fr.reviewer_score) AS NUMERIC),
2
) AS avg_reviewer_score
FROM public.elt_fact_reviews AS fr
JOIN public.elt_dim_country AS c
ON fr.reviewer_country_id = c.country_id
GROUP BY c.country_name
HAVING COUNT(*) >= 20
ORDER BY avg_reviewer_score DESC
LIMIT 15;

-- =====================================================
-- QUERY 7: Top Reviewed Hotels
-- =====================================================

SELECT
rh.hotel_name,
COUNT(*) AS review_count,
ROUND(
CAST(AVG(fr.reviewer_score) AS NUMERIC),
2
) AS avg_reviewer_score
FROM public.elt_fact_reviews AS fr
JOIN public.elt_dim_review_hotel AS rh
ON fr.review_hotel_id = rh.review_hotel_id
GROUP BY rh.hotel_name
ORDER BY review_count DESC
LIMIT 15;

-- =====================================================
-- QUERY 8: Positive and Negative Review Balance by Hotel
-- =====================================================

SELECT
rh.hotel_name,
COUNT(*) AS review_count,
ROUND(
CAST(AVG(fr.positive_review_word_count) AS NUMERIC),
2
) AS avg_positive_words,
ROUND(
CAST(AVG(fr.negative_review_word_count) AS NUMERIC),
2
) AS avg_negative_words,
ROUND(
CAST(AVG(fr.sentiment_word_balance) AS NUMERIC),
2
) AS avg_sentiment_word_balance
FROM public.elt_fact_reviews AS fr
JOIN public.elt_dim_review_hotel AS rh
ON fr.review_hotel_id = rh.review_hotel_id
GROUP BY rh.hotel_name
HAVING COUNT(*) >= 20
ORDER BY avg_sentiment_word_balance DESC
LIMIT 15;

-- =====================================================
-- QUERY 9: Monthly Hotel Performance Summary
-- =====================================================

SELECT
d.year_month,
fp.booking_count,
fp.review_count,
ROUND(
CAST(fp.cancellation_rate * 100 AS NUMERIC),
2
) AS cancellation_rate_pct,
ROUND(
CAST(fp.avg_adr AS NUMERIC),
2
) AS avg_adr,
ROUND(
CAST(fp.avg_reviewer_score AS NUMERIC),
2
) AS avg_reviewer_score
FROM public.elt_fact_hotel_monthly_performance AS fp
JOIN public.elt_dim_date AS d
ON fp.month_start_date_id = d.date_id
ORDER BY d.year_month
LIMIT 24;

-- =====================================================
-- QUERY 10: Special Requests vs Cancellation Rate
-- =====================================================

SELECT
fb.total_of_special_requests,
COUNT(*) AS booking_count,
ROUND(
CAST(AVG(fb.is_canceled) * 100 AS NUMERIC),
2
) AS cancellation_rate_pct,
ROUND(
CAST(AVG(fb.adr) AS NUMERIC),
2
) AS avg_adr
FROM public.elt_fact_bookings AS fb
GROUP BY fb.total_of_special_requests
ORDER BY fb.total_of_special_requests;
