Perintah `SELECT` digunakan untuk mengambil data dari tabel.

**1. Menampilkan Seluruh  Kolom dan Baris**

```sql
SELECT * FROM nama_table;
```

**2. Menampilkan Kolom Tertentu**

```sql
SELECT nama_kolom1, nama_kolom2 FROM nama_table;
```

**3. Menyaring Data Berdasarkan Kondisi**

```sql
-- Menampilkan produk dengan harga lebih besar dari 200.000
SELECT * FROM produk WHERE harga > 200000;

-- Menampilkan produk berdasarkan SKU spesifik
SELECT * FROM produk WHERE kode_sku = 'SKU-001';
```