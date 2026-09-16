**1. Menimpa Output (`>`)**
Mengarahkan hasil perintah normal ke file. Jika file sudah ada, isinya ditimpa/dihapus.

```bash
echo "Baris pertama" > catatan.txt
cat catatan.txt
```

**2. Menambahkan Output (`>>`)**
Mengarahkan hasil perintah ke file dengan menempelkannya di baris paling bawah. Isi lama tidak hilang.

```bash
echo "Baris kedua" >> catatan.txt
cat catatan.txt
```

**3. Mengarahkan Error (`2>`)**
Hanya menangkap pesan kesalahan (stderr) dan menyimpannya ke file atau membuangnya ke tempat sampah.
  
```bash
ls /folder_fiktif 2> error.log
cat error.log
```

**4. Mengarahkan Output dan Error Sekaligus (`&>`)**
Menangkap hasil normal dan pesan error sekaligus ke dalam satu file.

```bash
ls /tmp /folder_fiktif &> semua.log
cat semua.log
```

**5. Membaca Input dari File (`<`)**
Mengirimkan isi file sebagai input untuk suatu perintah (menggantikan ketikan keyboard).

```bash
wc -w < catatan.txt
```

**6. Menulis Banyak Baris (`<< EOF`)**
Membuat atau mengisi file dengan banyak baris teks sekaligus secara langsung tanpa membuka editor.

```bash
cat << EOF > jadwal.txt
- Senin: Belajar Bash
- Selasa: Latihan Redirection
EOF
cat jadwal.txt
```