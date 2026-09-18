**CQRS (Command Query Responsibility Segregation)** adalah sebuah pola (_pattern_) arsitektur perangkat lunak yang memisahkan antara alur pemrosesan data untuk **mengubah data** (_Command_) dan alur untuk **membaca data** (_Query_).

Pola ini diperkenalkan oleh Greg Young dan berakar dari prinsip _Command Query Separation_ (CQS) yang dibuat oleh Bertrand Meyer.

**Komponen Utama CQRS**

- **Command (Perubahan Data):** Operasi yang melakukan instruksi untuk mengubah status sistem (seperti _Create_, _Update_, _Delete_). _Command_ fokus pada penerapan aturan bisnis dan tidak boleh mengembalikan data domain, hanya mengembalikan status berhasil atau gagal.

- **Query (Pembacaan Data):** Operasi yang hanya mengambil atau membaca data (_Read_). _Query_ tidak boleh mengubah status data atau sistem sama sekali (bebas efek samping/side-effect free).