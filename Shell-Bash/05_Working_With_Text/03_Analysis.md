**wc**
- Fungsi: menghitung jumlah baris, kata, karakter, atau byte dalam file/input.
- Opsi penting:
  - `-l` : hitung jumlah baris. Contoh: `wc -l file.txt`
  - `-w` : hitung jumlah kata. Contoh: `wc -w file.txt`
  - `-c` : hitung jumlah byte. Contoh: `wc -c file.txt`
  - `-m` : hitung jumlah karakter. Contoh: `wc -m file.txt`
  - `-L` : tampilkan panjang baris terpanjang. Contoh: `wc -L file.txt`
- Tanpa opsi: menampilkan baris, kata, dan byte sekaligus. Contoh: `wc file.txt`
- Contoh kombinasi:
  - Hitung jumlah baris dari output command lain: `ls -l | wc -l`
  - Hitung baris, kata, dan karakter: `wc -lwc file.txt`
  - Hitung total baris beberapa file: `wc -l file1.txt file2.txt`

**sort**
- Fungsi: mengurutkan baris teks secara alfabetis, numerik, atau berdasarkan kriteria lain.
- Opsi penting:
  - `-n` : urutkan secara numerik. Contoh: `sort -n angka.txt`
  - `-r` : urutkan terbalik (descending). Contoh: `sort -r file.txt`
  - `-k` : urutkan berdasarkan kolom tertentu. Contoh: `sort -k 2 file.txt` (kolom ke-2)
  - `-t` : tentukan delimiter kolom. Contoh: `sort -t "," -k 3 data.csv`
  - `-u` : hilangkan duplikat (seperti `sort | uniq`). Contoh: `sort -u file.txt`
  - `-f` : abaikan perbedaan huruf besar/kecil. Contoh: `sort -f file.txt`
  - `-h` : urutkan ukuran human-readable (K, M, G). Contoh: `sort -h sizes.txt`
  - `-o` : tulis hasil ke file. Contoh: `sort file.txt -o hasil.txt`
- Contoh kombinasi:
  - Urutkan numerik terbalik: `sort -nr angka.txt`
  - Urutkan berdasarkan kolom 2 numerik: `sort -t "," -k 2 -n data.csv`
  - Urutkan dan hilangkan duplikat: `sort -u nama.txt`

**uniq**
- Fungsi: menghapus atau melaporkan baris berulang yang bersebelahan (biasanya dipakai setelah `sort`).
- Opsi penting:
  - `-c` : hitung kemunculan setiap baris. Contoh: `uniq -c file.txt`
  - `-d` : hanya tampilkan baris yang duplikat. Contoh: `uniq -d file.txt`
  - `-D` : tampilkan semua baris duplikat. Contoh: `uniq -D file.txt`
  - `-u` : hanya tampilkan baris yang unik (tidak duplikat). Contoh: `uniq -u file.txt`
  - `-i` : abaikan perbedaan huruf besar/kecil. Contoh: `uniq -i file.txt`
  - `-f` : lewati N field pertama saat membandingkan. Contoh: `uniq -f 2 file.txt`
  - `-s` : lewati N karakter pertama saat membandingkan. Contoh: `uniq -s 3 file.txt`
- Contoh kombinasi:
  - Hitung frekuensi kata: `sort kata.txt | uniq -c`
  - Urutkan berdasarkan frekuensi: `sort kata.txt | uniq -c | sort -nr`
  - Tampilkan hanya duplikat: `sort file.txt | uniq -d`
  - Hitung duplikat dengan case-insensitive: `sort -f file.txt | uniq -ci`

**nl**
- Fungsi: menambahkan nomor baris pada file/input (mirip `cat -n` tapi lebih fleksibel).
- Opsi penting:
  - `-b` : atur penomoran body. Nilai: `a` (semua baris), `t` (hanya baris non-kosong, default), `n` (tanpa nomor). Contoh: `nl -b a file.txt`
  - `-n` : format nomor. Nilai: `ln` (kiri, default), `rn` (kanan), `rz` (kanan dengan nol). Contoh: `nl -n rz file.txt`
  - `-w` : lebar kolom nomor. Contoh: `nl -w 3 file.txt`
  - `-s` : string pemisah antara nomor dan teks. Contoh: `nl -s ": " file.txt`
  - `-v` : nomor awal. Contoh: `nl -v 100 file.txt`
  - `-i` : increment nomor. Contoh: `nl -i 2 file.txt`
  - `-p` : jangan reset nomor di setiap halaman. Contoh: `nl -p file.txt`
- Contoh kombinasi:
  - Nomori semua baris dengan lebar 4: `nl -b a -w 4 file.txt`
  - Nomori dengan format nol di depan: `nl -n rz -w 3 file.txt`
  - Mulai dari 10 dengan increment 5: `nl -v 10 -i 5 file.txt`
  - Nomori output command lain: `cat file.txt | nl -s " => "`