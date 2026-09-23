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

**5. Security Filer Chain**

**5.1 Aturan Otorisasi Request (`authorizeHttpRequest`)**
Ini adalah bagian paling dasar untuk menentukan URL mana saja yang boleh diakses publik dan mana yang memerlukan otentikasi atau role tertentu.

- **`permitAll()`**: Membuka akses untuk semua orang (publik).
- **`authenticated()`**: Mewajibkan pengguna untuk login terlebih dahulu.
- **`hasRole('ADMIN')`**: Membatasi akses khusus untuk pengguna dengan role tertentu.

**5.2 Mekanisme Otentikasi (Form Login / HTTP Basic / OAuth2)
Menentukan bagaimana pengguna membuktikan identitas mereka:

- **`formLogin()`**: Untuk aplikasi berbasis HTML/UI yang membutuhkan halaman login kustom atau bawaan.
- **`httpBasic()`**: Otentikasi dasar menggunakan header HTTP (sering digunakan untuk testing/API sederhana).
- **`oauth2Login()`**: Mengaktifkan alur login menggunakan pihak ketiga (Google, GitHub, OIDC).

**5.3 Konfigurasi CORS (Cross-Origin Resource Sharing)**
Penting jika frontend (misal: React, Vue, Angular) dan backend Spring berjalan di domain atau port yang berbeda. CORS mengatur domain luar mana saja yang diizinkan melakukan HTTP Request ke backend Anda.

**5.4 Perlindungan CSRF (Cross-Site Request Forgery)**
Proteksi untuk mencegah eksekusi perintah tak terduga dari situs pihak ketiga.

- **Aktif (Default):** Sangat disarankan untuk aplikasi berbasis Web/Browser dengan form HTML.
- **Dinonaktifkan (`csrf.disable()`):** Biasanya dinonaktifkan jika aplikasi Anda adalah **REST API stateless** yang menggunakan token (seperti JWT) alih-alih Session Cookie.

**5.5 Security Header (`headers`)**
Mengatur header HTTP bawaan untuk perlindungan ekstra di tingkat browser, seperti:

- **X-Frame-Options:** Mencegah serangan _Clickjacking_ (mencegah aplikasi Anda di-embed dalam `<iframe>`).
- **Content Security Policy (CSP):** Mencegah serangan XSS.
- **Strict-Transport-Security (HSTS):** Memaksa koneksi menggunakan HTTPS.j

Contoh: 

```java
package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            // 1. Matikan CSRF
            .csrf(AbstractHttpConfigurer::disable)

            // 2. Atur Otorisasi Endpoint (Aturan Akses URL)
            .authorizeHttpRequests(auth -> auth
                // Endpoint publik (bisa diakses tanpa login)
                .requestMatchers("/", "/public/**", "/error", "/webjars/**").permitAll()
                // Endpoint khusus role ADMIN
                .requestMatchers("/admin/**").hasRole("ADMIN")
                // Sisa endpoint lainnya wajib login
                .anyRequest().authenticated()
            )

            // 3. Mekanisme Otentikasi Menggunakan OAuth2 / OIDC Login
            .oauth2Login(oauth2 -> oauth2
                // (Opsional) Mengarahkan ke halaman login kustom jika ada
                // .loginPage("/login")
                
                // URL tujuan setelah berhasil login
                .defaultSuccessUrl("/dashboard", true)
                .userInfoEndpoint(userInfo -> userInfo  .oidcUserService(customOidcUserService) )
                // URL tujuan jika login gagal
                .failureUrl("/login?error=true")
            )

            // 4. Konfigurasi Logout
            .logout(logout -> logout
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .clearAuthentication(true)
                .deleteCookies("JSESSIONID")
            );

        return http.build();
    }
}
```


Contoh Custom OIDC user service: 

```java
package com.example.demo.service;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Service;

@Service
public class CustomOidcUserService extends OidcUserService {

    private final UserRepository userRepository;

    public CustomOidcUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public OidcUser loadUser(OidcUserRequest userRequest) throws OAuth2AuthenticationException {
        // 1. Biarkan Spring Security mengekstrak OidcUser dasar dari ID Token
        OidcUser oidcUser = super.loadUser(userRequest);

        // 2. Ambil data dari ID Token (Claims)
        String googleSub = oidcUser.getSubject(); // 'sub' (ID Unik Google)
        String email = oidcUser.getEmail();
        String name = oidcUser.getFullName();
        String picture = oidcUser.getPicture();

        // 3. Simpan atau Update ke Database Lokal
        processUserLogin(googleSub, email, name, picture);

        return oidcUser;
    }

    private void processUserLogin(String googleSub, String email, String name, String picture) {
        userRepository.findByGoogleSub(googleSub)
            .map(existingUser -> {
                // Update data jika ada perubahan di profil Google
                existingUser.setName(name);
                existingUser.setPicture(picture);
                return userRepository.save(existingUser);
            })
            .orElseGet(() -> {
                // Jika belum ada, daftarkan user baru
                User newUser = User.builder()
                        .googleSub(googleSub)
                        .email(email)
                        .name(name)
                        .picture(picture)
                        .role("ROLE_USER")
                        .build();
                return userRepository.save(newUser);
            });
    }
}
```