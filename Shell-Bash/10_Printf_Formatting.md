
**1. Format Specifiers**

| **Specifier**       | **Tipe Data / Deskripsi**                  | **Contoh Input**      | **Hasil Tampilan** |
| ------------------- | ------------------------------------------ | --------------------- | ------------------ |
| **`%s`**            | String / Teks                              | `printf "%s" "Linux"` | `Linux`            |
| **`%d`** / **`%i`** | Integer (Bilangan Bulat Desimal)           | `printf "%d" 25`      | `25`               |
| **`%f`**            | Float (Bilangan Desimal/Pecahan)           | `printf "%f" 3.14`    | `3.140000`         |
| **`%x`** / **`%X`** | Integer ke Hexadecimal (Huruf kecil/Besar) | `printf "%x" 255`     | `ff`               |
| **`%o`**            | Integer ke Octal                           | `printf "%o" 8`       | `10`               |
| **`%%`**            | Menampilkan Karakter Persen Saja (`%`)     | `printf "100%%"`      | `100%`             |

**2. Atribut Pengaturan**

|**Atribut / Modifier**|**Fungsi / Deskripsi**|**Contoh Sintaks**|**Hasil Output**|
|---|---|---|---|
|**`-` (Min)**|Rata **Kiri** (default-nya Rata Kanan)|`printf "\|%-10s\|" "Bash"`|`\|Bash \|`|
|**`Angka` (Width)**|Menentukan **lebar minimum** kolom|`printf "\|%10s\|" "Bash"`|`\| Bash\|`|
|**`0` (Zero Pad)**|Mengisi ruang kosong dengan **angka `0`**|`printf "%05d" 42`|`00042`|
|**`.N` (Precision)**|Batas jumlah angka **di belakang koma** (Float)|`printf "%.2f" 12.345`|`12.35`|
|**`.N` (String)**|Memotong String hingga maksimal **N karakter**|`printf "%.3s" "Ubuntu"`|`Ubu`|
|**`+` (Plus)**|Menampilkan **tanda plus/minus** pada angka|`printf "%+d" 50`|`+50`|

**3. Escape Sequences Common**

| **Escape Code** | **Fungsi**                             |
| --------------- | -------------------------------------- |
| **`\n`**        | Membuat baris baru (_New line_)        |
| **`\t`**        | Membuat tab horizontal (_Tab spacing_) |

Contoh: 

```bash 
#!/bin/bash

# Format Gabungan: Rata kiri (-), lebar 12 karakter (12), potong max 8 karakter (.8)
printf "|%-12.8s|\n" "Administrator"
# Output: |Administ|

# Format Gabungan: Lebar 8 karakter (8), presisi 2 desimal (.2)
printf "|%8.2f|\n" 45.6
# Output: |   45.60|

# Format Kode Produk: Lebar 6 digit dengan padding 0 (%06d)
printf "ID: PROD-%06d\n" 78
# Output: ID: PROD-000078
```

