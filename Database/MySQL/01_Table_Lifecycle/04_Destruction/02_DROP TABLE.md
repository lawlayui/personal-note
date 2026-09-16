`DROP` digunakan ketika Anda ingin **menghapus seluruh tabel beserta strukturnya** secara permanen dari database.

```sql
DROP TABLE nama_tabel;
```

#### Penggunaan Aman (`IF EXISTS`)
Untuk mencegah error jika tabel yang ingin dihapus ternyata sudah tidak ada, gunakan klausa `IF EXISTS`:
```sql
DROP TABLE IF EXISTS nama_tabel;
```

**Karakteristik Utama `DROP`:**
- **Penghapusan Total:** Baik isi baris data maupun definisi struktur tabel akan dihapus secara penuh dari sistem.
- **Tidak Bisa Dibatalkan:** Setelah dijalankan, tabel tidak dapat dikembalikan lagi (kecuali Anda memiliki file cadangan/backup).

|**Fitur**|**DELETE FROM**|**TRUNCATE TABLE**|**DROP TABLE**|
|---|---|---|---|
|**Objek Dihapus**|Baris data tertentu (pakai `WHERE`)|Seluruh baris data|Seluruh data + Struktur tabel|
|**Struktur Tabel**|Tetap Ada|Tetap Ada|**Hilang**|
|**Hitungan Auto-Increment**|Lanjut dari angka terakhir|**Direset ke 1**|**Hilang**|
|**Kecepatan**|Lambat|Sangat Cepat|Sangat Cepat|