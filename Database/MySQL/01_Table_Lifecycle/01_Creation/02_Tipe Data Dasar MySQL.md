- **Angka (Numeric)**
    - **`INT`**: Angka bulat tanpa desimal (contoh: ID, umur, jumlah stok).
    - **`DECIMAL(p, s)`**: Angka desimal presisi untuk nilai finansial/uang (contoh: `DECIMAL(10, 2)` untuk harga hingga puluhan juta dengan 2 angka di belakang koma).

- **Teks (String)**
    - **`VARCHAR(n)`**: Teks dengan panjang dinamis hingga `n` karakter. Sangat hemat memori (contoh: `VARCHAR(100)` untuk Nama, Email).
    - **`TEXT`**: Teks panjang tanpa batasan pasti (contoh: deskripsi produk, alamat lengkap).

- **Waktu (Date & Time)**
    - **`DATE`**: Menyimpan tanggal saja dengan format `YYYY-MM-DD`.
    - **`DATETIME`**: Menyimpan tanggal dan waktu lengkap dengan format `YYYY-MM-DD HH:MM:SS`.

- **Pilihan Logika (Boolean)**
    - **`BOOLEAN`**: Nilai kebenaran (`TRUE` atau `FALSE` / `1` atau `0`).