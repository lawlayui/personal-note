**Tactical Design DDD**

**1. Aggregate Root**

Aggregate Root adalah objek utama dalam sebuah aggregate. Ia punya identitas unik, menjaga konsistensi seluruh objek di dalam aggregate, dan menjadi satu-satunya pintu masuk untuk mengubah isi aggregate.

Contoh: Order adalah Aggregate Root. Di dalamnya ada OrderItem.

Analisis:
- Punya ID atau tidak? Punya ID, misalnya OrderId. Karena punya ID, berarti Entity atau Aggregate Root.
- Siklus hidup dan kemandirian: Bisa hidup mandiri. Order bisa dibuat, diubah, dan dicari secara terpisah tanpa tergantung objek lain. Karena mandiri, Order adalah Aggregate Root dan punya Repository sendiri, yaitu OrderRepository.
- Stateful atau stateless: Stateful. Order menampung data/state seperti status order dan daftar OrderItem.

**2. Entity**

Entity adalah objek domain yang punya identitas unik dan siklus hidup. Identitasnya tetap sama meskipun atributnya berubah.

Contoh: OrderItem adalah Entity anak di dalam aggregate Order. Customer juga bisa menjadi Entity.

Analisis:
- Punya ID atau tidak? Punya ID, misalnya OrderItemId. Karena punya ID, berarti Entity atau Aggregate Root.
- Siklus hidup dan kemandirian: Tidak bisa hidup mandiri. OrderItem hanya ada karena ada Order. Ia ikut lahir dan terhapus bersama Order. Karena tidak mandiri, OrderItem adalah Entity Anak dan tidak punya Repository sendiri.
- Stateful atau stateless: Stateful. OrderItem menampung data/state seperti quantity dan harga.

**3. Value Object**

Value Object adalah objek domain yang tidak punya identitas. Ia didefinisikan oleh nilai-nilainya dan biasanya immutable.

Contoh: Alamat, Uang, NomorTelepon.

Analisis:
- Punya ID atau tidak? Tidak punya ID. Karena tidak punya ID, berarti Value Object.
- Value Object tidak perlu hidup mandiri dan tidak punya Repository sendiri.

**4. Domain Service**

Domain Service adalah kelas yang berisi aturan atau tindakan bisnis yang melibatkan lebih dari satu Aggregate. Ia tidak menyimpan state.

Contoh: TransferService. Layanan ini mengatur transfer uang dari satu Account ke Account lain.

Analisis:
- Punya ID atau tidak? Tidak punya ID. Domain Service bukan Entity atau Aggregate Root.
- Siklus hidup dan kemandirian: Tidak relevan sebagai objek domain yang hidup mandiri. Ia hanya berisi operasi bisnis.
- Stateful atau stateless: Stateless. Domain Service tidak menyimpan data. Ia murni berisi aturan/tindakan bisnis lintas Aggregate.

**5. Repository**

Repository adalah mekanisme untuk menyimpan dan mengambil Aggregate Root. Repository menyembunyikan detail persistensi.

Contoh: OrderRepository dengan method findById(OrderId) dan save(Order).

Catatan:
- Repository hanya dibuat untuk Aggregate Root.
- Entity anak dan Value Object tidak punya Repository sendiri.
- Entity anak diakses melalui Aggregate Root-nya.