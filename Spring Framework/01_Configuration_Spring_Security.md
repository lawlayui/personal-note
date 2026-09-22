**1. Dependency Maven**
```xml 
<dependency>
    <groupId>springframework.boot</groupId>
    <artifactId>spring-boot-starter-oauth2-client</artifactId>
</dependency>
```

**2. Registrasi Aplikasi di OAuth2 Provider**
Mendaftarkan aplikasi dulu pada konsol pengembang penyedia identitas (misal: Google Cloud Console atau Github Develover Settings). Untuk mendapatkan: 

- **Client ID**: Identifikasi unik untuk aplikasi. 
- **Client Secret**: Kunci rahasia untuk otentikasi aplikasi ke penyedia OAuth2. 
- **Redirect URL / Callback URL**: URL di aplikasi yang akan dipanggil oleh penyedia setelah pengguna mengizinkan akses. Secara bawaan spring security adalah: `{baseUrl}/login/oauth2/code/{registrationId}` _(Contoh: `http://localhost:8080/login/oauth2/code/google`)_

**3. Konfigurasi application.yml / application.properties**

- Spring sudah menyediakan untuk provider google
```yaml
spring:
  security:
    oauth2:
      client:
        registration:
          google:
            client-id: YOUR_GOOGLE_CLIENT_ID
            client-secret: YOUR_GOOGLE_CLIENT_SECRET
            scope:
              - openid
              - profile
              - email  # <--- Scope ini wajib untuk meminta akses email
```

- Untuk provider custom 
```yaml
spring:
  security:
    oauth2:
      client:
        registration:
          my-provider:
            client-id: YOUR_CLIENT_ID
            client-secret: YOUR_CLIENT_SECRET
            authorization-grant-type: authorization_code
            redirect-uri: "{baseUrl}/login/oauth2/code/{registrationId}"
            scope:
              - email
              - profile
        provider:
          my-provider:
            authorization-uri: https://provider.com/oauth/authorize
            token-uri: https://provider.com/oauth/token
            user-info-uri: https://provider.com/oauth/userinfo  # <--- Endpoint untuk mengambil data profil/email
            user-name-attribute: email
```

**1. `authorization-uri`**

- **Fungsi:** URL lokasi pengguna akan diarahkan (_redirect_) untuk melakukan login dan memberikan izin akses (_consent_).
- **Alur kerja:** Ketika pengguna mengeklik tombol _Login_, aplikasi Spring Security akan membuka URL ini di browser pengguna dengan membawa parameter seperti `client_id`, `redirect_uri`, `response_type=code`, dan `scope`.

**2. `token-uri`**

- **Fungsi:** Endpoint server OAuth2 yang digunakan oleh aplikasi Spring Security (sisi _backend_) untuk menukarkan **Authorization Code** menjadi **Access Token** (dan _Refresh Token_ jika ada).
- **Alur kerja:** Setelah pengguna berhasil login di `authorization-uri`, penyedia OAuth2 mengirimkan _code_ singkat ke aplikasi Anda. Spring Security kemudian secara otomatis mengirimkan permintaan HTTP POST dari belakang layar ke `token-uri` ini bersama dengan `client-secret` untuk mendapatkan token resmi.

 **3. `user-info-uri`**

- **Fungsi:** Endpoint API milik penyedia OAuth2 yang dipanggil oleh aplikasi untuk mengambil data profil pengguna (seperti email, nama, foto profil).
- **Alur kerja:** Setelah aplikasi Anda mendapatkan _Access Token_ dari `token-uri`, Spring Security mengirimkan permintaan ke `user-info-uri` dengan menyertakan _Access Token_ tersebut di HTTP Header (`Authorization: Bearer <access_token>`). Server penyedia kemudian mengembalikan data pengguna dalam format JSON.

**4. `user-name-attribute`**

- **Fungsi:** Menentukan nama kunci (_key/field_) dari JSON yang dikembalikan oleh `user-info-uri` yang akan digunakan sebagai **ID/Pengenal Utama (Username)** pengguna di dalam Spring Security.
    
- **Penggunaan:**
    
    - Jika diisi `email`, Spring Security akan memperlakukan atribut `email` pada JSON respon sebagai identifier unik dari objek `OAuth2User` (`principal.getName()`).
    - Pada penyedia lain, nilainya bisa berbeda (misalnya `sub` pada protokol OpenID Connect, atau `id` pada GitHub API).

**4. Mengakses Data Email**
Setelah pengguna berhasil login via Oauth2, data email akan di simpan pada objek OAuth2User atau OdicUser. 

```java
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    @GetMapping("/user-info")
    public String getUserEmail(@AuthenticationPrincipal OAuth2User principal) {
        // Mengambil atribut 'email' dari payload userinfo / ID Token
        String email = principal.getAttribute("email");
        return "Email pengguna: " + email;
    }
}
```