## A. Konsep Dasar JOIN
JOIN digunakan untuk menggabungkan data dari 2 tabel atau lebih berdasarkan kolom relasi (Primary Key & Foreign Key).

## B. Urutan Eksekusi Logis MySQL
1. `FROM` & `JOIN`: Membentuk **Tabel Bayangan (Tabel Sementara)** di memori RAM.
2. `WHERE`: Menyaring baris data dari Tabel Bayangan tersebut.
3. `SELECT`: Memilih kolom mana saja yang ingin ditampilkan ke layar.

---

## C. Jenis-Jenis JOIN Utama

### 1. INNER JOIN
Hanya mengambil data yang Memiliki Pasangan di KEDUA tabel.
- Sintaks:
```sql
  SELECT p.name, c.name 
  FROM products p
  INNER JOIN categories c ON p.category_id = c.id;
```

### 2. LEFT JOIN
Mengambil SELURUH data dari tabel KIRI (`products`), meskipun tidak punya pasangan di tabel KANAN (`categories`).
- **Catatan Penting (Tabel Bayangan):** Jika `p.category_id` tidak ditemukan di `c.id` (misal nilai NULL atau ID tidak ada), MySQL akan mencetak baris produk tersebut dan **memaksa seluruh kolom `c.*` bernilai `NULL`** pada Tabel Bayangan.
- Sintaks:
 ```sql
    SELECT p.name, c.name 
    FROM products p
    LEFT JOIN categories c ON p.category_id = c.id;
 ```
   
## D. Trik Deteksi Data Tanpa Relasi (`c.id IS NULL`)
Untuk mencari produk yang **TIDAK PUNYA KATEGORI** (atau kategorinya hilang/invalid):

```sql
SELECT p.name, p.price
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
WHERE c.id IS NULL;
```

### Mengapa menggunakan `c.id IS NULL` bukannya `p.category_id IS NULL`?

- `c.id IS NULL` melihat ke **Tabel Bayangan** hasil JOIN.
- Ini menjadi bukti mutlak bahwa proses pencarian/pencocokan ke tabel `categories` **GAGAL** (termasuk jika `p.category_id` diisi angka asal yang tidak ada di tabel kategori).

