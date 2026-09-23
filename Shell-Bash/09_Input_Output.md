
**1. Here Strings**
- **Fungsi Utama:** Mengirimkan _string_ satu baris langsung ke perintah yang membutuhkan _stdin_, tanpa perlu membuat file sementara atau mengetik input secara manual.
- **Sintaks Singkat:** Merupakan bentuk sederhana dari _Here Documents_ (EOF/HEREDOC) yang dirancang khusus untuk masukan baris tunggal (_inline_).
- **Operator:** Menggunakan simbol **`<<<`** untuk menyalurkan teks ke perintah tersebut.

Contoh: 

```bash 
#!/bin/bash

pesan="ERROR 404: Page Not Found"

# 1. Mengirim variabel langsung ke grep
grep "ERROR" <<< "$pesan"

# 2. Mengirim string teks langsung ke kalkulator 'bc'
bc <<< "10 + 20 * 3"
```

**2. Here Document**
- **Definisi:** Heredoc adalah metode untuk mengalihkan (_redirect_) masukan teks **multi-baris** ke sebuah perintah secara langsung.
- **Fungsi Utama:** Digunakan untuk memasukkan blok teks panjang atau data konfigurasi langsung di dalam skrip, tanpa perlu membaca dari file eksternal atau mengetiknya manual di terminal.
- **Kegunaan:** Sangat berguna ketika perlu mengirimkan teks berbaris-baris (seperti template pesan atau konfigurasi) ke perintah seperti `cat`, `mail`, atau skrip lainnya.

Contoh: 

```bash 
#!/bin/bash

nama="Budi"
server="Production-01"

# Mengirimkan teks multi-baris ke perintah 'cat'
cat << EOF
=======================================
           LAPORAN SERVER
=======================================
Administrator : $nama
Nama Server   : $server
Status        : Running

Catatan:
Sistem berjalan normal tanpa kendala.
=======================================
EOF
```

**3. Reading User Input**
- **Fungsi Utama:** Memungkinkan skrip untuk berinteraksi secara langsung dengan pengguna yang menjalankannya.
- **Cara Kerja:** Skrip akan menghentikan eksekusi sementara (_pause_) untuk menunggu pengguna mengetikkan teks dan menekan tombol **Enter**.
- **Pemanfaatan Data:** Teks yang dimasukkan pengguna disimpan ke dalam variabel untuk digunakan nanti, seperti menentukan keputusan (_logic/decision making_) atau menampilkan teks yang dipersonalisasi.

Contoh: 

```bash 
#!/bin/bash

# Meminta input nama
echo -n "Masukkan nama Anda: "
read nama

# Menggunakan variabel dari input
echo "Halo, $nama! Selamat datang di Bash scripting."
```

**Flag Penting**

|**Flag**|**Fungsi**|**Contoh Penggunaan**|
|---|---|---|
|**`-p`**|Menampilkan _prompt_ (pesan) secara langsung tanpa perlu `echo` terpisah.|`read -p "Umur Anda: " umur`|
|**`-s`**|_Silent mode_ (menyembunyikan ketikan, sangat cocok untuk **password**).|`read -sp "Password: " password`|
|**`-t`**|Batas waktu (_timeout_) dalam detik. Jika waktu habis, perintah otomatis batal.|`read -t 5 -p "Jawab (5 detik): " jawab`|
|**`-a`**|Membaca beberapa input sekaligus dan menyimpannya ke dalam bentuk **array**.|`read -a list_buah`|
