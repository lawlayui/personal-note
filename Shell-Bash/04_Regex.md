## 1. Fondasi Mesin Regex (Mental Model & Matching Pipeline)
- **Eksekusi Kiri-ke-Kanan (Left-to-Right Execution):** Mesin Regex membaca teks karakter demi karakter dari kiri ke kanan.
    
- **Backtracking:** Jika mesin memilih jalur pencocokan yang gagal di tengah jalan, mesin akan mundur (_backtrack_) ke titik percabangan terakhir untuk mencoba jalur alternatif.
    
- **Karakter Literal vs Meta-karakter:**
    - _Literal:_ Karakter biasa yang mencocokkan dirinya sendiri (`a`, `B`, `1`).
        
    - _Meta-karakter:_ Karakter dengan makna instruksional khusus (`.`, `*`, `+`, `?`, `^`, `$`, `[`, `]`, `(`, `)`, `{`, `}`, `|`, `\`).
        
- **Escape Character (`\`):** Digunakan untuk mengubah meta-karakter menjadi literal (misal: `\.` berarti titik literal, bukan _wildcard_).

## 2. Anchor & Boundary (Penanda Posisi Tanpa Mengonsumsi Karakter)
Simbol dalam kategori ini tidak mencocokkan teks, melainkan mengecek **kondisi posisi** (disebut _Zero-Width Assertions_).

- **Line Anchors:**
    - `^` : Awal baris.
        
    - `$` : Akhir baris.
        
- **Word Boundaries (`\b` dan `\B`):**
    - `\b` : Batas kata (posisi transisi antara karakter kata `\w` dan karakter non-kata `\W`, atau awal/akhir string).
        - _Contoh:_ `\bcat\b` mencocokkan `"cat"` pada `"the cat sat"`, tapi tidak pada `"category"`.
            
    - `\B` : Bukan batas kata (posisi di mana kedua karakter di sekitarnya adalah karakter kata atau keduanya non-kata).
        
- **String Anchors (Khusus Engine Tertentu seperti PCRE/Python/Perl):**
    - `\A` : Awal seluruh input/string (tidak terpengaruh mode multiline).
        
    - `\Z` / `\z` : Akhir seluruh input/string.
        

## 3. Character Classes & Shorthand Sequences
Digunakan untuk mencocokkan **satu karakter** berdasarkan kategori tertentu.

- **Custom Character Class (`[...]`):**
    - `[abc]` : Karakter `a`, `b`, atau `c`.
        
    - `[a-z]` : Rentang karakter dari `a` sampai `z`.
        
    - `[^abc]` : **Negasi** (karakter apa saja _kecuali_ `a`, `b`, atau `c`).
        
- **Wildcard (`.`):**
    - Mencocokkan karakter apa saja kecuali _newline_ `\n` (kecuali flag _dotall/singleline_ aktif).
        
- **Shorthand Character Classes:**
    
| **Shorthand** | **Ekuivalen**    | **Keterangan**                                            |
| ------------- | ---------------- | --------------------------------------------------------- |
| **`\d`**      | `[0-9]`          | Digit angka.                                              |
| **`\D`**      | `[^0-9]`         | Bukan digit angka.                                        |
| **`\w`**      | `[a-zA-Z0-9_]`   | Karakter kata (huruf, angka, dan _underscore_).           |
| **`\W`**      | `[^a-zA-Z0-9_]`  | Bukan karakter kata (simbol, spasi, titik koma, dll.).    |
| **`\s`**      | `[ \t\r\n\f\v]`  | Karakter spasi putih (_whitespace_: spasi, tab, newline). |
| **`\S`**      | `[^ \t\r\n\f\v]` | Bukan spasi putih.                                        |

## 4. Quantifiers (Penentu Frekuensi Pengulangan)
Quantifier menentukan berapa kali elemen tepat di sebelah kirinya harus diulang.

- **Notasi Quantifier:**
    - `*` : 0 atau lebih kali (`{0,}`).
        
    - `+` : 1 atau lebih kali (`{1,}`).
        
    - `?` : 0 atau 1 kali (`{0,1}`).
        
    - `{n}` : Tepat $n$ kali.
        
    - `{n,}` : Minimal $n$ kali.
        
    - `{n,m}` : Minimal $n$ kali, maksimal $m$ kali.
        
- **Mode Eksekusi Quantifier:**
    - **Greedy (Bawaan):** Mengambil karakter sebanyak mungkin dulu, lalu mundur jika gagal (misal: `.*`).
        
    - **Lazy / Non-Greedy (Diakhiri `?`):** Mengambil karakter sesedikit mungkin dulu, baru menambah jika dibutuhkan (misal: `.*?`).
        
    - **Possessive (Diakhiri `+`, pada Engine Lanjut):** Mengambil sebanyak mungkin dan **tidak pernah** melakukan _backtracking_ (misal: `.*+`).
        

## 5. Grouping, Alternation, & Capturing
Mekanisme untuk mengelompokkan sub-pola dan menyimpan hasil pencocokan.

- **Alternation (`|`):** Berfungsi sebagai logika OR (misal: `cat|dog`).
    
- **Capturing Group `(...)`:** Mengelompokkan pola sekaligus menyimpan nilainya ke dalam memori (_backreference_).
    - _Backreference (`\1`, `\2`):_ Merujuk kembali pada nilai grup yang tertangkap sebelumnya dalam pola yang sama (misal: `([a-z])\1` untuk mencari huruf ganda seperti `"ee"` atau `"tt"`).
        
- **Non-Capturing Group `(?:...)`:** Mengelompokkan pola untuk diberi quantifier/alternasi **tanpa** membuang memori untuk menyimpan nilainya.
    
- **Named Capturing Group `(?<name>...)`:** Memberi nama spesifik pada grup variabel hasil tangkapan.
    

## 6. Lookaround Assertions (Advanced Zero-Width Logic)
Pemeriksaan kondisi tanpa mengonsumsi karakter teks yang diperiksa.

- **Lookahead (Memeriksa ke depan):**
    - `(?=pattern)` : _Positive Lookahead_ (Memastikan teks di depan cocok dengan pola).
        
    - `(?!pattern)` : _Negative Lookahead_ (Memastikan teks di depan **tidak** cocok dengan pola).
        
- **Lookbehind (Memeriksa ke belakang):**
    - `(?<=pattern)` : _Positive Lookbehind_ (Memastikan teks di belakang cocok dengan pola).
        
    - `(?<!pattern)` : _Negative Lookbehind_ (Memastikan teks di belakang **tidak** cocok dengan pola).
        
## 7. Execution Contexts (POSIX vs PCRE & Flags)
Memahami variansi implementasi sintaks di berbagai sistem/bahasa.

- **Standard Flavor Regex:**
    - **BRE (Basic Regular Expressions):** Didefault oleh `grep`/`sed`. Meta-karakter seperti `(`, `)`, `{`, `}` harus di-escape (`\(`) agar berfungsi sebagai grup/quantifier.
        
    - **ERE (Extended Regular Expressions):** Digunakan pada `grep -E` / `awk`. Tidak perlu escape untuk meta-karakter grup/quantifier.
        
    - **PCRE (Perl Compatible Regular Expressions):** Standar modern (Python, JavaScript, PHP, `grep -P`). Mendukung Lookaround, Named Group, dan Possessive Quantifiers.
        
- **Flags / Modifiers Global:**
    - `g` (_Global_): Mencari seluruh kecocokan, bukan hanya kecocokan pertama.
        
    - `i` (_Ignore Case_): Tidak membedakan huruf besar/kecil.
        
    - `m` (_Multiline_): Mengubah `^` dan `$` bekerja di setiap awal/akhir baris teks.
        
    - `s` (_Dotall / Singleline_): Mengubah karakter `.` agar ikut mencocokkan karakter _newline_ (`\n`).