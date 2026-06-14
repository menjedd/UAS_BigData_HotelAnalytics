# Dataset Documentation

## Dataset 1 — Hotel Booking Demand

**Source:**
https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand

**Format:**
CSV (`hotel_bookings.csv`)

**Raw File:**
https://drive.google.com/file/d/1heQxkAblCdLx3G8GbnmY_WNprBt5qcFp/view?usp=sharing

**Description:**
Dataset berisi data reservasi hotel dari City Hotel dan Resort Hotel selama periode 2015–2017. Dataset mencakup informasi booking, status pembatalan, lead time, tipe kamar, negara asal tamu, Average Daily Rate (ADR), dan berbagai atribut lainnya yang digunakan untuk analisis perilaku pelanggan dan performa hotel.

---

## Dataset 2 — Hotel Reviews in Europe

**Source:**
https://www.kaggle.com/datasets/jiashenliu/515k-hotel-reviews-data-in-europe

**Original Format:**
CSV

**Format Used in This Project:**
NDJSON (`hotel_reviews.ndjson`)

**Raw File:**
https://drive.google.com/file/d/1x3HXFu2ttE6y8B-MCJcUuIMCgzcwSX8W/view?usp=drive_link

**Description:**
Dataset berisi sekitar 515.000 ulasan tamu hotel di Eropa, termasuk review score, positive review, negative review, nationality reviewer, dan informasi hotel lainnya. Pada project ini, dataset dikonversi dari format CSV menjadi NDJSON untuk mendukung proses ETL dan integrasi data yang lebih efisien pada pipeline Big Data.

### Konversi CSV ke NDJSON

Dataset ulasan hotel awalnya tersedia dalam format CSV. Untuk mendukung proses ETL dan pemrosesan data semi-terstruktur, dataset dikonversi ke format NDJSON (Newline Delimited JSON), sehingga setiap baris merepresentasikan satu objek JSON yang dapat diproses secara lebih efisien dalam pipeline Big Data.
