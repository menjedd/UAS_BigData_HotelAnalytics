# Hotel Booking & Guest Review Analytics

## Gambaran Proyek

Proyek ini merupakan implementasi proses **Extract, Transform, Load (ETL)** dan **Extract, Load, Transform (ELT)** pada data reservasi hotel dan ulasan pelanggan. Tujuan utama proyek adalah membangun data warehouse berbasis cloud yang dapat mendukung proses analisis data dan visualisasi informasi melalui dashboard Business Intelligence.

Data yang digunakan berasal dari dataset reservasi hotel dan ulasan pelanggan hotel di Eropa. Kedua dataset tersebut diolah untuk menghasilkan insight mengenai pola reservasi, tingkat pembatalan, performa hotel, karakteristik pelanggan, serta hubungan antara ulasan pelanggan dan kinerja bisnis hotel.

---

## Anggota Kelompok

| Nama | NIM | Peran |
|--------|--------|--------|
| Nabila Meizahra | 101032300035 | ETL Pipeline, Data Warehouse ETL, Dashboard ETL |
| Caleb Narendra P | 101032330139 | ELT Pipeline, Data Warehouse ELT, Dashboard ELT |

---

## Dataset

### 1. Hotel Booking Demand

Dataset ini berisi data reservasi hotel yang mencakup informasi seperti tipe hotel, status pembatalan, lead time, jumlah tamu, lama menginap, dan Average Daily Rate (ADR).

Sumber:
https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand

### 2. Hotel Reviews in Europe

Dataset ini berisi ulasan pelanggan hotel yang mencakup review score, ulasan positif dan negatif, informasi reviewer, serta data hotel.

Sumber:
https://www.kaggle.com/datasets/jiashenliu/515k-hotel-reviews-data-in-europe

Catatan:
Dataset review dikonversi dari format CSV menjadi NDJSON untuk mendukung proses ETL.

---

## Arsitektur Sistem

Proyek menggunakan Google Colab sebagai lingkungan pemrosesan data, PostgreSQL (Neon Database) sebagai cloud data warehouse, dan Power BI sebagai platform visualisasi data.

Dokumentasi arsitektur tersedia pada file:

- Architecture Diagram.png

---

## Data Warehouse

### ETL Data Warehouse

Pada pendekatan ETL, proses transformasi dilakukan terlebih dahulu menggunakan Python sebelum data dimuat ke dalam data warehouse.

Skema yang digunakan adalah **Star Schema** yang terdiri dari:

**Fact Table**
- fact_bookings

**Dimension Table**
- dim_hotel
- dim_customer
- dim_date

Dokumentasi skema:
- schema_diagram_etl.png

### ELT Data Warehouse

Pada pendekatan ELT, data dimuat terlebih dahulu ke dalam data warehouse, kemudian dilakukan proses transformasi menggunakan SQL.

**Fact Table**
- elt_fact_bookings
- elt_fact_reviews
- elt_fact_hotel_monthly_performance

**Dimension Table**
- elt_dim_date
- elt_dim_country
- elt_dim_customer_type
- elt_dim_market_segment
- elt_dim_room_type
- elt_dim_booking_hotel_type
- elt_dim_review_hotel

Dokumentasi skema:
- schema_diagram_elt.png

---

## Dashboard dan Analisis

Dashboard yang dibangun menggunakan Power BI menyediakan berbagai analisis, antara lain:

- Total Booking
- Revenue Hotel
- Cancellation Rate
- Tren Reservasi Bulanan
- Segmentasi Pelanggan
- Distribusi Negara Asal Pelanggan
- Analisis High Season dan Low Season
- Performa Hotel
- Analisis Ulasan Pelanggan

Dashboard dilengkapi dengan filter interaktif sehingga pengguna dapat melakukan eksplorasi data secara lebih fleksibel.

---

## Struktur Repository

### Notebook
- etl_pipeline_hotel_booking.ipynb
- Hotel_ELT_Pipeline.ipynb

### Query Analitik
- ETL_Analytical_Queries.sql
- ELT_Analytical_Queries.sql

### Dashboard
- Dashboard ETL.png
- Dashboard ELT.png
- File Dashboard ETL.pbix
- ELT Pipeline Report.pbix

### Dokumentasi
- Dataset Documentation.md
- README.md

### Data Warehouse
- schema_diagram_etl.png
- schema_diagram_elt.png

### Arsitektur
- Architecture Diagram.png

### Laporan
- Kelompok 12_Laporan Paper.pdf

---

## Cara Menjalankan Proyek

1. Buka notebook ETL atau ELT menggunakan Google Colab.
2. Konfigurasikan koneksi PostgreSQL (Neon Database).
3. Jalankan seluruh proses pipeline hingga data berhasil dimuat ke data warehouse.
4. Jalankan query analitik yang tersedia untuk melakukan verifikasi hasil.
5. Hubungkan Power BI ke data warehouse untuk menampilkan dashboard.

---

## Kesimpulan

Proyek ini berhasil mengimplementasikan pendekatan ETL dan ELT untuk membangun data warehouse berbasis cloud pada domain perhotelan. Data warehouse yang dihasilkan mendukung proses analisis data reservasi dan ulasan pelanggan, serta mampu menyajikan informasi melalui dashboard interaktif yang membantu pengambilan keputusan berbasis data.
