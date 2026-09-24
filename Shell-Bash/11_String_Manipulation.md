**1. String Length**
Menggunakan sysntax `${#variabel}`. 

```bash 
#!/bin/bash

teks="Halo Dunia"
panjang=${#teks}

echo "Panjang string: $panjang"  # Output: 10
```

**2. Substring Extraction**
Proses mengambil atau memotong sebagian karakter dari sebuah string berdasarkan posisi index dan panjang karakter yang di inginkan. 

```
${variabel:offset:length}
```

- `offset`: Posisi awal karaker yang ingin di ambil. 
- `length`: Jumlah karakter yang ingin di ambil (opsional).

```bash 
#!/bin/bash

teks="LinuxBash"

# Ambil 5 karakter mulai dari indeks ke-0
echo "${teks:0:5}"   # Output: Linux

# Ambil 4 karakter mulai dari indeks ke-5
echo "${teks:5:4}"   # Output: Bash
```

**3. Case Conversion**

|**Operator**|**Fungsi**|**Contoh Sintaks**|**Input**|**Hasil**|
|---|---|---|---|---|
|**`^`**|Mengubah **karakter pertama** menjadi **kapital**|`${var^}`|`"bash"`|`"Bash"`|
|**`^^`**|Mengubah **semua karakter** menjadi **KAPITAL**|`${var^^}`|`"bash"`|`"BASH"`|
|**`,`**|Mengubah **karakter pertama** menjadi **kecil**|`${var,}`|`"BASH"`|`"bASH"`|
|**`,,`**|Mengubah **semua karakter** menjadi **kecil**|`${var,,}`|`"BASH"`|`"bash"`|
|**`~`**|Membalikkan kapitalisasi (_toggle_) **karakter pertama**|`${var~}`|`"Bash"`|`"bash"`|
|**`~~`**|Membalikkan kapitalisasi (_toggle_) **semua karakter**|`${var~~}`|`"Linux Bash"`|`"lINUX bASH"`|

```bash
#!/bin/bash

mode="production"
status="RUNNING"

# 1. Menyeragamkan input ke huruf kecil semua (Sangat berguna untuk pembandingan data)
if [[ "${mode,,}" == "production" ]]; then
    echo "Sistem berjalan pada mode Produksi."
fi

# 2. Mengubah huruf pertama jadi kapital untuk format nama/tampilan
nama="budi"
echo "Halo, ${nama^}!" # Output: Halo, Budi!

# 3. Mengubah ke kapital semua untuk logging/header
echo "STATUS SAAT INI: ${status^^}" # Output: STATUS SAAT INI: RUNNING
```
