- **Definisi:** Manajemen proses adalah pengontrolan dan pemantauan eksekusi program di dalam sistem operasi.
    
- **Tugas-tugas utama:** Pembuatan proses baru, penjadwalan eksekusi, pengalokasian sumber daya (_resources_), dan penanganan komunikasi antar-proses (_inter-process communication_).
    
- **Tujuan/Manfaat:** Memastikan penggunaan sumber daya sistem yang efisien serta mencegah konflik di antara program-program yang sedang berjalan.

**1. `jobs`**
- **Pengertian _Job_:** Proses atau sekelompok proses yang berjalan di _foreground_ (latar depan) atau _background_ (latar belakang) pada _shell_.
    
- **Fungsi Perintah `jobs`:** Menampilkan daftar _job_ yang sedang aktif, memeriksa statusnya (berjalan, dihentikan/ditahan, atau diakhiri), serta mengelolanya.
    
- **Manfaat/Tujuan:** Menjadi alat penting untuk memantau dan mengendalikan proses-proses yang dijalankan langsung dari terminal/_shell_.

| **Opsi / Flag** | **Nama**       | **Fungsi / Kegunaan**                                                                       | **Contoh Output**                             |
| --------------- | -------------- | ------------------------------------------------------------------------------------------- | --------------------------------------------- |
| **`jobs -l`**   | _Long Listing_ | Menampilkan informasi lengkap termasuk **PID** (_Process ID_) dari setiap job.              | `[1]+ 12345 Running sleep 100 &`              |
| **`jobs -p`**   | _PID Only_     | Hanya menampilkan nomor **PID** saja tanpa teks/status lain (sering digunakan dalam skrip). | `12345`                                       |
| **`jobs -r`**   | _Running Only_ | Hanya menampilkan job yang statusnya sedang **berjalan** (_Running_).                       | `[1]+ Running sleep 100 &`                    |
| **`jobs -s`**   | _Stopped Only_ | Hanya menampilkan job yang sedang **ditangguhkan/dihentikan** (_Stopped_).                  | `[2]+ Stopped nano file.txt`                  |
| **`jobs -n`**   | _Changed Only_ | Hanya menampilkan job yang statusnya **baru berubah** sejak pemberitahuan terakhir.         | _(Menampilkan job yang baru selesai/berubah)_ |
**2. `fg` dan `bg`**
Perintah `fg` digunakan untuk **mengembalikan proses yang ada di latar belakang (_background_) atau yang sedang ditangguhkan (_stopped_) ke latar depan (_foreground_)**, sehingga kamu dapat berinteraksi kembali dengan perintah tersebut secara langsung.

| **Perintah / Parameter**   | **Fungsi**                                                              | **Contoh Penggunaan** |
| -------------------------- | ----------------------------------------------------------------------- | --------------------- |
| **`fg`** (tanpa parameter) | Memindahkan _current job_ (job paling akhir/tanda `+`) ke _foreground_. | `fg`                  |
| **`fg %<nomor>`**          | Memindahkan job nomor tertentu ke _foreground_.                         | `fg %1`               |
| **`fg %<teks>`**           | Memindahkan job yang namanya diawali teks tersebut ke _foreground_.     | `fg %nano`            |
| **`fg %-`**                | Memindahkan _previous job_ (job sebelum _current job_) ke _foreground_. | `fg %-`               |

Perintah `bg` digunakan untuk **melanjutkan eksekusi proses yang sedang ditangguhkan (_stopped_) agar berjalan di latar belakang (_background_)**, sehingga terminal bebas dan bisa kamu gunakan kembali untuk mengetik perintah lain.

| **Perintah / Parameter**   | **Fungsi**                                                                        | **Contoh Penggunaan** |
| -------------------------- | --------------------------------------------------------------------------------- | --------------------- |
| **`bg`** (tanpa parameter) | Melanjutkan _current job_ yang statusnya _stopped_ agar berjalan di _background_. | `bg`                  |
| **`bg %<nomor>`**          | Melanjutkan job nomor tertentu di _background_.                                   | `bg %2`               |
| **`bg %<teks>`**           | Melanjutkan job yang namanya diawali teks tersebut di _background_.               | `bg %sleep`           |
| **`bg %-`**                | Melanjutkan _previous job_ di _background_.                                       | `bg %-`               |

**3. `nohup`**
- **Pengertian `nohup`:** Perintah utilitas _command-line_ yang membuat suatu proses kebal terhadap sinyal pemutusan sambungan (_hangup signal_ / `SIGHUP`).
    
- **Pengalihan Output (_Redirection_):** Secara otomatis mengalihkan _output_ dari proses tersebut ke dalam sebuah file (biasanya `nohup.out`).
    
- **Manfaat/Tujuan:** Memungkinkan proses (terutama tugas-tugas berdurasi panjang) untuk terus berjalan tanpa terinterupsi saat koneksi terminal terputus atau saat jendela terminal ditutup.

```
nohup [perintah-utama] [argumen/opsi] &
```

**4. `disown`**
- **Pengertian `disown`:** Perintah internal _shell_ yang digunakan untuk menghapus suatu _job_ (proses) dari daftar manajemen _job_ milik _shell_.
    
- **Cara Kerja:** Menghilangkan keterikatan proses dari _shell_, sehingga saat terminal ditutup, _shell_ tidak akan mengirimkan sinyal pemutusan (_SIGHUP_) ke proses tersebut.
    
- **Tujuan/Manfaat:** Memungkinkan proses latar belakang (_background process_) untuk terus berjalan secara mandiri tanpa terpengaruh oleh penutupan terminal.

```bash
# 1. Jalankan perintah biasa
ping google.com

# 2. Kamu sadar ini lama, tekan Ctrl + Z untuk menunda
# 3. Pindahkan ke background
bg %1

# 4. Lepaskan proses dari kendali shell
disown %1
```

**5. Process Subtition**
- **Pengertian:** Fitur yang memungkinkan _output_ dari suatu proses/perintah diperlakukan seolah-olah seperti sebuah file fisik.
    
- **Cara Kerja:** Sistem membuat file sementara atau _pipe_, menyambungkan _standard output_ dari perintah ke dalamnya, lalu menggantikan nama file sementara tersebut ke dalam baris perintah.
    
- **Manfaat/Tujuan:** Memungkinkan perintah yang membutuhkan argumen berupa file untuk membaca langsung _output_ dari perintah lain. Ini sangat berguna ketika suatu perintah membutuhkan beberapa masukan file sekaligus atau saat ingin membandingkan _output_ dari dua perintah yang berbeda (seperti menggunakan perintah `diff`).

**5.1. Input Process Substitution `<(command)`**
Mengubah output perintah menjadi **file virtual untuk dibaca**. Digunakan saat perintah utama wajib menerima input berupa file.

```bash
# Perintah 'diff' membandingkan 2 file virtual dari hasil 'ls'
diff <(ls folder_A) <(ls folder_B)
```

**5.2. Output Process Substitution `>(command)`**
Mengalirkan output dari perintah utama ke **file virtual untuk diproses** oleh perintah di dalam kurung.

```bash
# 'tee' menulis ke file virtual, lalu diproses oleh 'grep'
echo "ERROR: System Failure" | tee >(grep "ERROR" > log_error.txt)
```