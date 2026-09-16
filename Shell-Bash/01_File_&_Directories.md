**Navigasi dan Informasi Direktori**
- **`pwd`** (Print Working Directory): Menampilkan jalur (_path_) dari folder/direktori tempat Anda berada saat ini.
    - Contoh: `pwd`

- **`cd`** (Change Directory): Pindah dari folder tempat Anda berada ke folder lain.
    - Contoh: `cd Documents` (pindah ke folder Documents) atau `cd ..` (kembali ke folder sebelumnya).

- **`ls`** (List): Menampilkan daftar file dan folder yang ada di dalam direktori saat ini.
    - Contoh: `ls` atau `ls -l` (menampilkan daftar secara detail).
        
**Manajemen File dan Folder**
- **`mkdir`** (Make Directory): Membuat folder/direktori baru.
    - Contoh: `mkdir folder_baru`
        
- **`touch`**: Membuat file kosong baru atau memperbarui stempel waktu (_timestamp_) file yang sudah ada.
    - Contoh: `touch catatan.txt`
        
- **`rm`** (Remove): Menghapus file atau folder.
    - Contoh: `rm catatan.txt` (menghapus file) atau `rm -r folder_lama` (menghapus folder beserta isinya).
        
- **`rmdir`** (Remove Directory): Menghapus folder yang **kosong**.
    - Contoh: `rmdir folder_kosong`
        
- **`mv`** (Move): Memindahkan file/folder ke lokasi lain, atau mengubah nama (_rename_) file/folder.
    - Contoh: `mv catatan.txt Documents/` (memindahkan) atau `mv lama.txt baru.txt` (mengubah nama).
        
**Membaca dan Menampilkan Output**
- **`echo`**: Menampilkan teks ke terminal atau memasukkan teks ke dalam file.
    - Contoh: `echo "Halo Dunia"` atau `echo "Isi teks" > catatan.txt`
        
- **`cat`** (Concatenate): Menampilkan seluruh isi dari suatu file teks ke terminal.
    - Contoh: `cat catatan.txt`
        
**Pencarian dan Operasi Lainnya**
- **`find`**: Mencari file atau folder berdasarkan nama, ukuran, atau kriteria lainnya di dalam direktori.
    - Contoh: `find . -name "catatan.txt"` (mencari file bernama catatan.txt di folder saat ini).
        
- **`cp`** (Copy)*: Menyalin file atau folder dari satu lokasi ke lokasi lain.
    - Contoh: `cp data.txt dokumen/`
        
        _(Catatan: `op` umumnya merupakan singkatan khusus/alias di sistem tertentu atau penulisan yang salah dari perintah `cp` (Copy) yang merupakan perintah standar Linux)._