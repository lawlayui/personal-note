**1. Clean Code Principle**
*Clean code* (kode yang bersih) mengacu pada kode yang mudah dibaca, dipahami, dan dimodifikasi, dengan menerapkan praktik-praktik seperti penggunaan nama yang bermakna, fungsi yang ringkas, dan struktur yang jelas. Pendekatan ini lebih mengutamakan kejelasan daripada kecanggihan teknis, mengingat kode jauh lebih sering dibaca daripada ditulis. Menulis *clean code* dapat mengurangi waktu yang dibutuhkan untuk memperbaiki *bug* atau menambahkan fitur, serta mempermudah kolaborasi ketika beberapa pengembang bekerja pada basis kode yang sama.

**2. Paradigma Pemrograman (Fokus pada bagaimana program berjalan langkah demi langkah** 
**2.1 Pemrograman Imperatif** 
- Pemrograman Prodesural
	Paradigma ini berfokus pada penyelesaian masalah melalui langkah-langkah berurutan (instruksi demi instruksi) yang dikelompokkan ke dalam prosedur atau fungsi.
	
	Langkah demi Langkah (Step-by-Step Execution)
	Program dijalankan secara linier dari atas ke bawah. Setiap baris kode memberi tahu komputer apa yang harus dilakukan selanjutnya.
	
	Penggunaan Prosedur / Fungsi (Subroutine)
	Kode yang sering digunakan kembali dipecah menjadi blok-blok kecil yang disebut fungsi atau prosedur. Tujuannya adalah agar kode tidak ditulis berulang kali (prinsip Don't Repeat Yourself / DRY).
	
	Fokus pada Alur Data (Data Flow)
	Data dan fungsi diperlakukan secara terpisah. Data disimpan dalam variabel, lalu dimasukkan ke dalam fungsi untuk diolah.
	
	Data bersifat Global / Semi-Global (Global State)
	Variabel sering kali dapat diakses oleh beberapa prosedur sekaligus, yang berarti nilai data bisa diubah oleh bagian program mana pun di tengah eksekusi.

- Pemrograman Berorientasi Objek (OOP)
	Pemrograman Berorientasi Objek (Object-Oriented Programming / OOP) adalah paradigma pemrograman yang menyusun kode program berdasarkan objek nyata beserta atribut dan perilakunya.
	
	Encapsulation (Pembungkusan & Perlindungan Data)
	Menggabungkan data (field) dan metode (method) dalam satu kelas, serta menyembunyikan detail akses data langsung dari luar menggunakan hak akses (seperti private atau public).
	Manfaat: Mencegah data diubah secara tidak sah oleh bagian kode lain.
	
	Inheritance (Pewarisan)
	Kemampuan suatu Class baru (child class) untuk mewarisi atribut dan metode dari Class yang sudah ada (parent class).
	Manfaat: Menghindari pengulangan kode (code reuse). Contoh: Class Kucing dan Anjing bisa mewarisi kelas utama Hewan.
	
	Polymorphism (Banyak Bentuk)
	Kemampuan satu metode untuk memiliki perilaku yang berbeda-beda tergantung objek yang memanggilnya.
	Manfaat: Fleksibilitas kode. Contoh: Metode bersuara() pada kelas Hewan akan menghasilkan suara "Meow" jika dipanggil oleh Kucing dan "Gug" jika dipanggil oleh Anjing.
	
	Abstraction (Penyembunyian Detail)
	Menyembunyikan proses internal yang rumit dan hanya menampilkan antarmuka (interface) penting yang dibutuhkan oleh pengguna.
	Manfaat: Menyederhanakan kompleksitas kode. Contoh: Saat menyalakan mobil, Anda hanya menekan tombol Start tanpa perlu tahu bagaimana urutan pembakaran mesin di dalamnya.
	****
**2.2 Pemrograman Deklaratif (Fokus pada apa hasil yang ingin dicapai)**
- Pemrograman Fungsional 
	Pemrograman Fungsional (Functional Programming / FP) adalah paradigma pemrograman deklaratif yang menyusun program berdasarkan eksekusi fungsi-fungsi matematika murni (pure functions) dan menghindari perubahan status data (mutable state).
	
	Pure Functions (Fungsi Murni)
	Fungsi murni selalu menghasilkan output yang sama jika diberi input yang sama, dan tidak mengubah apapun di luar fungsi tersebut (tidak ada efek samping).
	Contoh Murni: f(x) = x + 2. Diberi input 3, nilainya selalu 5.
	Tidak Murni: Fungsi yang membaca jam sistem atau mengubah variabel global di luar dirinya.
	
	Immutability (Data Tidak Boleh Diubah)
	Setelah dibuat, variabel atau objek tidak boleh diubah nilainya. Jika ingin mengubah data, sistem akan membuat data baru hasil salinan/transformasi dari data lama.
	
	First-Class dan Higher-Order Functions
	First-Class Function: Fungsi diperlakukan sama seperti variabel biasa (bisa disimpan dalam variabel, dimasukkan ke fungsi lain sebagai argumen, atau dikembalikan sebagai return value).
	
	Higher-Order Function: Fungsi yang menerima fungsi lain sebagai argumen atau mengembalikan fungsi lain (contoh: map, filter, reduce).
	
	Menghindari Side Effects (Efek Samping)
	Operasi dalam FP diusahakan tidak merusak status aplikasi di luar fungsi, seperti merubah isi array global, mengubah file di disk, atau menulis data ke database di tengah proses kalkulasi.