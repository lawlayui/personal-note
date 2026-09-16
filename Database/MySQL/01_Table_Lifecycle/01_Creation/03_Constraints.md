### 5 Batasan Utama Tabel MySQL
- **`NOT NULL`**: Memastikan kolom tidak boleh kosong. Kolom wajib diisi data (contoh: _Nama_, _Email_).
- **`UNIQUE`**: Memastikan seluruh nilai dalam satu kolom berbeda satu sama lain, tidak boleh ada yang kembar (contoh: _Email_, _Nomor HP_).
- **`PRIMARY KEY`**: Kombinasi dari `NOT NULL` dan `UNIQUE`. Digunakan sebagai pengenal utama yang unik untuk setiap baris data (contoh: _ID_Siswa_, _NIM_).
- **`FOREIGN KEY`**: Menghubungkan kolom di tabel ini dengan `PRIMARY KEY` di tabel lain untuk menjaga relasi data.
- **`DEFAULT`**: Memberikan nilai otomatis jika saat pengisian data kolom tersebut dikosongkan (contoh: status akun otomatis berisi `'AKTIF'`).