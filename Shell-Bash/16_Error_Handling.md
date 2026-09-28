**1. set -e**
1. **Fungsi Utama:** Menginstruksikan shell untuk langsung menghentikan dan keluar (_exit_) dari skrip jika ada perintah yang menghasilkan _exit status_ tidak nol (non-zero/error).
2. **Tujuan:** Memastikan eksekusi skrip segera terhenti begitu terjadi kesalahan, sehingga mencegah perintah-perintah berikutnya berjalan dengan hasil data yang salah atau tidak lengkap.
3. **Praktik Umum:** Biasanya diletakkan di baris paling awal skrip untuk menerapkan pemeriksaan kesalahan yang lebih ketat (_stricter error checking_).

Contoh: 
```bash 
#!/bin/bash
set -e

# Perintah ini gagal (exit code non-zero)
cd /folder/yang/tidak/ada

# Baris di bawah ini TIDAK AKAN PERNAH dieksekusi
echo "Menghapus isi folder..."
rm -rf *
```

**2. set -o**
1. **Fungsi Utama:** Memodifikasi opsi shell untuk mengontrol cara shell menginterpretasikan perintah, menangani kesalahan (_error_), dan melakukan tugas lainnya.
2. **Fleksibilitas:** Memungkinkan penyesuaian lingkungan shell sesuai kebutuhan dengan mengaktifkan fitur seperti _error handling_, _debugging_, serta aturan eksekusi perintah yang lebih ketat (_strict execution_).

Opsi dapat diaktifkan menggunakan `set -o [nama_opsi]` dan dinonaktifkan menggunakan `set +o [nama_opsi]`.

```bash
#!/bin/bash
set -o errexit   # Hentikan skrip jika ada perintah yang error
set -o nounset   # Hentikan skrip jika ada variabel belum didefinisikan
set -o pipefail  # Hentikan skrip jika ada perintah dalam pipe (|) yang error
```

**3. set -u**
1. **Fungsi Utama:** Menyebabkan skrip langsung berhenti dan keluar secara otomatis jika mencoba menggunakan variabel yang belum diberi nilai.
2. **Manfaat:** Membantu mendeteksi potensi _bug_ atau kesalahan yang disebabkan oleh salah ketik (_typo_) nama variabel atau variabel yang lupa diisi nilainya.
3. **Tujuan Akhir:** Meningkatkan keandalan dan ketahanan (_robustness_) skrip shell.

**4. trap**
1. **Definisi Sinyal (_Signal_):** Pemberitahuan yang dikirimkan oleh sistem ke proses skrip untuk menandai suatu kejadian, seperti pembatalan (_interruption_), penghentian (_termination_), atau _error_.
2. **Fungsi `trap`:** Memungkinkan pembuatan penanganan khusus (_custom handler_) yang akan dieksekusi secara otomatis begitu sinyal tertentu diterima.
3. **Manfaat Utama:**
    - **Pembersihan Sumber Daya (_Cleanup Resources_):** Menghapus file sementara (_temporary files_) atau menutup koneksi sebelum skrip berhenti.
    - **Penanganan Aman (_Graceful Handling_):** Memastikan skrip dapat berhenti atau memulihkan diri dengan rapi saat diinterupsi oleh pengguna atau sistem.

|**Nama Sinyal**|**Kode**|**Pemicu / Keterangan**|
|---|---|---|
|**`EXIT`**|0|Dipanggil saat skrip keluar/selesai (baik sukses maupun _error_).|
|**`INT`** (_Interrupt_)|2|Pengguna menekan tombol `Ctrl+C`.|
|**`TERM`** (_Terminate_)|15|Perintah `kill` standar dikirim ke skrip.|
|**`ERR`**|-|Dipanggil setiap kali ada perintah yang bernilai _error_ (non-zero exit code).|

Contoh: 
```bash
#!/bin/bash

# Buat file sementara
TEMP_FILE=$(mktemp)
echo "File sementara dibuat di $TEMP_FILE"

# Definisikan fungsi cleanup
cleanup() {
    echo -e "\n[!] Menerima sinyal dihentikan. Menghapus file sementara..."
    rm -f "$TEMP_FILE"
    exit 1
}

# Pasang trap untuk menangkap sinyal INT (Ctrl+C) dan TERM (Kill)
trap cleanup INT TERM

# Simulasi proses berjalan lama
echo "Proses sedang berjalan (Tekan Ctrl+C untuk membatalkan)..."
sleep 10

# Hapus file jika berjalan hingga selesai secara normal
rm -f "$TEMP_FILE"
```

**5. Error Logging**
1. **Definisi:** Proses mencatat kesalahan (_error_) yang terjadi selama skrip atau program dijalankan.
2. **Informasi yang Dicatat:** Mengumpulkan detail penting seperti jenis kesalahan, waktu kejadian (_timestamp_), dan lokasi baris kode tempat kesalahan terjadi.
3. **Manfaat Utama:**
    - Memudahkan proses pemecahan masalah (_debugging_) dan pelacakan error (_troubleshooting_).
    - Membantu memantau kesehatan aplikasi (_application health_) melalui catatan riwayat masalah (_historical record_).

Contoh: 
```bash
#!/bin/bash

# Menentukan lokasi file log
LOG_FILE="error.log"

# Mencoba mengakses folder yang tidak ada dan mengalihkan error ke file log
cd /folder/tidak/ada 2>> "$LOG_FILE"

# Mencoba menghapus file yang tidak ada
rm file_palsu.txt 2>> "$LOG_FILE"
```

