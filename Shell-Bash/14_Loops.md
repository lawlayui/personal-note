**1. Perulangan `for`**
```bash
# Bentuk 1: Iterasi daftar (list)
for var in item1 item2 item3; do
    # Perintah
done

# Bentuk 2: Gaya C (Numeric)
for (( i=0; i<5; i++ )); do
    # Perintah
done
```

**2. Perulangan `while`**
```bash
while [[ kondisi ]]; do
    # Perintah
    # (Pastikan ada perubahan variabel agar tidak loop selamanya)
done
```

**3. Penggunaan `break` dan `continue`**
- **`break`** : Menghentikan dan keluar dari seluruh proses _looping_ secara paksa saat itu juga.
- **`continue`** : Melompati sisa perintah pada iterasi saat ini dan langsung melanjutkan ke iterasi/putaran berikutnya.

```bash
#!/bin/bash

echo "=== Contoh FOR Loop ==="
for (( i=1; i<=10; i++ )); do
    # Lompati angka 3 (continue)
    if (( i == 3 )); then
        echo "Langkah $i di-skip (continue)"
        continue
    fi

    # Hentikan loop jika mencapai angka 7 (break)
    if (( i == 7 )); then
        echo "Loop dihentikan pada angka $i (break)"
        break
    fi

    echo "Angka: $i"
done
```