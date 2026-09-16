* **Sintaks Dasar:** 
```sql
CREATE TABLE nama_tabel (
    nama_kolom_1 tipe_data constraint,
    nama_kolom_2 tipe_data constraint,
    ...
    PRIMARY KEY (nama_kolom_utama)
);
```

* ***Contoh Kasus Nyata:**
```sql
CREATE TABLE produk (
    id INT AUTO_INCREMENT,
    nama_produk VARCHAR(100) NOT NULL,
    kode_sku VARCHAR(20) UNIQUE,
    harga DECIMAL(10, 2) NOT NULL,
    stok INT DEFAULT 0,
    tanggal_dibuat DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);
```

 **Penjelasan Aturan Kolom Di Atas: 
- **`AUTO_INCREMENT`**: Mengisi angka ID secara otomatis bertambah (1, 2, 3, dst.).
- **`NOT NULL`**: `nama_produk` dan `harga` wajib diisi.
- **`UNIQUE`**: `kode_sku` tidak boleh ada yang sama antar-produk.
- **`DEFAULT 0`**: Jika stok tidak diisi, otomatis bernilai `0`.
- **`DEFAULT CURRENT_TIMESTAMP`**: Tanggal otomatis terisi waktu saat data dimasukkan.



