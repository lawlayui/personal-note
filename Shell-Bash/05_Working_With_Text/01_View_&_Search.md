**grep**
- Fungsi: mencari pola teks dalam file atau input.
- Opsi penting:
  - `-i` : abaikan perbedaan huruf besar/kecil. Contoh: `grep -i "error" file.log`
  - `-r` : cari secara rekursif di dalam direktori. Contoh: `grep -r "TODO" .`
  - `-n` : tampilkan nomor baris. Contoh: `grep -n "main" program.c`
  - `-v` : tampilkan baris yang **tidak** cocok. Contoh: `grep -v "^#" config.txt`
  - `-l` : hanya tampilkan nama file yang mengandung pola. Contoh: `grep -l "import" *.py`
  - `-c` : hitung jumlah baris yang cocok. Contoh: `grep -c "failed" log.txt`
  - `-E` : gunakan extended regular expression. Contoh: `grep -E "error|warning" file.log`
  - `-w` : cocokkan seluruh kata. Contoh: `grep -w "is" file.txt`
- Contoh kombinasi: `grep -rin "todo" src/`

**less, more**
- Fungsi: melihat isi file per halaman. `less` lebih fleksibel daripada `more`.
- Opsi penting `less`:
  - `-N` : tampilkan nomor baris. Contoh: `less -N file.txt`
  - `-S` : potong baris panjang (tidak wrap). Contoh: `less -S data.csv`
  - `+F` : mode follow (seperti `tail -f`). Contoh: `less +F /var/log/syslog`
  - `-p pola` : mulai dari baris yang mengandung pola. Contoh: `less -p "error" log.txt`
- Opsi penting `more`:
  - `-d` : tampilkan petunjuk navigasi. Contoh: `more -d file.txt`
  - `+num` : mulai dari baris ke-num. Contoh: `more +10 file.txt`
- Contoh penggunaan: `less /etc/passwd`, `more file.txt`

**head, tail**
- Fungsi: menampilkan awal atau akhir file.
- Opsi penting `head`:
  - `-n` : jumlah baris. Contoh: `head -n 5 file.txt` (5 baris pertama)
  - `-c` : jumlah byte. Contoh: `head -c 100 file.txt`
  - `-q` : tidak menampilkan header nama file. Contoh: `head -q file1 file2`
- Opsi penting `tail`:
  - `-n` : jumlah baris. Contoh: `tail -n 10 file.txt`
  - `-f` : follow, tampilkan baris baru secara real-time. Contoh: `tail -f /var/log/syslog`
  - `-F` : follow dan retry jika file dirotasi. Contoh: `tail -F /var/log/nginx/access.log`
  - `-c` : jumlah byte. Contoh: `tail -c 50 file.txt`
- Contoh kombinasi: `tail -n 20 -f log.txt`

**find**
- Fungsi: mencari file/direktori berdasarkan kriteria.
- Opsi penting:
  - `-name` : nama file (case-sensitive). Contoh: `find . -name "*.txt"`
  - `-iname` : nama file (case-insensitive). Contoh: `find . -iname "*.jpg"`
  - `-type` : tipe (f=file, d=directory). Contoh: `find /home -type d -name "backup"`
  - `-size` : ukuran file. Contoh: `find . -size +10M` (lebih dari 10MB)
  - `-mtime` : waktu modifikasi dalam hari. Contoh: `find . -mtime -7` (7 hari terakhir)
  - `-exec` : eksekusi command untuk setiap hasil. Contoh: `find . -name "*.tmp" -exec rm {} \;`
  - `-delete` : hapus file yang ditemukan. Contoh: `find . -name "*.bak" -delete`
  - `-maxdepth` : kedalaman maksimum pencarian. Contoh: `find . -maxdepth 2 -name "*.conf"`
  - `-perm` : permission file. Contoh: `find . -perm 644`
- Contoh umum: `find /var/log -name "*.log" -mtime +30 -delete`