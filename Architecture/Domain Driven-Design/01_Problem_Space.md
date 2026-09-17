**Problem Space dalam Domain-Driven Design**

Problem Space adalah ruang masalah bisnis yang ingin diselesaikan. Fokusnya adalah memahami “apa masalahnya”, bukan “bagaimana solusinya”. Dalam DDD, Problem Space dipecah menjadi domain dan subdomain.

**1. Pengertian Domain**

Domain adalah area pengetahuan atau aktivitas bisnis yang menjadi fokus sistem.

Contoh:
- E-commerce: jual beli online.
- Perbankan: transaksi, tabungan, pinjaman.
- Logistik: pengiriman dan pelacakan barang.

**2. Subdomain dan Tingkatannya**

Subdomain adalah bagian yang lebih kecil dari domain, dipisahkan berdasarkan kemampuan bisnis.

- Core domain: inti bisnis, sumber keunggulan kompetitif, paling penting, sebaiknya dibangun sendiri.  
  Contoh e-commerce: sistem rekomendasi produk personal.

- Support domain: mendukung core domain, penting tetapi bukan pembeda utama.  
  Contoh: manajemen inventaris.

- Generic domain: kebutuhan umum, tidak spesifik untuk bisnis tersebut, bisa dibeli atau memakai solusi siap pakai.  
  Contoh: autentikasi, pembayaran, notifikasi email.

**3. Pengertian Event Storming**

Event Storming adalah teknik kolaboratif untuk mengeksplorasi Problem Space atau domain secara cepat. Biasanya dilakukan lewat workshop dengan sticky notes untuk memetakan alur bisnis, event, command, actor, policy, dan sistem.

Tujuannya:
- Menemukan batasan domain.
- Menyamakan istilah bisnis.
- Memahami alur proses.

Contoh: workshop tim bisnis dan teknis memetakan proses checkout e-commerce.

**4. Masukan Terbentuknya Event: Actor -> Command -> Event**

- Actor: pelaku yang memicu aksi, bisa manusia atau sistem.  
  Contoh: Customer, Admin, Payment Gateway.

- Command: perintah atau keinginan untuk melakukan sesuatu. Bentuknya imperatif dan bisa berhasil atau gagal.  
  Contoh: PlaceOrder, ApprovePayment.

- Event: fakta yang sudah terjadi akibat command. Bentuknya past tense dan tidak bisa dibatalkan.  
  Contoh: OrderPlaced, PaymentApproved.

Alur contoh:
- Customer -> PlaceOrder -> OrderPlaced
- Admin -> ApprovePayment -> PaymentApproved