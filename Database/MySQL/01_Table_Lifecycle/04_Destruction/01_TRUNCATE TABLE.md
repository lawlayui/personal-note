`TRUNCATE` digunakan ketika Anda ingin **menghapus semua baris data** di dalam tabel, tetapi **struktur tabelnya tetap dipertahankan**.

```sql 
TRUNCATE TABLE nama_tabel;
```

**Karakteristik Utama `TRUNCATE`:**
- **Mengosongkan Tabel:** Semua isi tabel hilang seketika, namun tabel itu sendiri masih ada dan siap diisi data baru.
- **Mereset `AUTO_INCREMENT`:** Angka hitungan urutan ID akan diulang kembali dari awal (`1`).
- **Sangat Cepat:** Prosesnya jauh lebih cepat daripada menjalankan perintah `DELETE FROM nama_tabel;` tanpa klausa `WHERE`, karena `TRUNCATE` pada dasarnya menimpa ulang tabel tersebut.

