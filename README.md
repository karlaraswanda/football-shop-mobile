# Tugas Individu - Pemrograman Mobile   
_Mata Kuliah: Platform-Based Programming (PBP)_

## Identitas
- **Nama:** Karla Ameera Raswanda
- **NPM:** 2406414542
- **Kelas:** PBP E

---

# Tugas 7: Elemen Dasar Flutter  

## 1. **Apa yang dimaksud dengan _widget tree_ dan bagaimana hubungan antara parent dan child pada Flutter?**  
Widget tree adalah struktur hierarki (seperti family tree) yang menggambarkan bagaimana setiap _widget_ (komponen tampilan) tersusun di dalam aplikasi.  
Setiap _widget_ bisa berperan sebagai **parent** (induk) yang berisi satu atau lebih **child** (anak).  
Contoh: `MaterialApp` (induk utama) → `Scaffold` (rangka halaman) → `Column` → `GridView` → `ItemCard`.  
Hubungannya: perubahan pada parent bisa memengaruhi child, dan posisi child selalu berada di dalam parent.

## 2. **Sebutkan dan jelaskan jenis-jenis widget yang kamu gunakan pada proyek ini beserta fungsinya.**  
- **MaterialApp** → "membungkus" seluruh aplikasi dan mengatur tema (warna, judul, dll).  
- **Scaffold** → kerangka dasar halaman (punya AppBar, Body, FloatingButton, dll).  
- **AppBar** → bagian atas aplikasi yang berisi judul.  
- **Column** → menata widget secara vertikal (atas ke bawah).  
- **Card** → kartu dengan efek bayangan.
- **GridView.count** → menampilkan widget dalam bentuk grid (baris-kolom).  
- **Icon** → menampilkan ikon kecil.  
- **Text** → menampilkan tulisan.  
- **InkWell** → mendeteksi klik.  
- **SnackBar** → menampilkan pesan singkat di bagian bawah layar.

## 3. **Apa fungsi dari `MaterialApp`?**  
`MaterialApp` berfungsi sebagai **root widget** (induk utama aplikasi).  
Fungsinya: mengatur tema, warna, route (navigasi antar halaman), dan teks global.
Tanpa `MaterialApp`, tampilan tidak akan mengikuti gaya desain _Material Design_ Flutter.

## 4. **Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget` serta kapan sebaiknya menggunakan masing-masing.**  
- **StatelessWidget** → Tidak punya _state_ (keadaan) yang bisa berubah.  
  Digunakan saat tampilan hanya menampilkan data statis (tidak interaktif).  
  Contoh: halaman menu utama, teks, ikon tetap.  
- **StatefulWidget** → Punya _state_ (data atau kondisi yang bisa berubah).  
  Digunakan untuk tampilan yang berubah karena interaksi user, misalnya form input, counter, atau daftar yang bisa di-update.

## 5. **Jelaskan bagaimana cara kerja `BuildContext`.**  
`BuildContext` adalah objek yang menyimpan posisi widget di dalam _widget tree_.
Fungsinya: mengakses data dari parent, seperti tema warna (`Theme.of(context)`) atau menampilkan _SnackBar_ (`ScaffoldMessenger.of(context)`).  

## 6. **Jelaskan perbedaan antara `hot reload` dan `hot restart`.**  
- **Hot reload** → Memperbarui tampilan dengan kode terbaru **tanpa menghapus state (keadaan)** aplikasi.  
  Dipakai saat: ada perubahan kecil seperti teks, warna, atau tata letak.  
- **Hot restart** → Menjalankan ulang aplikasi dari awal dan **menghapus seluruh state**.  
  Dipakai saat: mengubah variabel global, struktur widget, atau logic yang memengaruhi keseluruhan aplikasi.

---

# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements  

## 1. **Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter.**  
- **`Navigator.push()`** → menambahkan halaman baru **di atas** stack navigasi jadi user masih bisa kembali ke halaman sebelumnya dengan tombol **Back**.  
  Contoh: ketika menekan tombol **Create Product**, halaman form dibuka di atas halaman Home.  
- **`Navigator.pushReplacement()`** → menggantikan halaman saat ini dengan halaman baru, sehingga halaman lama **tidak bisa dikembalikan** dengan tombol Back.  
  Contoh: digunakan pada navigasi melalui **Drawer**, agar halaman tidak menumpuk ketika berpindah antar menu utama (Home ↔ Tambah Produk).

## 2. **Bagaimana kamu memanfaatkan _hierarchy_ widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman?**  
- **`Scaffold`** → menjadi rangka utama setiap halaman; menyediakan struktur umum aplikasi seperti AppBar, Body, dan Drawer.  
- **`AppBar`** → bagian atas halaman untuk menampilkan judul atau ikon.  
- **`Drawer`** → panel navigasi samping yang muncul saat menekan ikon menu.
Hierarkinya:  
`Scaffold` sebagai parent → memiliki `AppBar` di bagian atas dan `Drawer` di sisi kiri → konten utama diatur di dalam `body`.  

## 3. **Apa kelebihan menggunakan `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form?**  
- **`Padding`** → memberi jarak antar-elemen agar tampilan tidak menempel ke tepi screen.  
- **`SingleChildScrollView`** → membuat isi halaman dapat di-scroll jika konten melebihi tinggi layar, mencegah error seperti *Bottom overflowed by pixels*.  
- **`ListView`** → untuk daftar panjang elemen yang ingin ditampilkan dinamis.

## 4. **Bagaimana cara kamu menerapkan warna tema yang konsisten dengan identitas brand toko?**  
Warna utama aplikasi diatur melalui `ThemeData` di `main.dart` dengan kode:  
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
  ),
),
```

---

# Tugas 9 – Integrasi Layanan Web Django dengan Aplikasi Flutter

## 1. Mengapa perlu membuat model Dart untuk JSON?
- Model Dart menjaga **konsistensi tipe data**, sehingga tidak terjadi error runtime akibat tipe yang tidak sesuai.
- Mendukung **null-safety**; tanpa model, semua akses menjadi `dynamic` dan raw.
- Lebih **maintainable**: perubahan struktur JSON cukup diperbarui pada satu file model.
- Akses atribut lebih aman (`product.name` dibanding `json['name']`).

## 2. Fungsi `http` vs `CookieRequest`
- **`http`**
  - Untuk request umum tanpa autentikasi.
  - Digunakan untuk GET/POST publik dan fetch gambar.
- **`CookieRequest`**
  - Menyimpan dan mengirim session cookie Django.
  - Wajib untuk login, register, logout, dan endpoint lain yang butuh autentikasi.

## 3. Mengapa instance `CookieRequest` dibagikan ke seluruh aplikasi?
- Menjamin seluruh halaman memakai **session login yang sama**.
- Status login (`loggedIn`, cookie, username) konsisten di semua screen.
- Menghindari bug login/logout yang tidak sinkron.
- Logout cukup menghapus session di satu tempat → seluruh app ikut logout.

## 4. Konfigurasi konektivitas Flutter dengan Django
- **`10.0.2.2` di ALLOWED_HOSTS**: agar Android emulator bisa mengakses server Django di host.
- **Mengaktifkan CORS**: mengizinkan request cross-origin dari Flutter/Chrome.
- **Cookie SameSite = None + Secure**: agar session cookie boleh dikirim oleh browser modern.
- **Izin `INTERNET`** di Android: mengizinkan request Flutter Android.

**Jika konfigurasi salah:**
- CORS blocked → JSON tidak bisa di-fetch.  
- Session tidak dikirim → login gagal terus.  
- Emulator tidak bisa akses server → 400 Bad Request.

## 5. Mekanisme input → Django → kembali ke Flutter
1. User mengisi form pada Flutter.
2. Flutter validasi dan mengirim JSON ke Django dengan `request.postJson`.
3. Django membaca data (`json.loads`), memvalidasi, lalu menyimpan ke database.
4. Django mengirim JSON respons.
5. Flutter menerima respons → menampilkan snackbar / redirect ke halaman lain.

## 6. Mekanisme autentikasi (login, register, logout)
1. Register
- Flutter kirim username & password → Django membuat user → Flutter kembali ke halaman Login.
2. Login
- Flutter kirim username & password → Django autentikasi → Django mengirim cookie session.
- `CookieRequest` menyimpan cookie tersebut → Flutter redirect ke Home.
3. Logout
- Flutter memanggil endpoint logout → Django menghapus session → `CookieRequest` menghapus cookie → Flutter kembali ke LoginPage.

## 7. Step-by-step implementasi checklist secara bertahap
1. Menyiapkan Django (auth views, CORS, cookie, endpoint JSON, endpoint create-flutter).  
2. Menyiapkan Flutter (provider, CookieRequest, login & register).  
3. Membuat model Dart (`ProductEntry`) dari JSON Django.  
4. Membuat halaman daftar item + card item.  
5. Membuat halaman detail item dan menghubungkan card → detail.  
6. Menghubungkan form produk ke Django melalui POST JSON.  
7. Membuat tombol Logout dan menghubungkannya ke endpoint Django.  
8. Testing end-to-end: register → login → lihat produk → tambah produk → logout.