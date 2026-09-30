**1. `cron`  dan `crontab`**
- **Fungsi Utama `cron`:** `cron` adalah alat yang digunakan untuk menjalankan perintah atau skrip secara otomatis pada waktu, tanggal, atau interval tertentu (misalnya: setiap jam, setiap hari jam 12 malam, atau setiap tanggal 1).
   
- **Pengertian `crontab` (Cron Table):** `crontab` adalah berkas (_file_) khusus yang berisi daftar tabel atau jadwal perintah yang ingin dijalankan oleh `cron`.
   
- **Kepemilikan Jadwal:**
  
   - **Setiap pengguna (_user_)** memiliki berkas `crontab`-nya sendiri untuk menjalankan tugas-tugas pribadi.
   
   - **Sistem Linux** juga memiliki `crontab` tingkat sistem (_system-wide_) yang digunakan oleh administrator sistem (SysAdmin) untuk tugas-tugas pemeliharaan rutin seluruh server.

   **1.1 Opsi-opsi `crontab`**

| **Perintah** | **Fungsi / Kegunaan**                                                                                    |
| ------------ | -------------------------------------------------------------------------------------------------------- |
| `crontab -e` | **Edit** — Membuka editor teks untuk membuat, mengubah, atau menambahkan jadwal tugas baru.              |
| `crontab -l` | **List** — Menampilkan daftar semua jadwal tugas yang sedang aktif saat ini.                             |
| `crontab -r` | **Remove** — Menghapus seluruh file `crontab` milik user (hati-hati saat menggunakannya).                |
| `crontab -i` | **Interactive** — Memberikan konfirmasi sebelum menghapus jadwal (biasanya digabung jadi `crontab -ri`). |

**1.2 Format Penulisan `cron`**

```
* * * * * /path/ke/skrip.sh
│ │ │ │ │
│ │ │ │ └─── Hari dalam seminggu (0 - 6) (Minggu = 0)
│ │ │ └────── Bulan (1 - 12)
│ │ └──────── Tanggal dalam bulan (1 - 31)
│ └────────── Jam (0 - 23)
└──────────── Menit (0 - 59)
```

Menggunakan tanda `/` untuk interval kelipatan. Misalnya jika ada */x maka artinya adalah jalankan setiap x kali. 

Contoh: 
```
0 0 * * * /usr/local/bin/system_health_check.sh
```

**1.3 Menulis `crontab`**
- Mengedit File `/etc/crontab`
```
sudo vim /etc/crontab
```

```
# m h dom mon dow user  command
*   *   *   *   *  root  /home/lawlayui/script/test.sh >> /var/log/test.log 2>&1
│   │   │   │   │   │    └─ Perintah / Skrip yang dijalankan
│   │   │   │   │   └────── User yang mengeksekusi (misal: root, www-data, postgres)
│   │   │   │   └────────── Hari dalam seminggu (0-6)
│   │   │   └────────────── Bulan (1-12)
│   │   │ ... Tanggal dalam bulan (1-31)
│   │ ... Jam (0-23)
│ ... Menit (0-59)
```

- Menambahkan File Baru di Direktori `/etc/cron.d`
Mengedit file utama `/etc/crontab` secara langsung berisiko merusak konfigurasi sistem jika terjadi salah ketik. _Best practice_ di Linux modern adalah membuat file terpisah di dalam direktori `/etc/cron.d/`.

```
sudo vim /etc/cron.d/my-app-backup
```

```
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# Jalankan backup setiap jam 2 pagi menggunakan user root
0 2 * * * root /usr/local/bin/backup-db.sh >> /var/log/db-backup.log 2>&1
```

**2. Perintah `at`**
- **Fungsi Utama (`at` command):** Digunakan untuk menjadwalkan suatu perintah agar otomatis dijalankan pada waktu (_time_) dan tanggal (_date_) spesifik yang ditentukan.
   
- **Otomatisasi Tanpa Intervensi:** Setelah tugas dijadwalkan, perintah tersebut akan berjalan secara otomatis di _background_ tanpa perlu dijalankan atau ditunggui secara manual oleh pengguna.
   
- **Kegunaan:** Sangat berguna untuk otomatisasi tugas-tugas yang memang hanya perlu dieksekusi **satu kali** di masa mendatang (berbeda dengan `cron` yang sifatnya berulang/rutin).

**2.1 Cara Menggunakan**
- Cara interaktif
Ketik `at` diikuti oleh waktu eksekusi, lalu tekan **Enter**. Anda akan masuk ke dalam _prompt_ `at>`. Ketikkan perintah yang ingin dijalankan, lalu tekan **`Ctrl + D`** untuk menyimpan dan keluar.
```bash
at 14:30
at> bash /home/lawlayui/script/test.sh >> /home/lawlayui/script/output.log 2>&1
at> <Tekan Ctrl+D>
```

- Menggunakan Pipe (|) 
```bash
echo "bash /home/lawlayui/script/test.sh >> /home/lawlayui/script/output.log 2>&1" | at 14:30
```

**2.2 Format Waktu**

| **Format Waktu**                    | **Penjelasan**                          | **Contoh Perintah**                            |
| ----------------------------------- | --------------------------------------- | ---------------------------------------------- |
| **Waktu Spesifik**                  | Jam dan Menit (Format 24 Jam / AM-PM)   | `at 15:45`, `at 4:00pm`                        |
| **Relatif (Relatif dari sekarang)** | `now + [angka] [menit/jam/hari/minggu]` | `at now + 10 minutes`, `at now + 2 hours`      |
| **Hari / Tanggal**                  | Tanggal atau kata kunci hari            | `at 08:00 tomorrow`, `at 10:00 AM next monday` |
| **Tanggal Spesifik**                | Bulan Tanggal Tahun                     | `at 01:00 Jul 25`, `at 00:00 12/31/2026`       |

**2.3 Opsi / Flag  Penting**

|**Opsi / Flag**|**Fungsi**|**Contoh**|
|---|---|---|
|**`-l`**|Alias untuk `atq` (Melihat daftar antrean)|`at -l`|
|**`-r` / `-d`**|Alias untuk `atrm` (Menghapus Job ID dari antrean)|`at -r 3`|
|**`-c`**|Cat / Menampilkan detail tugas berdasarkan Job ID|`at -c 3`|
|**`-f [file]`**|Membaca perintah dari file skrip lokal alih-alih mengetik manual|`at 23:00 -f /home/lawlayui/script/test.sh`|
|**`-m`**|Mengirim email ke user saat tugas selesai, meskipun tidak ada output|`at -m now + 1 hour`|
