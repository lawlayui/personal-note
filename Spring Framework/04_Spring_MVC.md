**1. Konsep Pola Arsitektur MVC (Model-View-Controller)**
Pola Arsitektur MVC (Model-View-Controller) adalah pola desain perangkat lunak yang memisahkan kode aplikasi menjadi tiga bagian utama sesuai tanggung jawabnya:

- Model
Tugas: Mengelola data, aturan bisnis (business logic), dan akses ke database.

Peran: Menyimpan status aplikasi dan tidak peduli bagaimana data tersebut ditampilkan ke pengguna.

- View
Tugas: Mengatur tampilan antarmuka (user interface).

Peran: Menampilkan data dari Model kepada pengguna (misal: halaman HTML, format JSON, atau XML).

- Controller
Tugas: Menjadi perantara/jembatan antara Model dan View.

Peran: Menerima request dari pengguna, memanggil Model untuk memproses data, lalu memilih View mana yang harus ditampilkan kembali ke pengguna.

Alur Kerja Ringkas:
Pengguna (Request) ➔ Controller ➔ Minta Data ke Model ➔ Data Dikembalikan ke Controller ➔ Kirim Data ke View ➔ Tampilan/Response ke Pengguna

**2. Arsitektur & Alur Kerja DispatcherServlet**
DispatcherServlet adalah komponen inti (Front Controller) dalam Spring MVC yang bertindak sebagai pintu masuk utama untuk semua HTTP request yang masuk ke aplikasi. tugas utamanya adalah menerima request dan mengoordinasikan komponen-komponen lain untuk memprosesnya.

1. Menerima Request: Client mengirim HTTP request ke aplikasi, dan DispatcherServlet menangkap request tersebut.

2. Mencari Handler (Routing): DispatcherServlet bertanya ke HandlerMapping untuk menemukan Controller mana yang cocok dengan URL yang dipanggil.

3. Mengeksekusi Controller: Melalui HandlerAdapter, DispatcherServlet memanggil method pada Controller yang sesuai.

4. Memproses Logika: Controller menjalankan logika bisnis dan mengembalikan hasil berupa data (Model) beserta nama tampilan (View) atau data langsung (JSON/XML).

5. Resolusi Tampilan (ViewResolver): Jika mengembalikan nama View, DispatcherServlet meminta ViewResolver untuk mencari file tampilan yang cocok (misal: halaman HTML/JSP).

6. Mengirim Response: DispatcherServlet merender tampilan atau mengembalikan data JSON/XML secara langsung sebagai HTTP response ke client.

**3. Pembuatan Controller & Routing (URL Mapping)**
Controller dalam Spring MVC adalah kelas yang bertugas menangani HTTP request dari pengguna dan mengembalikan response. Routing (URL Mapping) adalah proses menghubungkan endpoint URL tertentu dengan method yang ada di dalam Controller.

Anotasi Utama:
@Controller / @RestController: Menandai kelas sebagai Controller (@RestController khusus untuk REST API yang mengembalikan data JSON/XML).

@RequestMapping: Anotasi dasar untuk memetakan URL ke kelas atau method.

Anotasi HTTP Method: Shortcut spesifik seperti @GetMapping, @PostMapping, @PutMapping, dan @DeleteMapping.

```java
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/products") // Base URL untuk semua endpoint di kelas ini
public class ProductController {

    // 1. GET: http://localhost:8080/api/products/1
    @GetMapping("/{id}")
    public String getProductById(@PathVariable("id") Long id) {
        return "Mengambil data produk dengan ID: " + id;
    }

    // 2. POST: http://localhost:8080/api/products
    @PostMapping
    public String createProduct(@RequestBody String productName) {
        return "Produk berhasil dibuat: " + productName;
    }
}

```

**4. Penanganan Fitur Web Tambahan**
**4.1 Form Binding**
Form Binding dalam Spring MVC adalah mekanisme otomatis untuk mengubah data masukan dari HTTP Request (seperti data dari form HTML, URL query parameters, atau payload JSON) menjadi objek Java secara langsung.

- @RequestParam: Mengambil data dari query parameter URL (contoh: ?name=Budi) atau data form-data sederhana.

- @PathVariable: Mengambil nilai variabel yang disisipkan langsung di dalam path URL (contoh: /users/{id}).

- @ModelAttribute: Memetakan seluruh isi form-data HTML atau query parameters ke properti-properti objek Java.

- @RequestBody: Memetakan payload JSON/XML dari request body menjadi objek Java.

