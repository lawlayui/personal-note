**1. `ping`**

Format: 
```bash
ping <alamat_ip_atau_domain>
```

Contoh output: 
```bash
Pinging google.com [142.250.190.46] with 32 bytes of data:
Reply from 142.250.190.46: bytes=32 time=18ms TTL=117
Reply from 142.250.190.46: bytes=32 time=20ms TTL=117
Reply from 142.250.190.46: bytes=32 time=19ms TTL=117
Reply from 142.250.190.46: bytes=32 time=21ms TTL=117

Ping statistics for 142.250.190.46:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 18ms, Maximum = 21ms, Average = 19ms
```

Komponen utama output: 
1. **`bytes=32`** Ukuran paket data ICMP yang dikirimkan ke server tujuan.
   
2. **`time=18ms` (Round-Trip Time / Latensi)** Waktu yang dibutuhkan paket data untuk pergi ke server dan kembali lagi ke komputer Anda (dalam milidetik).
   
   - **< 30 ms:** Sangat cepat (bagus untuk _online gaming_ dan _streaming_).
   - **30 – 100 ms:** Cukup baik untuk penggunaan internet sehari-hari.
   - **> 150 ms:** Latensi tinggi / koneksi terasa lambat (_lag_).
   
3. **`TTL=117` (Time to Live)** Batas angka lompatan (_hop_) antar perangkat jaringan/router sebelum paket data dihapus. Ini mencegah paket berputar selamanya di internet jika terjadi gangguan rute.
   
4. **Statistik Paket (`Packets: Sent, Received, Lost`)** Menunjukkan berapa banyak data yang terkirim dan diterima kembali.
   
   -  **0% loss:** Koneksi sangat stabil.
   -  **> 0% loss (Packet Loss):** Ada data yang hilang di tengah jalan. Hal ini menyebabkan koneksi terasa tersendat-sendat atau terputus-putus.

**2. `wget`**
Format: 
```
wget <URL>
```

Contoh: 
```
wget https://example.com/file.zip
```

  
| Kategori                     | Opsi / Flag                | Contoh Perintah                                       | Penjelasan & Kegunaan                                                                                                    |
| :--------------------------- | :------------------------- | :---------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------- |
| **Penyimpanan & Nama File**  | `-O <nama_file>`           | `wget -O laporan.pdf https://example.com/doc123.pdf`  | Mengubah nama file hasil unduhan menjadi nama baru yang ditentukan.                                                      |
|                              | `-P <direktori>`           | `wget -P ~/Downloads https://example.com/file.zip`    | Menentukan folder/direktori lokasi penyimpanan file hasil unduhan.                                                       |
|                              | `-c`                       | `wget -c https://example.com/file_besar.iso`          | Melanjutkan (*resume*) proses unduhan yang terputus sebelumnya.                                                          |
| **Otomatisasi & Proses**     | `-b`                       | `wget -b https://example.com/file_besar.iso`          | Menjalankan proses pengunduhan di latar belakang (*background*). Log akan disimpan di `wget-log`.                        |
|                              | `-i <file_teks>`           | `wget -i daftar_url.txt`                              | Mengunduh banyak file sekaligus berdasarkan daftar tautan/URL yang ditulis di file teks.                                 |
| **Batas & Koneksi**          | `--limit-rate=<kecepatan>` | `wget --limit-rate=500k https://example.com/file.zip` | Membatasi kecepatan pengunduhan agar tidak menguras bandwidth (misal: `500k` untuk 500 KB/s, `2m` untuk 2 MB/s).         |
|                              | `-t <jumlah>`              | `wget -t 5 https://example.com/file.zip`              | Menentukan batas percobaan ulang (*retries*) jika koneksi terputus (gunakan `-t 0` untuk tanpa batas).                   |
| **Web Scraping & Mirroring** | `-r`                       | `wget -r https://example.com/`                        | Mengunduh konten situs secara rekursif (mengikuti tautan internal di dalam halaman).                                     |
|                              | `--mirror` *(atau `-m`)*   | `wget --mirror https://example.com/`                  | Membuat salinan utuh (*mirror*) dari sebuah situs web (mengaktifkan rekursif, stempel waktu, dan tanpa batas kedalaman). |
|                              | `--accept=<ext>`           | `wget -r --accept=pdf,jpg https://example.com/`       | Hanya mengunduh file dengan ekstensi tertentu saat mengunduh secara rekursif.                                            |
|                              | `--reject=<ext>`           | `wget -r --reject=zip,tar https://example.com/`       | Mengabaikan/menolak file dengan ekstensi tertentu saat mengunduh secara rekursif.                                        |

  
| Kategori | Opsi / Flag | Contoh Perintah | Penjelasan & Kegunaan | 
| ----- | ----- | ----- | ----- | 
| **Header Request** | `--header="<header>"` | `wget --header="Content-Type: application/json" ...` | Menambahkan custom HTTP header pada permintaan (misal: `Content-Type` atau `Authorization`). | 
| **Metode HTTP** | `--method=<METHOD>` | `wget --method=PUT https://api.example.com/resource` | Mengubah metode permintaan HTTP (seperti `POST`, `PUT`, `DELETE`). | 
| **Kirim Data Form** | `--post-data="<string>"` | `wget --post-data="user=john&pass=123" https://example.com/login` | Mengirim data form berformat `application/x-www-form-urlencoded` menggunakan metode `POST`. | 
| **Kirim Data File** | `--post-file=<filepath>` | `wget --post-file=data.json https://api.example.com/endpoint` | Mengirim isi file secara utuh dalam bodi permintaan HTTP POST. |

**2. `scp`**
scp, singkatan dari *secure copy*, adalah utilitas baris perintah yang memungkinkan Anda mentransfer file secara aman antara *host* lokal dan *host* jarak jauh atau antara dua *host* jarak jauh. Utilitas ini menggunakan protokol SSH untuk transfer data, yang memastikan data dienkripsi selama transmisi sehingga terlindungi dari penyadapan. scp umumnya digunakan untuk tugas-tugas seperti mengunggah file situs web ke server, mencadangkan data ke lokasi jarak jauh, atau berbagi file antaranggota tim.

**2.1 Format: **

Menyalin file dari komputer lokal ke komputer sever jarak jauh.
```bash
scp <nama_file_lokal> <username>@<ip_remote>:<path_tujuan_remote>
```

Menyalin file dari server jarak jauh ke komputer lokal. 
```
scp <username>@<ip_remote>:<path_file_remote> <path_tujuan_lokal>
```

**2.2 Opsi Tambahan**
- **`-r` (Recursive):** Untuk mengunggah atau mengunduh **seluruh folder** beserta isinya.
 ```
  scp -r myfolder/ user@192.168.1.50:/home/user/
 ```

- **`-P <port>` (Port khusus):** Jika port SSH server bukan port standar (22).
 ```
   scp -P 2222 data.txt user@192.168.1.50:/home/user/
 ```
   
- **`-i <identity_file>`:** Jika login menggunakan kunci SSH (_SSH Private Key_) bukan password.
 ```
   scp -i ~/.ssh/my_key.pem data.txt user@192.168.1.50:/home/user/
 ```

 **3. `netstat`**

 **3.1 Format**
 ```bash
 ss [opsi] [filter]
 ```

 **3.2 Opsi**

| **Opsi** | **Fungsi**                                                                                       |
| -------- | ------------------------------------------------------------------------------------------------ |
| **`-t`** | Menampilkan koneksi **TCP**                                                                      |
| **`-u`** | Menampilkan koneksi **UDP**                                                                      |
| **`-l`** | Menampilkan _socket_ yang sedang mendengarkan (**listening**)                                    |
| **`-a`** | Menampilkan **semua** _socket_ (_listening_ maupun yang sedang terhubung/_established_)          |
| **`-n`** | Menampilkan alamat IP dan nomor port dalam bentuk **angka** (tanpa resolusi nama domain/layanan) |
| **`-p`** | Menampilkan nama **proses / aplikasi** dan PID yang menggunakan _socket_                         |
| **`-s`** | Menampilkan **ringkasan statistik** penggunaan _socket_ secara keseluruhan                       |
| **`-4`** | Hanya menampilkan koneksi **IPv4**                                                               |
| **`-6`** | Hanya menampilkan koneksi **IPv6**                                                               |

**4. `rsync`**
rsync adalah utilitas baris perintah untuk mentransfer dan menyinkronkan file secara efisien antara komputer dan hard drive eksternal atau antar-komputer dalam jaringan. Utilitas ini meminimalkan transfer data dengan hanya menyalin perbedaan antara sumber dan tujuan, sehingga prosesnya lebih cepat dibandingkan perintah penyalinan biasa, terutama untuk file atau direktori berukuran besar. rsync umumnya digunakan untuk pencadangan (backup), pencerminan data, dan pembaruan situs web.

**4.1 Format**
```bash
rsync [opsi] <sumber> <tujuan>
```

**4.2 Opsi**
- **`-a` (archive):** Mode arsip yang mencakup penyalinan secara rekursif, mempertahankan _permissions_, kepemilikan, _timestamp_, dan _symlinks_.

- **`-v` (verbose):** Menampilkan detail proses transfer file di layar.

- **`-z` (compress):** Mengompresi data selama proses transfer untuk menghemat bandwidth.

- **`-P` (progress & partial):** Menampilkan indikator kemajuan (_progress bar_) dan mengizinkan kelanjutan transfer jika terputus.

- **`--delete`:** Menghapus file di folder tujuan jika file tersebut sudah tidak ada di folder sumber (membuat folder tujuan identik dengan sumber).

**Kombinasi paling populer:** **`rsync -avzP`**

