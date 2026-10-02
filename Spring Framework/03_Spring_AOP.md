Spring AOP adalah teknik dalam Spring untuk menambahkan fungsi/perilaku tambahan (seperti logging, keamanan, atau manajemen transaksi) ke dalam kode yang sudah ada tanpa harus mengubah kode aslinya.

Dalam pemrograma biasa, logika pendukung seperti logging sering kali ditulis berulang-ulang di banyak fungsi (disebut Cross-Cutting Concerns). AOP memisahkan logika pendukung tersebut ke dalam modul terpisah bernama Aspect.

```java
@Aspect
@Component
public class LoggingAspect {

    // Menjalankan method ini SEBELUM method processPayment() di eksekusi
    @Before("execution(* com.example.PaymentService.processPayment(..))")
    public void logBefore() {
        System.out.println("[LOG] Mengirim transaksi pembayaran ke sistem...");
    }
}
```

Aspect (@Aspect): Kelas tempat Anda menuliskan perilaku tambahan.

Advice (@Before, @After, @Around): Menentukan kapan perilaku tambahan itu dijalankan (sebelum, sesudah, atau di sekitar eksekusi fungsi).

Pointcut (execution(...)): Menentukan di mana atau pada method apa perilaku tambahan tersebut akan diterapkan.