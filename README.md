# Tugas Individu - Pemrograman Mobile   
_Mata Kuliah: Platform-Based Programming (PBP)_

## Identitas
- **Nama:** Karla Ameera Raswanda
- **NPM:** 2406414542
- **Kelas:** PBP E

---

## Tugas 7: Elemen Dasar Flutter  

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
  Digunakan untuk tampilan yang berubah karena interaksi pengguna, misalnya form input, counter, atau daftar yang bisa di-update.

## 5. **Jelaskan bagaimana cara kerja `BuildContext`.**  
`BuildContext` adalah objek yang menyimpan posisi widget di dalam _widget tree_.
Fungsinya: mengakses data dari parent, seperti tema warna (`Theme.of(context)`) atau menampilkan _SnackBar_ (`ScaffoldMessenger.of(context)`).  

## 6. **Jelaskan perbedaan antara `hot reload` dan `hot restart`.**  
- **Hot reload** → Memperbarui tampilan dengan kode terbaru **tanpa menghapus state (keadaan)** aplikasi.  
  Dipakai saat: ada perubahan kecil seperti teks, warna, atau tata letak.  
- **Hot restart** → Menjalankan ulang aplikasi dari awal dan **menghapus seluruh state**.  
  Dipakai saat: mengubah variabel global, struktur widget, atau logic yang memengaruhi keseluruhan aplikasi.

---

## Tugas 8:  
