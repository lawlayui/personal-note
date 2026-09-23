### Operator Uji File yang Paling Sering Digunakan

|**Operator**|**Fungsi / Kondisi Bernilai TRUE Jika...**|
|---|---|
|**`-e`**|File atau direktori **ada** (_exists_).|
|**`-f`**|Berkas tersebut ada dan merupakan **regular file** (bukan direktori).|
|**`-d`**|Berkas tersebut ada dan merupakan **direktori/folder**.|
|**`-s`**|File ada dan **ukurannya lebih besar dari 0 byte** (tidak kosong).|
|**`-r`**|File ada dan dapat **dibaca** (_read_).|
|**`-w`**|File ada dan dapat **ditulisi** (_write_).|
|**`-x`**|File ada dan dapat **dieksekusi** (_execute_).|
|**`-L`**|Berkas merupakan sebuah **symbolic link** (shortcut).|

Contoh: 

```bash 
#!/bin/bash

file_config="app.conf"
folder_log="logs"

# 1. Cek apakah file ada dan tidak kosong (-s)
if [ -s "$file_config" ]; then
    echo "Membaca konfig..."
else
    echo "File konfig tidak ditemukan atau kosong!"
fi

# 2. Cek apakah direktori ada (-d), jika tidak ada maka buat
if [ ! -d "$folder_log" ]; then
    echo "Membuat folder log..."
    mkdir "$folder_log"
fi

# 3. Cek izin eksekusi (-x)
if [ -x "script.sh" ]; then
    ./script.sh
else
    echo "Script tidak memiliki izin eksekusi (+x)"
fi
```
