**1. Java-based Configuration**
Java-based Configuration adalah cara mengonfigurasi Spring Framework menggunakan kelas Java murni (tanpa file XML). Pendekatan ini memanfaatkan anotasi @Configuration untuk menandai kelas sebagai sumber konfigurasi dan @Bean pada method untuk mendefinisikan objek (bean) yang dikelola oleh Spring Container.

```java
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

    @Bean
    public ServiceMessage serviceMessage() {
        return new ServiceMessageImpl();
    }
}
```

- @Configuration: Memberitahu Spring bahwa kelas AppConfig berisi definisi bean.

- @Bean: Memberitahu Spring bahwa method serviceMessage() mengembalikan sebuah objek yang harus didaftarkan dan dikelola ke dalam IoC Container.

**2. Annotation-based Configuration**
Annotation-based Configuration adalah cara mengonfigurasi Spring dengan menempatkan anotasi langsung di atas kelas, field, atau method. Pendekatan ini mengandalkan fitur Component Scanning untuk mendeteksi dan mendaftarkan bean secara otomatis tanpa perlu mendefinisikannya satu per satu.

```java
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

// 1. Mendaftarkan kelas sebagai Bean secara otomatis
@Service
public class OrderService {

    // 2. Menginjeksi dependency (PaymentService) secara otomatis
    @Autowired
    private PaymentService paymentService;

    public void processOrder() {
        paymentService.pay();
    }
}
```

- @Service (salah satu turunan @Component): Memberitahu Spring bahwa kelas OrderService adalah sebuah bean yang harus dikelola otomatis oleh Spring Container.

- @Autowired: Memberitahu Spring untuk mencari dan memasukkan (inject) bean PaymentService ke dalam kelas ini secara otomatis.

**3. XML-based Configuration**
XML-based Configuration adalah cara tradisional mengonfigurasi Spring dengan mencatat seluruh definisi bean dan dependensinya di dalam sebuah berkas XML (biasanya bernama applicationContext.xml).

Spring Container akan membaca berkas XML ini saat aplikasi dinyalakan untuk membuat, mengonfigurasi, dan menghubungkan objek-objek (beans) yang ada di dalamnya

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           http://www.springframework.org/schema/beans/spring-beans.xsd">

    <!-- 1. Mendefinisikan Bean PaymentRepository -->
    <bean id="paymentRepository" class="com.example.PaymentRepository" />

    <!-- 2. Mendefinisikan Bean OrderService dan Menginjeksi PaymentRepository -->
    <bean id="orderService" class="com.example.OrderService">
        <property name="paymentRepository" ref="paymentRepository" />
    </bean>

</beans>

```

<bean>: Digunakan untuk mendefinisikan sebuah bean yang dikelola oleh Spring.
id: Identitas unik untuk bean.
class: Lokasi package lengkap dari kelas Java tersebut.

<property>: Digunakan untuk menginjeksi dependensi (Dependency Injection) melalui setter method.
name: Nama properti/field di kelas target (paymentRepository).
ref: Mengacu pada id dari bean lain yang ingin diinjeksi.