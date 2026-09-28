**1. `ps`**
- **Pengertian `ps`:** Perintah utilitas _command-line_ yang menyajikan gambaran singkat (_snapshot_) mengenai proses-proses yang sedang berjalan saat perintah dieksekusi.

- **Informasi yang Diberikan:** Menampilkan rincian proses seperti ID Proses (**PID**), penggunaan sumber daya (_resource usage_ seperti CPU/RAM), dan detail relevan lainnya.

- **Manfaat/Tujuan:** Memungkinkan pengguna dan administrator sistem untuk memantau aktivitas sistem serta mengidentifikasi proses yang mengonsumsi sumber daya berlebih atau menyebabkan masalah.

| **Perintah** | **Fungsi**                                                                               | **Output yang Dihasilkan**                                                                                        |
| ------------ | ---------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| **`ps u`**   | Menampilkan format berorientasi pengguna (_user-oriented_).                              | Menambahkan kolom **`%CPU`**, **`%MEM`**, **`VSZ`**, **`RSS`**, dan **`USER`** untuk proses di terminal saat ini. |
| **`ps aux`** | Menampilkan **seluruh proses** yang berjalan di sistem (semua user & background daemon). | Menampilkan daftar lengkap semua proses beserta penggunaan **`%CPU`** dan **`%MEM`**-nya.                         |
| **`ps -ef`** | Menampilkan seluruh proses dalam format standar Unix/Linux.                              | Menampilkan hirarki parent PID (PPID), TTY, dan waktu mulai (STIME).                                              |

contoh output `ps u`: 
```bash 
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
lawlayui 28434  0.0  0.1  10120  5100 pts/0    Ss   10:00   0:00 bash
lawlayui 28989  0.0  0.0   9800  3200 pts/0    R+   10:05   0:00 ps u
```

| **Kolom** | **Kepanjangan**       | **Penjelasan & Fungsi**                                                                                                                                                                                                                                                                                                                                                           |
| --------- | --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **TTY**   | _Teletypewriter_      | **Terminal tempat proses berjalan.**<br><br>  <br><br>• Menunjukkan jendela terminal atau sesi tempat perintah dieksekusi (contoh: `pts/0` berarti terminal emulasi/pseudo-terminal pertama).<br><br>  <br><br>• Jika bernilai `?` (tanda tanya), artinya proses tersebut berjalan sebagai _background daemon_ atau layanan sistem yang **tidak terikat pada terminal mana pun**. |
| **VSZ**   | _Virtual Memory Size_ | **Total memori virtual yang dialokasikan untuk proses (dalam Kilobyte/KB).**<br><br>  <br><br>• Angka ini mencakup seluruh memori yang diminta oleh proses, termasuk kode program, pustaka (_shared libraries_) yang dipakai bersama aplikasi lain, serta memori yang dicadangkan tetapi belum tentu aktif digunakan di RAM.                                                      |
| **RSS**   | _Resident Set Size_   | **Memori fisik (RAM asli) yang benar-benar digunakan oleh proses (dalam Kilobyte/KB).**<br><br>  <br><br>• Ini adalah indikator paling akurat untuk melihat berapa besar kapasitas RAM fisik komputer yang saat ini secara aktif dikonsumsi oleh proses tersebut.<br><br>  <br><br>• Angka ini tidak menghitung memori yang di-_swap_ ke disk.                                    |

**2. `free`**
- **Pengertian `free`:** Utilitas _command-line_ yang menampilkan gambaran singkat (_snapshot_) mengenai jumlah memori fisik (RAM) dan _swap memory_ yang terpakai maupun yang masih bebas.

- **Informasi yang Ditampilkan:** Menyajikan Rincian total memori, memori terpakai (_used_), memori bebas (_free_), _shared memory_, _buffer/cache_, serta memori yang tersedia (_available_).

- **Manfaat/Tujuan:** Penting untuk memahami seberapa efisien sistem menggunakan sumber daya memorinya dan membantu mengidentifikasi potensi kemacetan (_bottleneck_) pada memori.

| **Opsi** | **Kepanjangan / Nama** | **Fungsi & Deskripsi**                                                                          | **Contoh Perintah** |
| -------- | ---------------------- | ----------------------------------------------------------------------------------------------- | ------------------- |
| **`-h`** | _Human-readable_       | Mengubah format angka menjadi Megabyte (M) atau Gigabyte (G) secara otomatis agar mudah dibaca. | `free -h`           |
| **`-m`** | _Megabytes_            | Memaksa seluruh output angka ditampilkan dalam satuan Megabyte (MB).                            | `free -m`           |
| **`-g`** | _Gigabytes_            | Memaksa seluruh output angka ditampilkan dalam satuan Gigabyte (GB).                            | `free -g`           |
| **`-t`** | _Total_                | Menambahkan baris total gabungan antara RAM Fisik dan Swap di bagian paling bawah.              | `free -h -t`        |
| **`-s`** | _Seconds_              | Memantau RAM secara berulang (_live update_) setiap interval detik yang ditentukan.             | `free -h -s 2`      |
| **`-c`** | _Count_                | Menentukan jumlah perulangan pemantauan (digunakan bersama opsi `-s`).                          | `free -h -s 1 -c 5` |

Contoh output `free -h`: 
```
              total        used        free      shared  buff/cache   available
Mem:           7.7Gi       3.2Gi       2.5Gi       252Mi       2.5Gi       4.5Gi
Swap:          511Mi       3.3Mi       508Mi
```

**3. `uptime`**
- **Pengertian `uptime`:** Perintah _command-line_ yang menampilkan durasi atau seberapa lama sistem komputer telah menyala tanpa henti.

- **Informasi yang Ditampilkan:** Menyajikan ringkasan waktu saat ini, durasi sistem menyala, jumlah pengguna (_users_) yang sedang login, serta rata-rata beban sistem (_load average_) dalam rentang 1, 5, dan 15 menit terakhir.

- **Manfaat/Tujuan:** Penting untuk menilai kestabilan sistem secara cepat serta mengetahui tingkat penggunaan sumber daya pada komputer.

| **Komponen Output**               | **Nilai Kamu**     | **Penjelasan / Arti**                                                                                    |
| --------------------------------- | ------------------ | -------------------------------------------------------------------------------------------------------- |
| **Waktu Saat Ini**                | `19:46:39`         | Jam sistem saat perintah dieksekusi (pukul 19:46 lewat 39 detik).                                        |
| **Durasi Nyala (_Uptime_)**       | `up 3:20`          | Sistem telah menyala/beroperasi selama **3 jam 20 menit** sejak _booting_ atau dinyalakan terakhir kali. |
| **Jumlah Pengguna**               | `1 user`           | Ada **1 sesi pengguna** yang sedang aktif login ke sistem (yaitu terminal/sesi kamu saat ini).           |
| **Beban Sistem (_Load Average_)** | `0.77, 1.01, 1.03` | Rata-rata beban pemrosesan CPU dalam **1, 5, dan 15 menit terakhir**.                                    |