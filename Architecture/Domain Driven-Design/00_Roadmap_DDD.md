ROADMAP BELAJAR DOMAIN-DRIVEN DESIGN (DDD)

Daftar Isi
1. Pendahuluan
2. Prasyarat
3. Fase 1 — Fondasi Berpikir
4. Fase 2 — Strategic Design
5. Fase 3 — Tactical Design
6. Fase 4 — Integrasi & Pola Lanjutan
7. Fase 5 — Implementasi di Java
8. Sumber Referensi


**1. PENDAHULUAN**
Domain-Driven Design (DDD) adalah pendekatan pengembangan perangkat lunak yang diperkenalkan oleh Eric Evans melalui buku "Domain-Driven Design: Tackling Complexity in the Heart of Software" (2003). DDD menempatkan domain bisnis sebagai pusat pengembangan perangkat lunak.

DDD terdiri dari dua lapisan besar:
- Strategic Design: fokus pada pembagian masalah, batas model, dan bahasa. Bersifat konseptual.
- Tactical Design: fokus pada implementasi model di dalam batas. Bersifat teknis.

Roadmap ini disusun berurutan dari fondasi berpikir hingga implementasi.

**2. PRASYARAT**
Sebelum memulai DDD, pastikan sudah memahami:

- Pemrograman berorientasi objek (OOP).
- Konsep dasar arsitektur perangkat lunak (layered, hexagonal, clean).
- Dasar bahasa Java (atau bahasa lain yang digunakan).
- Dasar pemodelan data dan basis data.

**3. FASE 1 — FONDASI BERPIKIR**
**3.1 Problem Space vs Solution Space
- Problem space: masalah bisnis yang ingin diselesaikan.
- Solution space: solusi teknis yang dibangun.
- DDD dimulai dari problem space, bukan solution space.

**3.2 Kompleksitas Bisnis vs Kompleksitas Teknis
- Kompleksitas bisnis: aturan, pengecualian, kondisi yang rumit.
- Kompleksitas teknis: infrastruktur, framework, performa.
- DDD berfokus pada kompleksitas bisnis.

**3.3 Model
- Model adalah penyederhanaan realitas sesuai tujuan.
- Model bukan salinan realitas.
- Model bukan class. Class hanyalah wujud implementasi.

**3.4 Model Bisnis
- Representasi cara organisasi menciptakan, memberikan, dan menangkap nilai.
- Komponen: pelanggan, nilai, proses, sumber daya, pendapatan, aturan.


**4. FASE 2 — STRATEGIC DESIGN**
**4.1 Domain
- Area bisnis yang menjadi fokus perangkat lunak.
- Contoh: layanan kesehatan, perdagangan, logistik, perbankan.

**4.2 Subdomain
- Pecahan dari domain yang menangani aspek tertentu.
- Klasifikasi subdomain:
  - Core Domain: nilai jual utama, investasi terbesar.
  - Supporting Subdomain: mendukung core, dibuat sendiri.
  - Generic Subdomain: umum, dapat dibeli atau dipakai ulang.

**4.3 Ubiquitous Language
- Bahasa yang disepakati antara developer dan domain expert.
- Digunakan konsisten di percakapan, dokumen, dan kode.
- Berlaku di dalam satu bounded context, bukan di seluruh sistem.

**4.4 Bounded Context
- Batas di mana sebuah model domain berlaku.
- Di dalam batas: satu istilah, satu makna, satu model.
- Di luar batas: istilah yang sama boleh berbeda makna.
- Bukan microservice, bukan tim, bukan modul. Bounded context adalah batas model dan bahasa.

**4.5 Hubungan Subdomain dengan Bounded Context
- Subdomain: problem space, kategori masalah.
- Bounded Context: solution space, batas model.
- Tidak selalu 1:1. Tergantung kompleksitas.

**4.6 Context Mapping
Pola hubungan antar bounded context:

- Partnership: dua context sukses/gagal bersama.
- Shared Kernel: berbagi sebagian model.
- Customer-Supplier: satu context melayani context lain.
- Conformist: mengikuti model context lain.
- Anti-Corruption Layer: menerjemahkan model context lain.
- Open Host Service: menyediakan API publik.
- Published Language: format bahasa bersama.
- Separate Ways: tidak berhubungan.

**4.7 Cara Menentukan Batas Bounded Context**
Pertanyaan yang diajukan:
1. Apakah istilah kunci punya makna berbeda?
2. Apakah ada aturan bisnis yang berbeda?
3. Apakah siklus hidup objeknya berbeda?
4. Apakah bisa diubah tanpa memengaruhi yang lain?

Jika jawabannya "ya", pisahkan. Jika "tidak", gabungkan.

**4.8 Event Storming
- Teknik kolaboratif untuk menemukan domain event, command, aggregate, dan bounded context.
- Diperkenalkan oleh Alberto Brandolini.
- Alat bantu strategic design.


**5. FASE 3 — TACTICAL DESIGN**
**5.1 Entity**
- Objek dengan identitas unik.
- Identitas tetap meski atribut berubah.
- Contoh: Pasien, Order, Customer.

**5.2 Value Object**
- Objek tanpa identitas.
- Immutable.
- Dibedakan oleh nilai.
- Contoh: Money, Address, NamaPasien.

**5.3 Aggregate
- Kumpulan Entity dan Value Object yang dijaga konsistensinya bersama.
- Memiliki satu Aggregate Root sebagai pintu masuk.
- Batas konsistensi transaksional.

**5.4 Aggregate Root
- Satu-satunya pintu masuk ke aggregate.
- Menjaga invariant.
- Aggregate lain direferensikan melalui ID, bukan objek.

5.5 Aturan Aggregate
1. Satu transaksi = satu aggregate.
2. Referensi antar aggregate menggunakan ID.
3. Aggregate dibuat sekecil mungkin.
4. Invariant yang harus konsisten bersamaan dikelompokkan dalam satu aggregate.

**5.6 Repository
- Abstraksi untuk menyimpan dan mengambil aggregate.
- Satu repository per aggregate root.
- Berupa interface, implementasi di infrastructure layer.

**5.7 Domain Service
- Logika bisnis yang tidak masuk entity atau value object.
- Bersifat stateless.
- Contoh: kalkulasi lintas aggregate, validasi yang butuh data eksternal.

**5.8 Domain Event
- Fakta bahwa sesuatu telah terjadi di domain.
- Bersifat past tense.
- Digunakan untuk komunikasi antar aggregate atau antar context.
- Contoh: OrderPlaced, PasienTerdaftar, PaymentReceived.

**5.9 Factory
- Membuat aggregate kompleks.
- Menyembunyikan detail konstruksi.
- Digunakan ketika konstruksi aggregate butuh banyak parameter atau aturan.

**5.10 Module
- Pengelompokan konsep domain yang kohesif.
- Berbeda dengan bounded context.
- Bisa berupa package atau namespace.


**6. FASE 4 — INTEGRASI & POLA LANJUTAN**
**6.1 Eventual Consistency
- Konsistensi antar aggregate tidak instan.
- Dicapai melalui domain event.
- Trade-off: konsistensi vs skalabilitas.

**6.2 CQRS (Command Query Responsibility Segregation)
- Memisahkan model untuk baca dan tulis.
- Command: mengubah state.
- Query: membaca state.
- Berguna ketika kebutuhan baca dan tulis sangat berbeda.

**6.3 Event Sourcing
- Menyimpan state sebagai rangkaian event.
- State saat ini = hasil replay semua event.
- Berguna untuk audit, time travel, dan analitik.

**6.4 Saga / Process Manager
- Mengoordinasikan transaksi lintas aggregate atau context.
- Menggunakan event dan command.
- Menangani kompensasi jika ada kegagalan.

**6.5 Anti-Corruption Layer (ACL)
- Lapisan penerjemah antara dua context.
- Mencegah model asing merusak model sendiri.
- Berguna saat berintegrasi dengan sistem legacy.


**7. FASE 5 — IMPLEMENTASI DI JAVA**
**7.1 Struktur Package**
com.perusahaan.proyek/
  pendaftaran/              (bounded context)
    domain/
      Pasien.java
      NamaPasien.java
      Pendaftaran.java
    repository/
      PasienRepository.java
    service/
      PendaftaranService.java
    event/
      PasienTerdaftar.java
  rekammedis/               (bounded context lain)
    ...
  apotek/                   (bounded context lain)
    ...

**7.2 Entity dan Value Object di Java
- Value Object: final class, constructor validasi, immutable.
- Entity: class dengan ID, method perilaku, tanpa setter bebas.

**7.3 Aggregate di Java
- Aggregate Root sebagai class utama.
- Entity internal tidak diekspos keluar.
- Repository hanya untuk aggregate root.

**7.4 Domain Event di Java
- Gunakan record untuk event.
- Publish melalui event bus atau application service.

**7.5 Integrasi dengan Framework
- Spring Boot: gunakan @Service, @Repository, @Transactional di layer application.
- Hindari anotasi framework di domain layer.
- Gunakan mapper untuk memisahkan domain dari persistence.

**7.6 Tantangan Umum di Java
- ORM memaksa setter: gunakan mapping manual atau library seperti jMolecules.
- Lazy loading merusak batas aggregate: gunakan fetch eksplisit, hindari relasi ORM lintas aggregate.
- Entity ORM tidak sama dengan Entity DDD: pisahkan persistence model dari domain model.
- Anotasi framework bocor ke domain: gunakan hexagonal architecture.


**8. SUMBER REFERENSI**
**Buku
- Domain-Driven Design: Tackling Complexity in the Heart of Software — Eric Evans — Fondasi DDD.
- Domain-Driven Design Distilled — Vaughn Vernon — Strategic Design.
- Implementing Domain-Driven Design — Vaughn Vernon — Tactical Design.
- Patterns, Principles, and Practices of Domain-Driven Design — Scott Millett & Nick Tune — Praktik.
- Learning Domain-Driven Design — Vlad Khononov — Pendekatan modern.

**Artikel
- Martin Fowler — Bounded Context.
- Martin Fowler — DDD Aggregate.
- Microsoft Docs — Designing a microservice domain model.
- Alberto Brandolini — Introducing EventStorming.

**Konferensi
- DDD Europe.
- Explore DDD.

**Repository Contoh
- dddsample-core (Java, Eric Evans).
- eShopOnContainers (.NET, Microsoft).


**CATATAN AKHIR
- Roadmap ini bersifat berurutan. Strategic Design harus dipahami sebelum Tactical Design.
- DDD tidak cocok untuk semua proyek. Domain sederhana (CRUD) tidak memerlukan DDD.
- DDD adalah pendekatan iteratif. Model akan berevolusi seiring pemahaman.
- Pemahaman konsep lebih penting daripada menghafal pola.