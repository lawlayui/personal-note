**Pengertian**
- Wildcard (glob) adalah karakter khusus untuk mencocokkan nama file/direktori.
- Diproses oleh shell sebelum command dijalankan (bukan oleh command itu sendiri).
- Hanya berlaku untuk pencocokan nama file, bukan isi file.

**`*` (Asterisk)**
- Fungsi: mencocokkan nol atau lebih karakter apa pun.
- Contoh:
  - `ls *.txt` → semua file berakhiran `.txt`
  - `rm file*` → hapus semua file yang diawali `file`
  - `cp data* /backup/` → copy semua file yang diawali `data`
  - `ls *` → semua file (kecuali file tersembunyi yang diawali titik)
- Catatan:
  - Tidak cocok dengan file tersembunyi (dotfile) kecuali pola juga diawali titik. Contoh: `ls .*`
  - Bisa digabung di tengah: `ls *log*` → semua file yang mengandung `log`

**`?` (Question Mark)**
- Fungsi: mencocokkan tepat satu karakter.
- Contoh:
  - `ls file?.txt` → `file1.txt`, `fileA.txt` (tapi bukan `file12.txt`)
  - `rm data?.csv` → hapus `data1.csv`, `data2.csv`
  - `ls ???.txt` → file dengan nama tepat 3 karakter berakhiran `.txt`
- Catatan:
  - Setiap `?` mewakili satu karakter, termasuk spasi (jika ada dalam nama file).

**`[...]` (Bracket)**
- Fungsi: mencocokkan satu karakter dari sekumpulan karakter atau range.
- Contoh:
  - `ls file[123].txt` → `file1.txt`, `file2.txt`, `file3.txt`
  - `ls file[a-z].txt` → `filea.txt` sampai `filez.txt`
  - `ls file[0-9].txt` → `file0.txt` sampai `file9.txt`
  - `ls file[!0-9].txt` → satu karakter selain angka (`!` atau `^` untuk negasi)
  - `ls [A-Z]*` → file yang diawali huruf besar
- Catatan:
  - `[!...]` atau `[^...]` = negasi (kecuali karakter di dalamnya).
  - Range harus berurutan, misal `[a-z]`, `[0-9]`.
  - Untuk karakter literal `]`, letakkan di awal: `[]abc]`.

**`{...}` (Brace Expansion)**
- Fungsi: memperluas menjadi beberapa string terpisah (bukan pencocokan file).
- Contoh:
  - `echo file{1,2,3}.txt` → `file1.txt file2.txt file3.txt`
  - `cp file.txt{,.bak}` → copy `file.txt` menjadi `file.txt.bak`
  - `mkdir {senin,selasa,rabu}` → buat 3 direktori sekaligus
  - `touch data{01..05}.txt` → `data01.txt` sampai `data05.txt`
  - `echo {a..e}` → `a b c d e`
- Catatan:
  - Brace expansion terjadi **sebelum** pencocokan file, jadi tidak peduli file-nya ada atau tidak.
  - Bisa bersarang: `echo {a,b{1,2}}` → `a b1 b2`
  - `{1..10}` → 1 sampai 10; `{1..10..2}` → 1, 3, 5, 7, 9
  - Berbeda dengan `[...]`: `{...}` menghasilkan string, `[...]` mencocokkan satu karakter.

**Perbandingan Singkat**
- `*` → banyak karakter
- `?` → satu karakter
- `[...]` → satu karakter dari pilihan
- `{...}` → beberapa string (bukan matching karakter)