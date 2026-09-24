**1. Sintaks**
Cara 1: 
```bash 
function nama_fungsi {
    # Perintah yang akan dieksekusi
    echo "Pesan dari fungsi"
}
```

Cara2: 
```bash
nama_fungsi() {
    # Perintah yang akan dieksekusi
    echo "Pesan dari fungsi"
}
```

**2. Memanggil Fungsi**
Untuk menjalankan fungsi, cukup panggil nama fungsinya **tanpa tanda kurung `()`**.

```bash
nama_fungsi
```

**3. Mengirimkan Argumen/Parameter ke Fungsi**
Fungsi di Bash menerima argumen menggunakan variabel posisi bawaan:
- **`$1`**: Argumen/parameter pertama
- **`$2`**: Argumen/parameter kedua
- **`$@`**: Seluruh argumen yang dikirim
- **`$#`**: Jumlah argumen yang dikirim

```bash
#!/bin/bash

# Deklarasi fungsi
function sapa_user {
    local nama="$1"
    local peran="$2"
    echo "Halo $nama, peran Anda adalah $peran."
}

# Memanggil fungsi dengan mengirim 2 argumen
sapa_user "Budi" "Administrator"
```

**4. Mengembalikan Status / Nilai (Return)**
Fungsi di Bash **tidak mengembalikan nilai teks secara langsung** seperti bahasa pemrogramannya lainnya (seperti Python/JavaScript). Perintah `return` hanya digunakan untuk mengembalikan **exit status (0-255)**.

Untuk "mengembalikan" teks/string, gunakan perintah `echo` atau `printf` lalu tangkap outputnya menggunakan _command substitution_ `$(...)`.

```bash
#!/bin/bash

function hitung_luas {
    local alas="$1"
    local tinggi="$2"
    local luas=$(( (alas * tinggi) / 2 ))
    
    # Cetak hasil agar bisa ditangkap di luar
    echo "$luas"
}

# Tangkap hasil output fungsi ke dalam variabel
hasil=$(hitung_luas 10 5)

echo "Luas segitiga: $hasil" # Output: Luas segitiga: 25
```