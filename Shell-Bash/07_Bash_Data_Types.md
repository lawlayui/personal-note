1. **Semua Data adalah String:** Berbeda dari bahasa pemrosesan lain yang mewajibkan deklarasi tipe data khusus (seperti angka bulat/`integer`, angka pecahan/`float`, atau teks/`string`), Bash memperlakukan **semua variabel secara bawaan sebagai string/teks**.
    
2. **Operasi Aritmatika Implisit:** Walaupun diperlakukan sebagai string, Bash cukup fleksibel untuk menjalankan operasi matematika pada variabel yang berisi angka ketika dibutuhkan (misalnya menggunakan sintaks `(( ... ))` atau `let`).
    
3. **Dukungan Array:** Bash juga mendukung struktur data **Array**, yaitu variabel yang dapat menampung kumpulan/daftar nilai string sekaligus dalam satu nama variabel.

**1. Associative Array**
1.  **Pasangan Key-Value:** _Associative array_ adalah struktur data yang menyimpan informasi dalam bentuk pasangan **kunci dan nilai** (_key-value pairs_).
2.  **Perbedaan dengan Array Biasa:**
    - **Array biasa** menggunakan **indeks angka** berbasis posisi (`[0]`, `[1]`, `[2]`) untuk mengakses elemennya.
    - **Associative array** menggunakan **kata/string sebagai kunci** (`['nama']`, `['umur']`, `['kota']`).
	
3. **Keunggulan:** Memungkinkan Anda mengambil data berdasarkan label/nama yang memiliki makna, bukan sekadar urutan posisinya di dalam daftar.

Contoh: 
Secara bawaan di Bash (versi 4.0+), Anda harus mendeklarasikannya terlebih dahulu menggunakan perintah `declare -A`:

```bash 
# 1. Deklarasi associative array
declare -A user

# 2. Assign data (Key -> Value)
user["nama"]="Budi"
user["kota"]="Bandung"

# 3. Print nilai berdasarkan Kuncinya (Key)
echo ${user["nama"]}  # Output: Budi
echo ${user["kota"]}  # Output: Bandung
```

**2. Array**
1. **Definisi:** Array adalah kumpulan elemen terurut yang disimpan di bawah satu nama variabel tunggal, sehingga memudahkan pengelolaan data yang saling berkaitan.

2. **Cara Akses (Indeks):** Setiap elemen di dalam array diakses menggunakan **indeks angka**, di mana penomoran indeks di dalam Bash **dimulai dari angka nol (`0`)**.

3. **Tipe Data:** Di dalam Bash, elemen-elemen array dapat menampung data berupa string/teks maupun angka.

Contoh: 
Bisa juga memakai `declare -a [nama_variabel]`.

```bash
#!/bin/bash

buah=("Apel" "Pisang" "Jeruk" "Mangga")

echo "Elemen pertama (indeks 0) : ${buah[0]}"
echo "Elemen ketiga (indeks 2)  : ${buah[2]}"
echo "Semua isi array            : ${buah[@]}"
echo "Total elemen               : ${#buah[@]}"

buah[1]="Anggur"
buah+=("Melon")

echo "Isi array setelah diubah   : ${buah[@]}"
echo "Total elemen akhir         : ${#buah[@]}"
```

**3. Numeric**
1. **Perlakuan Default:** Secara bawaan, Bash menganggap semua variabel sebagai _string_ (teks). Bash tidak memiliki tipe data angka eksplisit seperti `integer` atau `float`.
    
2. **Interpretasi Kontekstual:** Meskipun disimpan sebagai _string_, Bash dapat mendeteksi dan menginterpretasikan _string_ tersebut sebagai angka ketika ditempatkan dalam konteks aritmatika.
    
3. **Kemampuan Operasi:** Mekanisme ini memungkinkan kita untuk melakukan kalkulasi matematis, perbandingan angka, dan manipulasi numerik lainnya secara langsung di dalam _script_.

```bash
#!/bin/bash

a=10
b=3

# 1. Operasi Aritmatika Dasar dengan (( ... ))
penjumlahan=$((a + b))
pembagian=$((a / b))       # Pembagian integer (pembulatan ke bawah)
sisa_bagi=$((a % b))       # Modulo / sisa hasil bagi

echo "10 + 3 = $penjumlahan" # Output: 13
echo "10 / 3 = $pembagian"   # Output: 3
echo "10 % 3 = $sisa_bagi"   # Output: 1

# 2. Increment & Decrement
((a++))                     # Menambah nilai a sebesar 1
echo "Nilai a setelah increment: $a" # Output: 11

# 3. Perbandingan Angka dalam Kondisikan (if)
# -gt = greater than (>), -lt = less than (<), -eq = equal (==)
if [ $a -gt $b ]; then
    echo "$a lebih besar dari $b"
fi

# 4. Aritmatika Bilangan Pecahan (Float) Menggunakan 'bc'
# Karena Bash bawaannya hanya mendukung integer, gunakan tool 'bc' untuk pecahan
hasil_float=$(echo "scale=2; 10 / 3" | bc)
echo "Hasil pembagian presisi float: $hasil_float" # Output: 3.33
```