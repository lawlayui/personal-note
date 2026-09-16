**1. Command Substitution `$(command)`**
Mengubah output perintah menjadi **string teks**. Biasanya disimpan ke variabel atau dijadikan argumen.

```bash
# Simpan hasil perintah 'date' ke variabel
sekarang=$(date)
echo "Hari ini: $sekarang"

# Gunakan output perintah langsung di nama file
touch "backup_$(date +%Y%m%d).txt"
```

**2. Input Process Substitution `<(command)`**
Mengubah output perintah menjadi **file virtual untuk dibaca**. Digunakan saat perintah utama wajib menerima input berupa file.

```bash
# Perintah 'diff' membandingkan 2 file virtual dari hasil 'ls'
diff <(ls folder_A) <(ls folder_B)
```

**3. Output Process Substitution `>(command)`**
Mengalirkan output dari perintah utama ke **file virtual untuk diproses** oleh perintah di dalam kurung.

```bash
# 'tee' menulis ke file virtual, lalu diproses oleh 'grep'
echo "ERROR: System Failure" | tee >(grep "ERROR" > log_error.txt)
```