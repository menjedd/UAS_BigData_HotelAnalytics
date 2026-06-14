# Hotel Booking & Guest Review Analytics

## Overview

This project implements ETL (Extract, Transform, Load) and ELT (Extract, Load, Transform) approaches to process hotel reservation and guest review data. The objective is to build a cloud-based data warehouse that supports analytical reporting and interactive business intelligence dashboards.

The project integrates booking transactions and customer reviews to provide insights into reservation trends, cancellation behavior, customer characteristics, revenue performance, and hotel review metrics.

---

## Team Members

| Name             | Student ID   | Role                     |
| ---------------- | ------------ | ------------------------ |
| Nabila Meizahra  | 101032300035 | ETL Pipeline & Dashboard |
| Caleb Narendra P | 101032330139 | ELT Pipeline & Dashboard |

---

## Data Sources

### Hotel Booking Demand

https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand

Reservation dataset containing hotel type, cancellation status, lead time, ADR, guest information, and stay duration.

### Hotel Reviews in Europe

https://www.kaggle.com/datasets/jiashenliu/515k-hotel-reviews-data-in-europe

Review dataset containing review scores, customer feedback, reviewer nationality, and hotel information.

*The review dataset was converted from CSV to NDJSON format for ETL processing.*

---

## Architecture

The project utilizes:

* Google Colab for data processing
* PostgreSQL (Neon) as a cloud data warehouse
* Power BI for dashboard development

Architecture documentation is available in:

* Architecture Diagram.png

---

## Data Warehouse

### ETL Schema

The ETL implementation uses a Star Schema consisting of:

**Fact Table**

* fact_bookings

**Dimension Tables**

* dim_hotel
* dim_customer
* dim_date

Reference:

* schema_diagram_etl.png

### ELT Schema

The ELT implementation consists of booking, review, and performance fact tables supported by multiple dimensions.

**Fact Tables**

* elt_fact_bookings
* elt_fact_reviews
* elt_fact_hotel_monthly_performance

**Dimension Tables**

* elt_dim_date
* elt_dim_country
* elt_dim_customer_type
* elt_dim_market_segment
* elt_dim_room_type
* elt_dim_booking_hotel_type
* elt_dim_review_hotel

Reference:

* schema_diagram_elt.png

---

## Dashboard

The dashboards provide analysis of:

* Booking Volume
* Revenue Performance
* Cancellation Rate
* Customer Segmentation
* Monthly Trends
* Seasonal Demand
* Hotel Performance
* Guest Review Metrics

Dashboard files:

* File Dashboard ETL.pbix
* ELT Pipeline Report.pbix

---

## Repository Contents

| File                             | Description            |
| -------------------------------- | ---------------------- |
| etl_pipeline_hotel_booking.ipynb | ETL implementation     |
| Hotel_ELT_Pipeline.ipynb         | ELT implementation     |
| ETL_Analytical_Queries.sql       | ETL analytical queries |
| ELT_Analytical_Queries.sql       | ELT analytical queries |
| Dataset Documentation.md         | Dataset documentation  |
| Architecture Diagram.png         | System architecture    |
| schema_diagram_etl.png           | ETL schema             |
| schema_diagram_elt.png           | ELT schema             |
| Dashboard ETL.png                | ETL dashboard preview  |
| Dashboard ELT.png                | ELT dashboard preview  |
| Kelompok 12_Laporan Paper.pdf    | Final report           |

---

## Conclusion

The implementation of ETL and ELT successfully produces a cloud-based analytical data warehouse for hotel booking and guest review analysis. The resulting dashboards support interactive exploration of booking performance, customer behavior, revenue trends, and hotel review insights.
