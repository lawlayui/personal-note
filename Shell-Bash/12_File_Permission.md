1. **Fungsi Utama:** Mengontrol siapa yang dapat mengakses dan mengubah file serta direktori.
2. **Kategori Pengguna (3 Kelompok):**
    - **Owner** (pemilik file)
    - **Group** (kelompok pengguna)
    - **Others** (pengguna lainnya/publik)

3. **Jenis Izin Akses:** Setiap kategori dapat memiliki hak akses berupa **Read** (membaca), **Write** (menulis/mengubah), dan **Execute** (menjalankan/mengeksekusi).

**1. Struktur Izin**
Saat menggunakan command `ls -l` akan muncul di baris paling awal `- rwx r-x r--` ini adalah. Bentuknya adalah user - group - other. 

| **Simbol** | **Kepanjangan** | **Arti pada File**                  | **Arti pada Direktori**                            | **Nilai Oktal** |
| ---------- | --------------- | ----------------------------------- | -------------------------------------------------- | --------------- |
| **`r`**    | _Read_          | Buka & baca isi file                | Lihat daftar file di dalam folder (`ls`)           | **4**           |
| **`w`**    | _Write_         | Edit / ubah isi file                | Tambah, hapus, atau ubah nama file di dalam folder | **2**           |
| **`x`**    | _Execute_       | Jalankan file sebagai skrip/program | Masuk ke dalam folder (`cd`)                       | **1**           |
| **`-`**    | _No Permission_ | Tidak memiliki hak akses            | Tidak memiliki hak akses                           | **0**           |
**2. Chmod** 
Perintah `chmod` digunakan untuk mengatur hak akses (_file permissions_). Setiap hak akses (`r`, `w`, `x`) memiliki nilai berbasis biner (kelipatan 2):
- **`x`** (_execute_) = **1**
- **`w`** (_write_) = **2**
- **`r`** (_read_) = **4**

Nilai-nilai ini dijumlahkan untuk menentukan tingkat akses:
- **7** (4 + 2 + 1) : Akses penuh (_full permission_).
- **6** (4 + 2) : Akses _read_ dan _write_ saja.

**Contoh Penggunaan:**
```bash
chmod 755 nama_file
```

**Penjelasan Angka (`755`):**
- **`7` (Owner)** : Memiliki akses penuh (_read_, _write_, _execute_).
- **`5` (Group)** : Hanya memiliki akses _read_ dan _execute_ (4 + 1).
- **`5` (Others)** : Hanya memiliki akses _read_ dan _execute_ (4 + 1).

**3. Chown**
Perintah **`chown`** (singkatan dari _change owner_) digunakan untuk mengubah **pemilik (_owner_)** dan/atau **grup (_group_)** dari suatu file atau direktori di Linux/Unix.

```bash
chown [PEMILIK_BARU]:[GRUP_BARU] nama_file_atau_direktori
```

| **Perintah**                                | **Fungsi / Efek**                                                                      |
| ------------------------------------------- | -------------------------------------------------------------------------------------- |
| **`chown budi file.txt`**                   | Mengubah pemilik `file.txt` menjadi **budi**.                                          |
| **`chown :developers file.txt`**            | Mengubah grup `file.txt` menjadi **developers** (tanpa mengubah pemilik).              |
| **`chown budi:developers file.txt`**        | Mengubah pemilik menjadi **budi** sekaligus grup menjadi **developers**.               |
| **`chown -R budi:developers /path/folder`** | Mengubah pemilik & grup folder beserta **seluruh isinya secara rekursif** (flag `-R`). |