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

**4. `top` dan `htop`**
- **Fungsi Utama:** Menampilkan daftar proses yang sedang berjalan di sistem secara dinamis dan terurut, serta informasi penggunaan sumber daya seperti CPU dan memori.
   
- **Karakteristik `htop`:** Versi `top` yang ditingkatkan dan interaktif, dengan fitur tambahan seperti tampilan berwarna (_color-coding_), manajemen proses yang lebih baik, serta navigasi geser horizontal (_horizontal scrolling_).

**Keunggulan Interaktif `htop`:**

- **Navigasi Tombol Panah:** Bisa digeser ke atas/bawah dan kanan/kiri (untuk melihat perintah panjang).
- **Navigasi Mouse:** Mendukung klik mouse untuk memilih proses atau menu.
- **Pencarian / Filter:** Tekan `F3` untuk mencari nama proses atau `F4` untuk memfilter.
- **Manajemen Proses:** Tekan `F9` untuk mengirim sinyal (_kill/terminate_) ke proses yang dipilih.

| **Nama Kolom**       | **Nama Lengkap**     | **Deskripsi / Fungsi**                                                                            |
| -------------------- | -------------------- | ------------------------------------------------------------------------------------------------- |
| **`PID`**            | Process ID           | Nomor identitas unik untuk setiap proses yang berjalan.                                           |
| **`USER` / `OWNER`** | User / Owner         | Nama pengguna (_user_) yang mengoperasikan/pemilik proses.                                        |
| **`PR` / `PRI`**     | Priority             | Prioritas penjadwalan proses oleh kernel (semakin kecil, semakin tinggi).                         |
| **`NI`**             | Nice Value           | Nilai penyesuaian prioritas manual (kisaran `-20` hingga `19`).                                   |
| **`VIRT`**           | Virtual Memory       | Total memori virtual yang dialokasikan (RAM, Swap, & Shared Libraries).                           |
| **`RES` / `MEM`**    | Resident Memory      | Jumlah memori RAM fisik asli yang **benar-benar sedang digunakan**.                               |
| **`SHR`**            | Shared Memory        | Bagian dari RAM fisik (`RES`) yang dipakai bersama proses lain.                                   |
| **`S` / `STATE`**    | Process State        | Status proses: `R` (Running), `S` (Sleeping), `D` (Uninterruptible), `Z` (Zombie), `T` (Stopped). |
| **`%CPU`**           | CPU Usage            | Persentase penggunaan daya pemrosesan CPU saat ini.                                               |
| **`%MEM`**           | Memory Usage         | Persentase RAM fisik yang digunakan relatif terhadap total RAM sistem.                            |
| **`TIME+`**          | Accumulated CPU Time | Total waktu pemrosesan CPU yang digunakan sejak proses pertama berjalan.                          |
| **`COMMAND`**        | Command Line         | Nama perintah, biner, atau _path_ lengkap dari skrip yang sedang mengeksekusi proses.             |

**5. `df` dan `du`**
- **Peran `df` (_disk free_):** Menyajikan ringkasan penggunaan dan ketersediaan ruang disk pada seluruh sistem berkas (_file system_) yang terpasang (_mounted_).
   
- **Peran `du` (_disk usage_):** Memperkirakan ukuran penggunaan ruang disk oleh file atau direktori tertentu secara rinci.
   
- **Tujuan Bersama:** Menggabungkan kedua perintah tersebut membantu _administrator_ sistem memahami bagaimana media penyimpanan digunakan serta mengidentifikasi potensi masalah kehabisan ruang disk.

**5.1 Options `df`**

| **Opsi**        | **Nama Lengkap**   | **Fungsi / Deskripsi**                                                                    |
| --------------- | ------------------ | ----------------------------------------------------------------------------------------- |
| **`-h`**        | `--human-readable` | Menampilkan ukuran dalam format yang mudah dibaca manusia (Byte, KB, MB, GB, TB).         |
| **`-T`**        | `--print-type`     | Menampilkan tipe _file system_ (misal: `ext4`, `xfs`, `vfat`, `squashfs`).                |
| **`-i`**        | `--inodes`         | Menampilkan penggunaan _inode_ (jumlah indeks file) alih-alih penggunaan ruang disk.      |
| **`-k`**        | `--kilobytes`      | Menampilkan output dalam blok ukuran **1 KB** (default untuk kebanyakan sistem).          |
| **`-m`**        | `--megabytes`      | Menampilkan output dalam blok ukuran **1 MB**.                                            |
| **`-x [tipe]`** | `--exclude-type`   | Membuang/mengabaikan tipe _file system_ tertentu dari tampilan (misal: `df -h -x tmpfs`). |
| **`-t [tipe]`** | `--type`           | Hanya menampilkan _file system_ dengan tipe tertentu (misal: `df -h -t ext4`).            |

**5.2 Options `du`**

| **Opsi**        | **Nama Lengkap**      | **Fungsi / Deskripsi**                                                                         |
| --------------- | --------------------- | ---------------------------------------------------------------------------------------------- |
| **`-h`**        | `--human-readable`    | Menampilkan ukuran file/folder dalam format mudah dibaca (KB, MB, GB).                         |
| **`-s`**        | `--summarize`         | Hanya menampilkan **total akumulasi ukuran** direktori, tanpa merinci file/folder di dalamnya. |
| **`-a`**        | `--all`               | Menampilkan ukuran untuk **semua file**, bukan hanya direktori/folder.                         |
| **`-c`**        | `--total`             | Menambahkan baris **"total"** akhir di paling bawah output.                                    |
| **`-d [N]`**    | `--max-depth=[N]`     | Membatasi kedalaman penelusuran folder hingga _N_ level (misal: `du -h --max-depth=1`).        |
| **`-x`**        | `--one-file-system`   | Mencegah `du` menelusuri direktori yang berada di _file system_ / partisi terpisah.            |
| **`--exclude`** | `--exclude=[pattern]` | Mengabaikan file/folder yang cocok dengan pola tertentu (misal: `du -h --exclude="*.log"`).    |

Contoh output `df -T`:
```
Filesystem     Type     1K-blocks     Used Available Use% Mounted on
tmpfs          tmpfs       802700     1780    800920   1% /run
/dev/sda2      ext4     244711864 50462884 181745476  22% /
tmpfs          tmpfs      4013492    61864   3951628   2% /dev/shm
tmpfs          tmpfs         5120        8      5112   1% /run/lock
efivarfs       efivarfs       154       58        91  39% /sys/firmware/efi/efivars
tmpfs          tmpfs      4013492        0   4013492   0% /run/qemu
tmpfs          tmpfs      4013492    13604   3999888   1% /tmp
/dev/sda1      vfat        306572     7940    298632   3% /boot/efi
tmpfs          tmpfs       802696      128    802568   1% /run/user/1000

```

| **Nama Kolom**   | **Arti / Deskripsi**                                                 | **Penjelasan Berdasarkan Output Anda**                                                                                                                          |
| ---------------- | -------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`Filesystem`** | Nama perangkat keras (_device_) atau _filesystem_ virtual.           | Menunjukkan sumber penyimpanan. Misalnya `/dev/sda2` (partisi utama harddisk/SSD) atau `tmpfs` (_filesystem_ berbasis RAM).                                     |
| **`Type`**       | Jenis _filesystem_ yang digunakan (muncul karena ada opsi `-T`).     | Menunjukkan format penyimpanan. Misalnya `ext4` (standar Linux), `vfat` (untuk partisi EFI), `tmpfs` (RAM sementara), atau `efivarfs`.                          |
| **`1K-blocks`**  | Total kapasitas penyimpanan dalam satuan blok **1 KB** (1.024 byte). | Total ukuran partisi/penyimpanan. Contoh `/dev/sda2` memiliki `244.711.864` blok 1 KB ($\approx 244,7 \text{ GB}$).                                             |
| **`Used`**       | Ruang penyimpanan yang **sudah terpakai** (dalam blok 1 KB).         | Jumlah ruang yang terisi file/sistem. Contoh `/dev/sda2` telah menggunakan `50.462.884` blok 1 KB ($\approx 50,4 \text{ GB}$).                                  |
| **`Available`**  | Sisa ruang penyimpanan yang **masih tersedia** (dalam blok 1 KB).    | Sisa ruang kosong yang dapat dipakai. Contoh `/dev/sda2` masih menyisakan `181.745.476` blok 1 KB ($\approx 181,7 \text{ GB}$).                                 |
| **`Use%`**       | Persentase penggunaan ruang penyimpanan.                             | Perbandingan antara `Used` dan total kapasitas. Dihitung dengan rumus: $\frac{\text{Used}}{\text{Used} + \text{Available}} \times 100\%$.                       |
| **`Mounted on`** | Lokasi _mount point_ (direktori tempat _filesystem_ ditautkan).      | Menunjukkan jalur direktori di Linux untuk mengakses _filesystem_ tersebut. Misalnya `/` (root sistem utama), `/tmp` (penyimpanan sementara), atau `/boot/efi`. |

**6. `iostat` dan `vmstat`**
1. **Peran `iostat` (_Input/Output Statistics_):**
   
   - Melaporkan utilisasi CPU dan statistik I/O (_Input/Output_) pada perangkat penyimpanan (disk).
   
   - Memberikan gambaran mengenai performa dan tingkat kecepatan media penyimpanan.
   
2. **Peran `vmstat` (_Virtual Memory Statistics_):**
   
   - Melaporkan statistik memori virtual, termasuk informasi seputar proses, memori, _paging_, blok I/O, _traps_, dan aktivitas CPU.
   
   - Membantu mengidentifikasi pemusatan hambatan performa (_performance bottlenecks_) yang berkaitan dengan penggunaan memori dan CPU.
   
3. **Tujuan Bersama:** Kedua utilitas ini digunakan oleh _administrator_ sistem untuk mendiagnosis masalah performa, terutama saat dicurigai ada kemacetan pada akses disk (I/O bound) atau penggunaan memori/CPU (CPU/Memory bound).

**6.1 `iostat`**

Contoh output dari `iostat`:
```
Linux 7.0.0-31-generic (lawlayui-20kts06t00)    09/29/2026      _x86_64_        (4 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          16.66    0.16    2.68    0.09    0.00   80.41

Device             tps    kB_read/s    kB_wrtn/s    kB_dscd/s    kB_read    kB_wrtn    kB_dscd
loop0             0.00         0.00         0.00         0.00         17          0          0
loop1             0.01         0.09         0.00         0.00        347          0          0
loop10            0.01         0.27         0.00         0.00       1072          0          0
loop11            0.01         0.27         0.00         0.00       1101          0          0
loop12            0.01         0.27         0.00         0.00       1080          0          0
loop13            0.01         0.27         0.00         0.00       1100          0          0
loop14            0.01         0.27         0.00         0.00       1083          0          0
loop15            0.01         0.27         0.00         0.00       1093          0          0
loop16            0.02         0.28         0.00         0.00       1121          0          0
loop17            0.01         0.09         0.00         0.00        370          0          0
loop18            0.01         0.09         0.00         0.00        350          0          0
loop19            0.00         0.00         0.00         0.00         10          0          0
loop2             0.01         0.09         0.00         0.00        359          0          0
loop3             0.01         0.27         0.00         0.00       1102          0          0
loop4             0.01         0.27         0.00         0.00       1084          0          0
loop5             0.01         0.09         0.00         0.00        348          0          0
loop6             0.01         0.27         0.00         0.00       1071          0          0
loop7             0.02         0.27         0.00         0.00       1084          0          0
loop8             0.01         0.10         0.00         0.00        384          0          0
loop9             0.02         0.27         0.00         0.00       1081          0          0
sda              19.50       456.79       309.04       273.42    1835965    1242117    1098964
```

| **Kolom**     | **Nilai Anda** | **Keterangan & Arti**                                                                                                                                                                              |
| ------------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`%user`**   | **16.29%**     | Persentase CPU yang digunakan oleh aplikasi pengguna (_user-space_), seperti browser, editor teks, atau skrip Anda.                                                                                |
| **`%nice`**   | **0.18%**      | Persentase CPU yang digunakan oleh proses _user-space_ yang nilai prioritasnya (_nice value_) telah diubah.                                                                                        |
| **`%system`** | **2.60%**      | Persentase CPU yang digunakan oleh kernel/sistem internal.                                                                                                                                         |
| **`%iowait`** | **0.09%**      | **Sangat Penting:** Persentase waktu CPU **menganggur menunggu respon dari disk (I/O)**. Nilai `0.09%` ini sangat rendah, menandakan disk Anda sama sekali tidak menjadi kemacetan (_bottleneck_). |
| **`%steal`**  | **0.00%**      | Persentase waktu CPU yang "dicuri" oleh hypervisor jika berada di lingkungan Virtual Machine (VM).                                                                                                 |
| **`%idle`**   | **80.84%**     | Persentase waktu CPU **santai/tidak terpakai**. Menandakan sistem masih sangat santai.                                                                                                             |

- **`tps`** _(Transactions Per Second)_: Jumlah permintaan I/O (baca/tulis) yang dikirim ke perangkat per detik.
   
- **`kB_read/s`**: Kecepatan membaca data dari perangkat dalam Kilobyte per detik.
   
- **`kB_wrtn/s`**: Kecepatan menulis data ke perangkat dalam Kilobyte per detik.
   
- **`kB_dscd/s`**: Kecepatan perintah penghapusan/pembuangan data (_discard/TRIM_) per detik (umum pada SSD).
   
- **`kB_read`**: **Total kumulatif** data yang telah dibaca sejak booting (dalam KB).
   
- **`kB_wrtn`**: **Total kumulatif** data yang telah ditulis sejak booting (dalam KB).
   
- **`kB_dscd`**: Total kumulatif data yang di-TRIM sejak booting.

**6.2 Options `iostat`**
```bash
iostat [opsi] [interval_detik] [jumlah_iterasi]
```

| **Opsi**          | **Nama Lengkap / Singkatan** | **Fungsi / Deskripsi**                                                                                                                          |
| ----------------- | ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| **`-c`**          | CPU only                     | Hanya menampilkan statistik penggunaan **CPU** (menyembunyikan laporan perangkat disk).                                                         |
| **`-d`**          | Device only                  | Hanya menampilkan statistik penggunaan **perangkat disk** (menyembunyikan laporan CPU).                                                         |
| **`-x`**          | Extended statistics          | Menampilkan **metrik I/O lanjutan/terperinci** (seperti `%util`, `r_await`, `w_await`, `avgqu-sz`). Sangat berguna untuk analisis _bottleneck_. |
| **`-h`**          | Human readable               | Mengubah satuan output angka menjadi format yang mudah dibaca (misal: KB, MB, GB).                                                              |
| **`-z`**          | Omit inactive devices        | Menyembunyikan perangkat disk yang tidak memiliki aktivitas I/O pada periode laporan tersebut.                                                  |
| **`-p [device]`** | Partition                    | Menampilkan statistik terperinci untuk **partisi spesifik** atau semua partisi pada perangkat (misal: `-p sda` atau `-p ALL`).                  |
| **`-k`**          | Kilobytes                    | Menampilkan statistik kecepatan dan volume transfer dalam satuan **Kilobyte** (default).                                                        |
| **`-m`**          | Megabytes                    | Menampilkan statistik kecepatan dan volume transfer dalam satuan **Megabyte**.                                                                  |
| **`-t`**          | Timestamp                    | Menambahkan **stempel waktu (tanggal dan jam)** pada setiap blok output laporan.                                                                |
| **`-N`**          | LVM display                  | Menampilkan nama _Logical Volume Manager_ (LVM) dalam bentuk nama deskriptifnya, bukan nama perangkat internalnya.                              |

Contoh perintah: 

1. Memantau disk I/O terperinci secara real-time setiap 2 detik:
```bash
iostat -xz 2
```

2. **Memantau hanya disk fisik (tanpa CPU) dalam format MB per detik sebanyak 5 kali laporan:**

```bash
iostat -dmh 1 5
```

3. Memantau dengan stempel waktu untuk keperluan pencatatan log (logging):
```bash
iostat -xt 5 >> disk_performance.log
```

**6.3 `vmstat`**

| **Kategori** | **Nama Kolom** | **Nama Lengkap**   | **Fungsi / Deskripsi**                                                                                    |
| ------------ | -------------- | ------------------ | --------------------------------------------------------------------------------------------------------- |
| **`procs`**  | **`r`**        | _Runnable_         | Jumlah proses yang sedang berjalan (_running_) atau sedang mengantre giliran eksekusi oleh CPU.           |
|              | **`b`**        | _Blocked_          | Jumlah proses yang sedang tertahan (_uninterruptible sleep_) menunggu akses I/O (misal: baca/tulis disk). |
| **`memory`** | **`swpd`**     | _Swapped_          | Jumlah memori virtual (Swap) yang sedang digunakan (dalam KB).                                            |
|              | **`free`**     | _Free Memory_      | Jumlah RAM fisik yang benar-benar kosong/belum terpakai (dalam KB).                                       |
|              | **`buff`**     | _Buffers_          | Jumlah RAM fisik yang digunakan sebagai tempat penyimpanan sementara data I/O blok (_buffer_).            |
|              | **`cache`**    | _Cache_            | Jumlah RAM fisik yang digunakan oleh kernel untuk _page cache_ (file yang sering dibaca dari disk).       |
| **`swap`**   | **`si`**       | _Swap In_          | Kecepatan data dipindahkan **dari Swap (disk) kembali ke RAM** per detik (dalam KB/s).                    |
|              | **`so`**       | _Swap Out_         | Kecepatan data dipindahkan **dari RAM ke Swap (disk)** per detik karena RAM penuh (dalam KB/s).           |
| **`io`**     | **`bi`**       | _Blocks In_        | Jumlah blok data yang dibaca dari perangkat penyimpanan (_disk read_) per detik.                          |
|              | **`bo`**       | _Blocks Out_       | Jumlah blok data yang ditulis ke perangkat penyimpanan (_disk write_) per detik.                          |
| **`system`** | **`in`**       | _Interrupts_       | Jumlah interupsi sistem (_system interrupts_) per detik, termasuk interupsi jam/perangkat keras.          |
|              | **`cs`**       | _Context Switches_ | Jumlah pergantian tugas antar proses/thread (_context switches_) di CPU per detik.                        |
| **`cpu`**    | **`us`**       | _User Time_        | Persentase waktu CPU yang dihabiskan untuk menjalankan proses pengguna (_non-kernel code_).               |
|              | **`sy`**       | _System Time_      | Persentase waktu CPU yang dihabiskan untuk menjalankan kode kernel/sistem internal.                       |
|              | **`id`**       | _Idle Time_        | Persentase waktu CPU yang menganggur/santai (_idle_).                                                     |
|              | **`wa`**       | _I/O Wait_         | Persentase waktu CPU menganggur karena **menunggu operasi I/O disk** selesai.                             |
|              | **`st`**       | _Stolen Time_      | Persentase waktu CPU yang diambil oleh _hypervisor_ jika dijalankan di dalam Virtual Machine (VM).        |

- **`si` / `so` (Indikator RAM & Swap):**
   
   - Jika angka **`si`** dan **`so`** terus-menerus bernilai di atas `0`, berarti sistem sedang kehabisan RAM fisik dan mengandalkan _Swap_ di disk. Ini adalah tanda utama server mengalami kelambatan mendasar (_thrashing_).
   
- **`wa` (Indikator Disk Bottleneck):**
   
   - Jika nilai **`wa`** tinggi (misal di atas `15%–20%`), artinya CPU terlalu banyak membuang waktu menganggur hanya untuk menunggu respon baca/tulis dari SSD/Harddisk.
   
- **`r` vs Jumlah CPU Core (Indikator CPU Bottleneck):**

   - Jika angka **`r`** secara konsisten lebih tinggi daripada total _core_ CPU yang Anda miliki (misalnya `r = 8` pada server 4 CPU), artinya terjadi antrean panjang proses pada CPU
