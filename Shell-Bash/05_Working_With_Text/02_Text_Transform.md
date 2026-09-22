**cut, paste**
- Fungsi `cut`: memotong bagian tertentu dari setiap baris (berdasarkan kolom, karakter, atau byte).
- Opsi penting `cut`:
  - `-d` : delimiter/pemisah kolom. Contoh: `cut -d ":" -f 1 /etc/passwd` (delimiter `:`)
  - `-f` : pilih field/kolom. Contoh: `cut -d "," -f 1,3 data.csv` (kolom 1 dan 3)
  - `-c` : pilih berdasarkan karakter. Contoh: `cut -c 1-5 file.txt` (karakter 1 sampai 5)
  - `-b` : pilih berdasarkan byte. Contoh: `cut -b 1-3 file.txt`
  - `--complement` : tampilkan semua kecuali pilihan. Contoh: `cut -d "," -f 2 --complement data.csv`
- Contoh kombinasi: `cut -d ":" -f 1,3 /etc/passwd`

- Fungsi `paste`: menggabungkan baris dari beberapa file secara horizontal.
- Opsi penting `paste`:
  - `-d` : delimiter antar kolom. Contoh: `paste -d "," file1.txt file2.txt`
  - `-s` : gabungkan semua baris dalam satu file menjadi satu baris. Contoh: `paste -s -d "," file.txt`
  - `-` : membaca dari stdin. Contoh: `cat file1.txt | paste - file2.txt`
- Contoh penggunaan: `paste file1.txt file2.txt`

**join, split**
- Fungsi `join`: menggabungkan dua file berdasarkan field yang sama (mirip SQL join).
- Opsi penting `join`:
  - `-1` : field kunci pada file pertama. Contoh: `join -1 2 -2 1 file1.txt file2.txt`
  - `-2` : field kunci pada file kedua. Contoh: `join -1 1 -2 2 file1.txt file2.txt`
  - `-t` : delimiter. Contoh: `join -t "," file1.csv file2.csv`
  - `-a` : tampilkan juga baris yang tidak punya pasangan. Contoh: `join -a 1 file1.txt file2.txt`
  - `-o` : format output. Contoh: `join -o 1.1,2.2 file1.txt file2.txt`
- Catatan: kedua file harus diurutkan berdasarkan field kunci.
- Contoh: `join -t "," -1 1 -2 1 data1.csv data2.csv`

- Fungsi `split`: memecah file besar menjadi beberapa file kecil.
- Opsi penting `split`:
  - `-l` : jumlah baris per file. Contoh: `split -l 100 bigfile.txt part_`
  - `-b` : ukuran per file. Contoh: `split -b 10M bigfile.txt part_`
  - `-n` : bagi menjadi N file. Contoh: `split -n 5 bigfile.txt part_`
  - `-d` : gunakan suffix angka. Contoh: `split -l 50 -d file.txt chunk_`
  - `-a` : panjang suffix. Contoh: `split -l 50 -a 3 file.txt part_`
- Contoh: `split -l 1000 -d access.log log_part_`

**tr**
- Fungsi: menerjemahkan atau menghapus karakter.
- Opsi penting:
  - `-d` : hapus karakter. Contoh: `tr -d "0-9" file.txt` (hapus semua angka)
  - `-s` : squeeze, perkecil pengulangan karakter. Contoh: `tr -s " "` (ubah spasi berulang jadi satu)
  - `-c` : complement, gunakan karakter selain yang ditentukan. Contoh: `tr -cd "a-zA-Z"` (hanya simpan huruf)
  - `-t` : truncate set pertama agar sama panjang dengan set kedua. Contoh: `tr -t "abc" "xy"`
- Contoh penggunaan:
  - Ubah huruf kecil ke besar: `echo "hello" | tr "a-z" "A-Z"`
  - Hapus newline: `tr -d "\n" < file.txt`
  - Ganti spasi jadi newline: `tr " " "\n" < file.txt`
  - Hapus karakter non-printable: `tr -cd "\11\12\15\40-\176" < file.txt`

**sed**
- Fungsi: stream editor untuk memanipulasi teks (substitusi, hapus, sisip, dll).
- Opsi penting:
  - `-i` : edit file langsung (in-place). Contoh: `sed -i "s/lama/baru/g" file.txt`
  - `-n` : suppress output default, hanya tampilkan yang diminta. Contoh: `sed -n "1,5p" file.txt`
  - `-e` : multiple script. Contoh: `sed -e "s/a/b/" -e "s/c/d/" file.txt`
  - `-E` : extended regex. Contoh: `sed -E "s/(a|b)/x/g" file.txt`
  - `-r` : sama seperti `-E` (GNU sed)
- Perintah umum `sed`:
  - `s` : substitusi. Contoh: `sed "s/foo/bar/g" file.txt`
  - `d` : hapus baris. Contoh: `sed "3d" file.txt` (hapus baris 3)
  - `p` : print. Contoh: `sed -n "5p" file.txt`
  - `a` : append setelah baris. Contoh: `sed "2a\Teks baru" file.txt`
  - `i` : insert sebelum baris. Contoh: `sed "2i\Teks baru" file.txt`
  - `c` : ganti seluruh baris. Contoh: `sed "2c\Baris baru" file.txt`
  - `y` : translasi karakter. Contoh: `sed "y/abc/xyz/" file.txt`
- Contoh:
  - Hapus baris kosong: `sed "/^$/d" file.txt`
  - Ganti hanya baris ke-3: `sed "3s/foo/bar/" file.txt`
  - Hapus komentar: `sed "/^#/d" config.txt`

**awk**
- Fungsi: bahasa pemrograman untuk memproses teks berbasis baris dan field.
- Opsi penting:
  - `-F` : field separator. Contoh: `awk -F ":" '{print $1}' /etc/passwd`
  - `-v` : definisikan variabel. Contoh: `awk -v n=3 '{print $n}' file.txt`
  - `-f` : baca program dari file. Contoh: `awk -f script.awk file.txt`
- Variabel bawaan:
  - `$0` : seluruh baris. Contoh: `awk '{print $0}' file.txt`
  - `$1, $2, ...` : field ke-1, ke-2, dst. Contoh: `awk '{print $1, $3}' file.txt`
  - `NF` : jumlah field. Contoh: `awk '{print NF}' file.txt`
  - `NR` : nomor baris saat ini. Contoh: `awk '{print NR, $0}' file.txt`
  - `FS` : field separator. Contoh: `awk 'BEGIN{FS=":"} {print $1}' file.txt`
  - `OFS` : output field separator. Contoh: `awk 'BEGIN{OFS="-"}{print $1,$2}' file.txt`
- Pola dan aksi:
  - Cetak baris dengan kondisi: `awk '$3 > 100 {print $1}' data.txt`
  - Pola regex: `awk '/error/ {print}' log.txt`
  - BEGIN dan END: `awk 'BEGIN{print "Mulai"} {print $1} END{print "Selesai"}' file.txt`
  - Hitung total: `awk '{sum+=$1} END{print sum}' angka.txt`
  - Hitung rata-rata: `awk '{sum+=$1} END{print sum/NR}' angka.txt`
- Contoh:
  - Cetak kolom 1 dan 3 dengan pemisah koma: `awk -F "," '{print $1","$3}' data.csv`
  - Filter baris dengan panjang > 80: `awk 'length($0) > 80' file.txt`
  - Gabung dua file: `awk 'NR==FNR{a[$1]=$2; next} {print $1, a[$1]}' file1 file2`