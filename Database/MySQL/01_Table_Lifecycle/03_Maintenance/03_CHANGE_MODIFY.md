**1. MODIFY COLUMN**
Gunakan `MODIFY` jika **nama kolom tetap sama**, tetapi tipe data atau batasannya ingin diubah.

```sql
-- Mengubah kapasitas karakter nama_produk dari VARCHAR(100) menjadi VARCHAR(150)
ALTER TABLE produk 
MODIFY COLUMN nama_produk VARCHAR(150) NOT NULL;
```

**2. CHANGE COLUMN**
Gunakan `CHANGE` jika ingin **mengubah nama kolom** (dan opsional sekaligus merubah tipe datanya).

```sql
-- Mengubah nama kolom 'harga' menjadi 'harga_satuan'
ALTER TABLE produk 
CHANGE COLUMN harga harga_satuan DECIMAL(10, 2);
```

**3. RENAME TO**
Digunakan untuk mengganti nama tabel itu sendiri.

```sql
-- Mengubah nama tabel produk menjadi master_produk
ALTER TABLE produk 
RENAME TO master_produk;
```

