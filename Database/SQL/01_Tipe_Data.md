**1. Tipe Numerik**
- INTEGER
	Digunakan untuk menyimpan data numerik berupa bilangan bulat.
- DECIMAL(p, s)
	Precision (p): Menentukan jumlah total digit angka yang dapat disimpan, baik digit di sebelah kiri maupun di sebelah kanan tanda koma (desimal).
	
	Scale (s): Menentukan jumlah digit angka khusus untuk bagian desimal (di sebelah kanan tanda koma).

**2. Tipe Karakter**
- CHAR(n) (Fixed-Length / Panjang Tetap):
	Mengalokasikan ruang sesuai batas n secara tetap, berapa pun panjang teks yang dimasukkan.
	
	Jika teks kurang dari n, SQL akan menambahkan space (spasi kosong) di belakangnya sampai panjangnya persis n.
	
	Penggunaan: Cocok untuk data yang panjangnya selalu pasti (contoh: Kode Pos [5 digit], Jenis Kelamin ['L'/'P'], atau Nomor NIK).

- VARCHAR(n) (Variable-Length / Panjang Bervariasi):
	Mengalokasikan ruang hanya sebanyak karakter teks yang sebenarnya dimasukkan (plus sedikit overhead untuk mencatat panjang teks), dengan batas maksimum n.
	
	Jika menyimpan teks yang pendek, ukuran file penyimpanan akan otomatis menyesuaikan menjadi lebih kecil.
	
	Penggunaan: Cocok untuk data yang panjangnya bervariasi (contoh: Nama lengkap, alamat email, atau judul artikel).

- TEXT
	Panjang karakter tidak dibatasi.

**3. Tipe Tanggal dan Waktu**

| Tipe Data | Format Standar      | Contoh              |
| --------- | ------------------- | ------------------- |
| DATE      | YYYY-MM-DD          | 2026-10-01          |
| TIME      | HH:MM:SS            | 14:30:00            |
| DATETIME  | YYYY-MM-DD HH:MM:SS | 2026-10-01 14:30:00 |
| TIMESTAMP | YYYY-MM-DD HH:MM:SS | 2026-10-01 14:30:00 |
**4. Tipe Biner**
- BINARY(n): Menyimpan data biner dengan panjang tetap sebesar n byte.

- VARBINARY(n): Menyimpan data biner dengan panjang bervariasi sesuai isi data, hingga batas n byte.

- BLOB (Binary Large Object): Digunakan untuk data biner yang sangat besar.

- Penggunaan: Cocok untuk menyimpan file media (gambar, audio, dokumen), kunci enkripsi, atau data terkompresi.

**5. Tipe Boolean (BOOLEAN / BOOL)**
Tipe data ini digunakan untuk merepresentasikan nilai kebenaran logika.
- Nilai: Hanya memiliki dua nilai utama, yaitu TRUE (benar) atau FALSE (salah).