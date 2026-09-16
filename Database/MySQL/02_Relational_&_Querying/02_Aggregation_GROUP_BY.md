## A. Konsep Dasar & Alur Kerja
Operasi agregasi digunakan untuk mengolah banyak baris data menjadi satu laporan ringkasan.

### 1. Tanpa `GROUP BY`
Fungsi agregasi memperlakukan **seluruh isi tabel** sebagai satu kelompok tunggal.

### 2. Dengan `GROUP BY`
`GROUP BY` berfungsi **memilah/memecah baris data ke dalam "ember-ember" kelompok yang sama** berdasarkan kolom tertentu sebelum fungsi agregasi dihitung di dalam masing-masing kelompok tersebut.

## B. 5 Fungsi Agregasi Utama

| **Fungsi**    | **Deskripsi**                          | **Contoh Kasus**                                   |
| ------------- | -------------------------------------- | -------------------------------------------------- |
| **`COUNT()`** | Menghitung jumlah baris/data.          | Menhitung total variasi produk _per_ kategori.     |
| **`SUM()`**   | Menjumlahkan seluruh nilai numerik.    | Menghitung total stok fisik barang _per_ kategori. |
| **`AVG()`**   | Menhitung nilai rata-rata (_Average_). | Menghitung rata-rata harga produk _per_ kategori.  |
| **`MAX()`**   | Mencari nilai tertinggi/terbesar.      | Mencari harga produk termahal di tiap kategori.    |
| **`MIN()`**   | Mencari nilai terendah/terkecil.       | Mencari harga produk termurah di tiap kategori.    |

## C. Contoh Sintaks: Gabungan JOIN + Agregasi + GROUP BY
```sql
SELECT 
    c.id,
    c.name AS nama_kategori,
    COUNT(p.id) AS total_jenis_produk,
    SUM(p.stock) AS total_stok,
    AVG(p.price) AS rata_rata_harga,
    MAX(p.price) AS harga_tertinggi,
    MIN(p.price) AS harga_terendah
FROM categories c
LEFT JOIN products p ON c.id = p.category_id
GROUP BY c.id, c.name;
```

## D. Perbedaan Penting: `WHERE` vs `HAVING`
- **`WHERE`**: Memfilter baris data **SEBELUM** dikelompokkan oleh `GROUP BY` (tidak boleh berisi fungsi agregasi).
- **`HAVING`**: Memfilter kelompok data **SETELAH** dihitung oleh fungsi agregasi.

```sql
-- Contoh: Hanya tampilkan kategori yang memiliki total produk LEBIH DARI 3
SELECT 
    c.name AS nama_kategori,
    COUNT(p.id) AS total_produk
FROM categories c
INNER JOIN products p ON c.id = p.category_id
GROUP BY c.id, c.name
HAVING COUNT(p.id) > 3;
```

## E. Implikasi Performa (Mengapa `GROUP BY` Berat?)
Secara internal, `GROUP BY` membutuhkan beban komputasi tinggi karena MySQL harus melakukan 3 tahap:
1. **Scanning**: Membaca data baris demi baris.
2. **Sorting & Grouping**: Memisahkan data dan menampungnya ke tabel sementara di RAM (_Memory_).
3. **Aggregating**: Menghitung rumus agregasi untuk tiap kelompok.

> **Catatan Optimasi:** Pada data berukuran besar (jutaan baris), kolom yang digunakan pada klausa `GROUP BY` **wajib memiliki Index** agar MySQL tidak perlu memilah data dari awal secara lambat.