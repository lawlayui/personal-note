Digunakan ketika ada kebutuhan data baru pada tabel.

```sql
-- Menambahkan kolom email pada tabel yang sudah ada
ALTER TABLE pelanggan 
ADD email VARCHAR(100);

-- Menambahkan kolom dengan constraint DEFAULT
ALTER TABLE produk 
ADD status_aktif BOOLEAN DEFAULT TRUE;
```
	