### Operator Aritmatika Bash

|**Operator Matematika**|**Fungsi / Operasi**|**Contoh Sintaks (( ... ))**| **Hasil (jika a=10, b=3)**  |
|---|---|---|---|
|**`+`**|Penjumlahan|`hasil=$((a + b))`| `13`                        |
|**`-`**|Pengurangan|`hasil=$((a - b))`| `7`                         |
|**`*`**|Perkalian|`hasil=$((a * b))`| `30`                        |
|**`/`**|Pembagian (_Integer_)|`hasil=$((a / b))`| `3` _(dibulatkan ke bawah)_ |
|**`%`**|Modulo _(Sisa Hasil Bagi)_|`hasil=$((a % b))`| `1`                         |
|**`**`**|Pemangkatan _(Exponentiation)_|`hasil=$((a ** b))`| `1000` _(10 pangkat 3)_     |
|**`++`**|Increment _(Tambah 1)_|`((a++))`| Nilai `a` menjadi `11`      |
|**`--`**|Decrement _(Kurang 1)_|`((a--))`| Nilai `a` menjadi `9`<br>   |

Contoh: 

```bash 
#!/bin/bash

a=10
b=3

# 1. Operasi Matematika Dasar
tambah=$((a + b))
kurang=$((a - b))
kali=$((a * b))
bagi=$((a / b))
mod=$((a % b))
pangkat=$((a ** b))

echo "10 + 3  = $tambah"   # Output: 13
echo "10 - 3  = $kurang"   # Output: 7
echo "10 * 3  = $kali"     # Output: 30
echo "10 / 3  = $bagi"     # Output: 3
echo "10 % 3  = $mod"      # Output: 1
echo "10 ^ 3  = $pangkat"  # Output: 1000

# 2. Increment & Decrement
((a++))
echo "Nilai a setelah a++ : $a" # Output: 11

((b--))
echo "Nilai b setelah b-- : $b" # Output: 2
```
