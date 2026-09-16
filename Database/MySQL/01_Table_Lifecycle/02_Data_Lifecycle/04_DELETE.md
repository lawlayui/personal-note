Perintah `DELETE` digunakan untuk menghapus satu atau beberapa baris data dari tabel.

> **PENTING:** Sama seperti `UPDATE`, selalu gunakan `WHERE` untuk menentukan data mana yang ingin dihapus. Tanpa `WHERE`, seluruh data dalam tabel akan terhapus bersih.

```sql
-- Menghapus data produk dengan id = 3
DELETE FROM produk WHERE id = 3;

-- Menghapus produk yang stoknya 0
DELETE FROM produk WHERE stok = 0;
```
