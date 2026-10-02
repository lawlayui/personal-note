**1. `tar`**
Command `tar` akan menggabungkan beberapa files menjadi satu, tidak melakukan kompresi. 

**1.1 Format Penulisan**
```bash
tar [opsi] [nama_arsip.tar] [file_atau_folder_tujuan]
```

**1.2 Opsi-opsi Utama**
- **`-c` (`--create`)**: Membuat berkas arsip baru.
   
- **`-x` (`--extract`)**: Mengekstrak/mengeluarkannya dari berkas arsip.
   
- **`-t` (`--list`)**: Menampilkan daftar isi di dalam berkas arsip tanpa mengekstraknya.
   
- **`-r` (`--append`)**: Menambahkan file atau folder baru ke dalam arsip `.tar` yang sudah ada.
   
- **`-u` (`--update`)**: Menambahkan file hanya jika ukurannya lebih baru dari versi yang ada di dalam arsip.

- **`-z` (`--gzip`)**: Mengompresi/mengekstrak menggunakan alogritma **Gzip** (menghasilkan format `.tar.gz` atau `.tgz`).
   
- **`-j` (`--bzip2`)**: Mengompresi/mengekstrak menggunakan algoritma **Bzip2** (menghasilkan format `.tar.bz2`).
   
- **`-J` (`--xz`)**: Mengompresi/mengekstrak menggunakan algoritma **XZ** (menghasilkan format `.tar.xz`).

- **`-f` (`--file`)**: Menentukan nama berkas arsip target (harus diikuti langsung oleh nama file arsipnya).
   
- **`-v` (`--verbose`)**: Menampilkan proses/daftar file yang sedang dikerjakan secara _real-time_ di terminal.
   
- **`-C` (`--directory`)**: Menentukan lokasi direktori tujuan tempat mengekstrak berkas.

**2. `gzip` dan `gunzip`**
Command `gzip` digunakan untuk mengkompresi file. 
Command `gunzip` digunakan untuk mengekstrak kompresi file dengan ekstensi `.gz` (hasil dari kompresi `gzip`).

**2.1 Fomat Penulisan**
```bash
# Mengompresi berkas
gzip [opsi] nama_berkas

# Mengekstrak berkas
gunzip [opsi] nama_berkas.gz
# ATAU
gzip -d [opsi] nama_berkas.gz
```

**2.2 Opsi-opsi Utama**

| **Opsi**          | **Opsi Panjang**    | **Fungsi / Penjelasan**                                                                                                                    |
| ----------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| **`-d`**          | `--decompress`      | Mengekstrak berkas `.gz` (fungsi sama dengan `gunzip`).                                                                                    |
| **`-k`**          | `--keep`            | Menjaga/mempertahankan berkas asli agar tidak terhapus setelah proses kompresi/ekstraksi.                                                  |
| **`-r`**          | `--recursive`       | Mengompresi seluruh berkas secara rekursif di dalam direktori/folder.                                                                      |
| **`-v`**          | `--verbose`         | Menampilkan detail proses, seperti nama berkas dan rasio kompresi.                                                                         |
| **`-l`**          | `--list`            | Menampilkan informasi isi berkas terkompresi (ukuran asli, ukuran kompresi, rasio).                                                        |
| **`-1` s/d `-9`** | `--fast` / `--best` | Mengatur tingkat kompresi: **`-1`** paling cepat (kompresi rendah), **`-9`** kompresi maksimal (proses lebih lambat). Default adalah `-6`. |

**3. `zip` dan `unzip`
Command `zip` dapat digunakan untuk mengkompresi file dan direktori. 
Command `unzip` digunakan untuk mendekompresi.

**3.1 Format Penulisan**
```bash 
zip [opsi] nama_arsip.zip file_atau_folder_sumber

unzip [opsi] nama_arsip.zip [file_tertentu]
```

**3.2 Opsi-opsi Utama**

**3.2.1 Opsi `zip`**

| **Opsi**          | **Opsi Panjang**  | **Fungsi / Penjelasan**                                                                                                             |
| ----------------- | ----------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| **`-r`**          | `--recurse-paths` | Mengompresi direktori/folder secara **rekursif** (termasuk seluruh isi sub-folder dan berkas di dalamnya).                          |
| **`-e`**          | `--encrypt`       | Mengenkripsi berkas `.zip` dengan **kata sandi** (_password_).                                                                      |
| **`-u`**          | `--update`        | Perbarui/tambahkan berkas ke arsip jika berkas sumber lebih baru atau belum ada.                                                    |
| **`-m`**          | `--move`          | **Pindahkan** berkas ke dalam arsip (menghapus berkas asli setelah berhasil dimasukkan ke `.zip`).                                  |
| **`-d`**          | `--delete`        | **Menghapus** berkas tertentu dari dalam arsip `.zip` yang sudah ada.                                                               |
| **`-v`**          | `--verbose`       | Menampilkan proses detail atau informasi isi arsip.                                                                                 |
| **`-q`**          | `--quiet`         | Mode senyap (_quiet mode_), menyembunyikan tampilan pesan saat kompresi berjalan.                                                   |
| **`-x`**          | `--exclude`       | **Mengecualikan** berkas/folder tertentu agar tidak ikut dikompresi.                                                                |
| **`-1` s/d `-9`** |                   | Mengatur tingkat kompresi: **`-1`** paling cepat (kompresi rendah), **`-9`** kompresi maksimal (lebih lambat). Default adalah `-6`. |

**3.2.2 Opsi `unzip`**

|**Opsi**|**Fungsi / Penjelasan**|
|---|---|
|**`-l`**|**Melihat daftar isi** berkas `.zip` (nama file, ukuran, tanggal) tanpa mengekstraknya.|
|**`-d /path/tujuan`**|Menentukan **folder/direktori tujuan** hasil ekstraksi.|
|**`-v`**|Menampilkan informasi rinci (_verbose_) mengenai isi arsip `.zip`.|
|**`-q`**|Mode senyap (_quiet mode_), mengekstrak tanpa menampilkan daftar berkas di terminal.|
|**`-o`**|Menimpa (_overwrite_) berkas yang sudah ada tanpa meminta konfirmasi.|
|**`-n`**|**Jangan menimpa** (_never overwrite_) berkas yang sudah ada jika namanya sama.|
|**`-P kata_sandi`**|Memasukkan kata sandi langsung via terminal untuk berkas `.zip` yang terkunci.|
|**`-t`**|Menguji (_test_) integritas berkas `.zip` untuk memastikan tidak ada file yang rusak.|
|**`-x file`**|Mengecualikan file tertentu agar **tidak diekstrak**.|
