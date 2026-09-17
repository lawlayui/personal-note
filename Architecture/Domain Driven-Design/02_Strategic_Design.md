**Strategic Design dalam DDD**

Strategic Design adalah pendekatan untuk memecah model domain besar menjadi bagian yang lebih kecil dan mengatur hubungan antar bagian tersebut.

**1. Bounded Context**

Bounded Context adalah batas eksplisit tempat sebuah model domain berlaku. Di dalam batas ini, istilah, aturan, dan model harus konsisten. Di luar batas, model bisa berbeda meskipun namanya sama.

Contoh:
Di e-commerce, ada context Katalog dan context Pengiriman.
- Di Katalog, "Product" berarti barang dengan nama, harga, dan deskripsi.
- Di Pengiriman, "Product" berarti barang fisik dengan berat dan dimensi.
Keduanya boleh memakai istilah "Product", tetapi maknanya berbeda karena berada di Bounded Context berbeda.

**2. Ubiquitous Language**

Ubiquitous Language adalah bahasa bersama yang dipakai oleh tim bisnis dan tim teknis di dalam satu Bounded Context. Istilah yang sama harus muncul di percakapan, dokumen, model, dan kode.

Contoh:
Di Bounded Context Order, tim menggunakan istilah:
- Order
- OrderItem
- PlaceOrder
- OrderPlaced

Jangan memakai "pesanan" di dokumen bisnis, "order" di kode, dan "transaksi" di percakapan. Pilih satu istilah dan pakai konsisten.

**3. Context Mapping**

Context Mapping adalah peta yang menunjukkan hubungan antar Bounded Context. Peta ini menjelaskan siapa bergantung pada siapa dan bagaimana mereka berintegrasi.

Contoh:
- Order Context mengirim command ke Payment Context untuk meminta pembayaran.
- Payment Context mengembalikan event PaymentApproved ke Order Context.
- Inventory Context memberi informasi stok ke Order Context.

Hubungan ini digambarkan sebagai peta, misalnya Order Context -> Payment Context.

**Menemukan Domain Context dari Event Storming**

Event Storming menghasilkan event, command, actor, dan policy. Untuk menemukan kandidat Bounded Context, kelompokkan event yang saling terkait erat. Gunakan dua parameter berikut.

**1. Jika sebuah event dihapus, apakah alurnya akan terpengaruh? (Single Responsibility)**

Tanyakan: jika event ini dihapus, apakah alur bisnis utama rusak?
- Jika alur rusak, event itu bagian dari context yang sama.
- Jika alur tetap berjalan, event itu kemungkinan milik context lain.

Contoh:
- Event OrderPlaced. Jika dihapus, proses checkout dan pengiriman tidak bisa lanjut. Maka OrderPlaced ada di Order Context.
- Event EmailSent. Jika dihapus, pesanan tetap bisa diproses. Maka EmailSent bisa berada di Notification Context, bukan Order Context.

**2. Indikator waktu pemanggilan event / pemicu**

Lihat kapan event dipicu dan oleh siapa.
- Event yang dipicu langsung oleh actor atau command dalam satu alur bisnis yang sama cenderung berada di context yang sama.
- Event yang dipicu oleh sistem eksternal atau setelah jeda waktu bisa berada di context berbeda.

Contoh:
- Customer -> PlaceOrder -> OrderPlaced. Dipicu langsung oleh aksi customer. Masuk Order Context.
- PaymentGateway -> PaymentApproved. Dipicu oleh sistem eksternal. Masuk Payment Context.
- Setelah 1 jam -> OrderReminderSent. Dipicu oleh waktu. Bisa masuk Notification Context.

Cara pakai:
Di Event Storming, tandai setiap event. Untuk setiap event, tanyakan dua parameter di atas. Kelompokkan event yang saling bergantung dan dipicu dalam alur yang sama. Batas kelompok itulah kandidat Bounded Context.