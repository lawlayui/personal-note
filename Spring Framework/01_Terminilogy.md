**Terminologi** adalah seperangkat istilah atau kosakata khusus yang digunakan dalam suatu bidang, beserta definisi dan konteks pemakaiannya. Tujuannya agar komunikasi teknis konsisten dan tidak ambigu. Dalam Spring Boot, istilah seperti **bean**, **application context**, **dependency injection**, dan **auto configuration** memiliki makna teknis yang spesifik, bukan makna sehari-hari.

**1. Bean**
**Bean** adalah objek Java yang dibuat, dirakit, dan dikelola oleh **Spring IoC Container**. Jadi, bean bukan sekadar objek hasil `new`, melainkan objek yang siklus hidupnya—instansiasi, injeksi dependensi, inisialisasi, sampai penghancuran—diatur oleh Spring.

Bean biasanya didefinisikan dengan:
- Anotasi stereotype: `@Component`, `@Service`, `@Repository`, `@Controller`
- Metode `@Bean` di dalam kelas `@Configuration`
- Konfigurasi XML (cara lama)

Secara default, bean bersifat **singleton**, artinya satu instance untuk satu application context, meskipun bisa diubah menjadi prototype, request, session, dan lain-lain.

**2. Application Context**
**Application Context** adalah implementasi utama dari **IoC Container** di Spring. Ini adalah wadah tempat semua bean disimpan dan dikelola. Application Context bertanggung jawab untuk:
- Membuat dan mengelola bean
- Melakukan dependency injection
- Menerbitkan event
- Menyediakan akses ke resource
- Mendukung AOP, internasionalisasi, dan lifecycle bean

Di Spring Boot, application context biasanya dibuat secara otomatis oleh `SpringApplication.run()`. Jenisnya bisa berbeda tergantung aplikasi, misalnya `ServletWebServerApplicationContext` untuk aplikasi web berbasis servlet.

Sederhananya: **Application Context adalah “wadah” atau “manajer” tempat semua bean hidup dan saling terhubung.**

**3. Dependency Injection (DI)**
**Dependency Injection** adalah teknik di mana dependensi suatu objek diberikan dari luar, bukan dibuat sendiri oleh objek tersebut. DI adalah salah satu bentuk dari **Inversion of Control (IoC)**: kontrol pembuatan dan penyediaan dependensi diserahkan ke container.

Contoh: 
```java
@Service
public class OrderService {
    private final PaymentService paymentService;

    public OrderService(PaymentService paymentService) {
        this.paymentService = paymentService;
    }
}
```

**4. Auto Configuration**
**Auto Configuration** adalah fitur khas Spring Boot. Fitur ini membuat Spring Boot dapat mengonfigurasi bean secara otomatis berdasarkan:
- Dependency yang ada di classpath
- Properti aplikasi
- Kondisi tertentu
- Jenis aplikasi (web, non-web, reactive, dsb.)

Auto configuration diaktifkan oleh `@EnableAutoConfiguration`, yang secara default sudah termasuk dalam `@SpringBootApplication`.

Contoh:
- Jika ada `spring-boot-starter-web`, Spring Boot otomatis menyiapkan Tomcat, `DispatcherServlet`, dan Jackson.
- Jika ada `spring-boot-starter-data-jpa` dan driver database, Spring Boot otomatis menyiapkan `DataSource`, `EntityManager`, dan `TransactionManager`.

Auto configuration menggunakan anotasi kondisi seperti:
- `@ConditionalOnClass`
- `@ConditionalOnMissingBean`
- `@ConditionalOnProperty`
- `@ConditionalOnWebApplication`

Tujuannya mengurangi konfigurasi manual, tetapi tetap bisa ditimpa jika kita mendefinisikan bean sendiri.

