Perintah `INSERT` digunakan untuk menambah baris data baru ke dalam tabel.

**1. Sintaks Standar (Menyebutkan Kolom)**
Sangat disarankan selalu menyebutkan nama kolom yang ingin diisi agar aman dari perubahan struktur tabel di masa depan.

```sql
INSERT INTO nama_tabel (kolom1, kolom2, kolom3) 
VALUES ('nilai1', 'nilai2', nilai3);
```

- **Memasukan Banyak Data Sekaligus**

```sql
INSERT INTO produk (nama_produk, kode_sku, harga, stok) 
VALUES 
    ('Laptop Asus', 'SKU-001', 8500000.00, 10),
    ('Mouse Wireless', 'SKU-002', 150000.00, 25),
    ('Keyboard Mechanical', 'SKU-003', 450000.00, 15);
```
