
|**Operator**|**Fungsi**|**Sintaks Ideal [[ ... ]]**|**Sintaks Legacy [ ... ]**|**Eksekusi Perintah (Short-circuit)**|
|---|---|---|---|---|
|**`&&`**|**AND** _(Bernilai TRUE jika kedua kondisi TRUE)_|`[[ cond1 && cond2 ]]`|`[ cond1 -a cond2 ]`|`command1 && command2`|
|**`\|`**|**OR** _(Bernilai TRUE jika salah satu kondisi TRUE)_|`[[ cond1 \| cond2 ]]`|`[ cond1 -o cond2 ]`|`command1 \| command2`|
|**`!`**|**NOT** _(Membalikkan nilai logika: TRUE $\rightarrow$ FALSE)_|`[[ ! cond ]]`|`[ ! cond ]`|`! command`|

Contoh: 

```bash 
#!/bin/bash

a=10
b=20
nama="Budi"

# 1. Operator AND (&&)
[[ $a -eq 10 && "$nama" == "Budi" ]]
echo "a=10 DAN nama=Budi? Exit status: $?" # Output: 0 (True)

# 2. Operator OR (||)
[[ $a -eq 5 || $b -eq 20 ]]
echo "a=5 ATAU b=20? Exit status: $?" # Output: 0 (True)

# 3. Operator NOT (!)
[[ ! $a -eq 5 ]]
echo "a TIDAK SAMA DENGAN 5? Exit status: $?" # Output: 0 (True)

# 4. Short-Circuit Execution (Kontrol Alur Perintah)
# Jalankan echo hanya jika mkdir berhasil
mkdir /tmp/test_folder && echo "Folder berhasil dibuat"

# Jalankan echo hanya jika cd gagal
cd /folder_tidak_ada || echo "Gagal masuk folder"
```

