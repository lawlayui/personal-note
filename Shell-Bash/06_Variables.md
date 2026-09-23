**1. Enviroment Variables VS.  Shell Variables**
1. **Environment Variables:** Nilai dinamis yang dapat memengaruhi perilaku program/proses di komputer. Variabel ini bersifat global dan diturunkan (_inherited_) ke proses turunan (_child processes_).
    
2. **Shell Variables:** Variabel yang hanya berlaku lokal pada sesi _shell_ saat ini. Variabel ini tidak otomatis diturunkan ke _child processes_ dan digunakan untuk menyimpan nilai sementara atau mengatur perilaku _shell_ itu sendiri.

**2. Konsep Dasar dan Cara Kerja**
1. **Definisi:** Variabel adalah lokasi penyimpanan berlabel/bernama untuk menampung data.
2.  **Pembuatan:** Variabel dibuat dengan cara memberikan (_assign_) suatu nilai ke sebuah nama.
3. **Penggunaan:** Nilai variabel dapat ditampilkan (_print_) serta diubah (_modify_) secara dinamis sesuai kebutuhan di dalam _script_.

**2.1. Assign (Membuat / Mengisi variabel)**
Untuk mengisi nilai ke dalam variabel, gunakan operator nilai sama dengan (`=`). 
- **Aturan Penting**: Tidak boleh ada spasi di sekitar tanda `=` (baik sebelum maupun sesudahnya).

```bash 
# Benar
nama="Budi"
umur=25

# Salah (Akan menghasilkan error "command not found")
nama = "Budi"
umur = 25
```

**2.2. Print (Menampilkan Nilai Variabel)**
Untuk mengambil atau menampilkan nilai variabel, wajib menggunakan simbol dolar ($) di depan nama variabel tersebut. 

Printah `echo` atau `printf` bisa digunakan untuk mengecek nilainya ke layar: 

```bash 
nama="Budi"

# Menampilkan nilai variabel
echo $nama

# Menggabungkannya di dalam teks (Gunakan tanda kutip ganda " ")
echo "Halo, nama saya adalah $nama"

# Menggunakan tanda kurung kurawal {} untuk memperjelas batas nama variabel
echo "Nama saya ${nama}anto"  # Output: Nama saya Budianto
```

**Catatan tanda kutip**: 
- Tanda kutip ganda (" ... "): Mengevaluasi variabel (variabel di eksekusi). 
- Tanda kutip tunggal (' ... '): Memperlakukan teks secara mentah atau literal (echo '$nama') akan mencetak $nama, bukan budi. 

**2.3. Modify (Mengubah Nilai Variabel)**
Mengubah nilai variabel dilakukan dengan cara memberikan nilai baru (_re-assign_) menggunakan nama variabel yang sama. Saat mengubah nilai, tidak perlu menggunakan simbol `$`.

- **Mengganti Nilai Secara Langsung:**

```bash 
status="Pending"
echo $status    # Output: Pending

# Mengubah nilai
status="Completed"
echo $status    # Output: Completed
```

- **Mengubah Berdasakan Nilai Lama:**

```bash 
pesan="Halo"
pesan="$pesan Dunia"
echo $pesan     # Output: Halo Dunia
```

- **Mengubah Nilai Angka:**
Secara default, Bash menganggap semua variabel sebagai teks/string. Untuk melakukan operasi matematika pada variabel, gunakan sintaks `(( ... ))` atau `expr`:

```bash 
skor=10

# Menambah nilai sebesar 5
skor=$((skor + 5))
echo $skor      # Output: 15

# Increment (tambah 1)
((skor++))
echo $skor      # Output: 16
```

**3. Cakupan Variabel (Variable Scope)**
- Tanpa `local` (Global Scope): 
Variabel dapat dibaca dan diubah dari bagian mana pun di dalam _script_ setelah variabel tersebut diinisialisasi.

```bash
my_func() {
    pesan="Halo dari fungsi" # Variabel global
}
my_func
echo $pesan # Output: Halo dari fungsi
```

- Menggunakan kata kunci `local` (Local Scope): 
Variabel yang dideklarasikan dengan `local` **hanya dapat diakses di dalam fungsi** tempat ia dibuat (serta fungsi turunan yang dipanggil dari dalam fungsi tersebut).

```bash 
my_func() {
    local pesan="Halo lokal" # Hanya hidup di dalam fungsi
}
my_func
echo $pesan # Output: (kosong/tidak ada)
```

 - Menggunakan `export` (Enviroment Variabel): 
 Perintah `export` membuat variabel dapat diakses oleh proses anak (_child process_) atau _script_ turunan yang dijalankan dari sesi tersebut.

 ```bash 
 export API_KEY="12345" # Dapat dibaca oleh script/subshell yang dipanggil
 ```

 **4. Special Variable**
 **4.1 Variable Argument (Input Parameter)**
 Variabel ini digunakan untuk menangkap nilai yang dikirimkan saat _script_ dijalankan dari terminal (misal: `./script.sh arg1 arg2`).

- **`$0`**: Menyimpan **nama file _script_** yang sedang dijalankan.
- **`$1`, `$2`, `$3`, dst.**: Menyimpan **argumen ke-1, ke-2, ke-3**, dan seterusnya.
- **`$#`**: Menyimpan **jumlah total argumen** yang diberikan ke _script_.
- **`$@`**: Menyimpan **seluruh argumen** sebagai daftar terpisah (cocok digunakan dalam perulangan `for`).
- **`$*`**: Menyimpan **seluruh argumen** sebagai satu kesatuan string tunggal.

Contoh: 

```bash 
# Dipanggil dengan: ./backup.sh data.txt /tmp
echo "Nama script : $0"  # Output: ./backup.sh
echo "Argumen 1   : $1"  # Output: data.txt
echo "Total argumen: $#"  # Output: 2
```

**4.2 Variabel Status dan Proses (System & Execution)**
- **`$?`** _(Sangat Penting)_: Menyimpan **exit status** dari perintah terakhir yang dieksekusi.
    - Nilai `0` = Perintah berhasil (_success_).
    - Nilai selain `0` (1–255) = Perintah gagal atau menghasilkan error (_failure_).
	
- **`$$`**: Menyimpan **Process ID (PID)** dari _script_ yang sedang berjalan saat ini.
- **`$!`**: Menyimpan **Process ID (PID)** dari perintah latar belakang (_background job_) yang terakhir dijalankan.

Contoh: 

```bash
mkdir /root/test 2>/dev/null
if [ $? -eq 0 ]; then
    echo "Folder berhasil dibuat"
else
    echo "Gagal membuat folder (Exit status: $?)"
fi
```

**4.3 Variabel Lingkungan Sesi (Enviroment Defaults)**
Variabel yang diisi otomatis oleh _shell_ untuk memberikan informasi tentang sesi pengguna saat ini:

- **`$USER`**: Nama pengguna (_username_) yang sedang aktif.
- **`$HOME`**: Jalur (_path_) direktori utama pengguna (contoh: `/home/budi`).
- **`$PWD`**: Direktori tempat Anda berada saat ini (_Print Working Directory_).
- **`$RANDOM`**: Menghasilkan angka acak antara `0` sampai `32767` setiap kali dipanggil.

