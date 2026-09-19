## A. Problem Utama: Full Table Scan

Saat kita mengeksekusi query `SELECT` dengan kondisi `WHERE` atau `JOIN` tanpa optimasi, MySQL secara bawaan melakukan **Full Table Scan** (penyisiran seluruh tabel).

- **Cara Kerja:** MySQL membaca baris ke-1, baris ke-2, hingga baris ke-N dari disk ke RAM.
    
- **Kompleksitas Waktu:** $\mathcal{O}(N)$. Jika ada 10 juta baris, MySQL memeriksa 10 juta baris tersebut satu per satu.
    
- **Dampak:** _I/O Disk_ dan CPU melonjak tinggi, waktu respon (_latency_) menjadi lambat (bisa bermenit-menit).
    

## B. Solusi Utama: Index & B-Tree
### 1. Apa itu Index?

Index adalah struktur data terpisah yang dibuat oleh mesin database (seperti InnoDB) untuk memetakan nilai kolom tertentu langsung ke lokasi fisik baris data di memori/disk.
### 2. Cara Kerja B-Tree (Balanced Tree)

Secara bawaan, Index di MySQL menggunakan struktur data **B-Tree**.

```plaintext
                  [ 50 ]
                /        \
         [ 20 ]            [ 80 ]
        /      \          /      \
    [10, 15]  [30, 40]  [60, 70]  [90, 100]
```

- **Kompleksitas Waktu:** $\mathcal{O}(\log N)$.
    
- **Prinsip Kerja:** Data disimpan dalam kondisi selalu terurut secara hierarkis. Jika mencari data ber-ID `70`, MySQL tidak membaca dari angka `1`, melainkan:
      
    1. Cek Root (`50`): `70` lebih besar dari `50` $\rightarrow$ Lempar ke cabang kanan.
        
    2. Cek Node (`80`): `70` lebih kecil dari `80` $\rightarrow$ Lempar ke cabang kiri (`60, 70`).
        
    3. Ketemu dalam **3 langkah**, bukan 70 langkah!
        

## C. Cara Membuat Index di MySQL

```sql
-- 1. Membuat Index pada kolom tunggal
CREATE INDEX idx_products_price ON products(price);

-- 2. Membuat Composite Index (Index gabungan beberapa kolom)
CREATE INDEX idx_category_price ON products(category_id, price);

-- 3. Menghapus Index
DROP INDEX idx_products_price ON products;
```

## D. Membaca Execution Plan dengan `EXPLAIN`

Untuk menganalisis bagaimana MySQL akan mengeksekusi query kita, tambahkan kata kunci **`EXPLAIN`** di depan query `SELECT`.

```sql
EXPLAIN SELECT p.name, p.price 
FROM products p 
WHERE p.price > 500000;
```

### Indikator Kunci Hasil `EXPLAIN`:

| **Kolom**           | **Arti / Indikator**                         | **Nilai yang Dicari**                                                  |
| ------------------- | -------------------------------------------- | ---------------------------------------------------------------------- |
| **`type`**          | Metode pencarian data oleh MySQL.            | **`const`**, **`eq_ref`**, **`ref`**, **`range`** (Hindari **`ALL`**). |
| **`possible_keys`** | Daftar Index yang tersedia dan bisa dipakai. | Menampilkan nama Index yang cocok.                                     |
| **`key`**           | Index yang _benar-benar dipilih_ oleh MySQL. | Jika `NULL`, artinya query berjalan **tanpa Index**.                   |
| **`rows`**          | Est. jumlah baris yang diperiksa MySQL.      | Semakin kecil angkanya, semakin cepat query-nya.                       |
| **`Extra`**         | Informasi tambahan dari optimizer.           | Hindari **`Using filesort`** atau **`Using temporary`** berlebih.      |

## E. Hal yang Membuat Index Menjadi Rusak / Tidak Bekerja (Index Invalidation)

Meskipun kolom sudah diberi Index, penggunaan sintaks tertentu di klausa `WHERE` dapat menyebabkan MySQL mengabaikan Index tersebut dan kembali ke **Full Table Scan**:

1. **Menggunakan Fungsi pada Kolom:**
    - ❌ `WHERE YEAR(created_at) = 2026` _(Index rusak/diabaikan)_
        
    - ✅ `WHERE created_at >= '2026-01-01' AND created_at < '2027-01-01'` _(Index terpakai)_
        
2. **Wildcard `%` di Awal String (`LIKE`):**
    - ❌ `WHERE name LIKE '%Phone'` _(Index diabaikan karena MySQL tidak tahu karakter awalnya)_
        
    - ✅ `WHERE name LIKE 'Phone%'` _(Index terpakai)_
        
3. **Implisit Type Conversion (Beda Tipe Data):**
    - Jika kolom `phone_number` bertipe `VARCHAR`, namun di-query menggunakan angka tanpa kutip:
        
    - ❌ `WHERE phone_number = 081234567` _(Index diabaikan)_
        
    - ✅ `WHERE phone_number = '081234567'` _(Index terpakai)_