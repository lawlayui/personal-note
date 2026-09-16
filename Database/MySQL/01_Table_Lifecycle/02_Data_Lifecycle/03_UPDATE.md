Perintah `UPDATE` digunakan untuk memperbarui isi data pada satu atau beberapa kolom.

> **PENTING:** Selalu sertakan klausa `WHERE` saat menjalankan perintah `UPDATE`. Jika Anda lupa menyertakan `WHERE`, **seluruh baris data di dalam tabel akan ikut terubah!**

```sql
-- Mengubah harga dan stok produk yang memiliki id = 2
UPDATE produk 
SET harga = 135000.00, stok = 30 
WHERE id = 2;
```
