# Pink Notes App

## Deskripsi Proyek

Aplikasi pencatatan (Notes) berbasis Flutter yang dirancang untuk kemudahan mengelola catatan sehari-hari. Aplikasi ini menggunakan **SQLite** untuk manajemen basis data lokal yang persisten dan **SharedPreferences** untuk menyimpan preferensi tampilan pengguna. Aplikasi ini dibalut dengan antarmuka yang menerapkan skema warna dominan merah muda (pink).

## Fitur Utama

* **Operasi CRUD Lengkap:** Pengguna dapat menambah, membaca, mengubah, dan menghapus catatan.
* **Penyimpanan Lokal (SQLite):** Data catatan disimpan secara aman di dalam memori perangkat pengguna.
* **Manajemen Tema (Light/Dark Mode):** Pengguna dapat mengubah mode tampilan terang atau gelap. Pilihan ini disimpan secara otomatis menggunakan SharedPreferences.
* **Filter Kategori:** Catatan dapat dikelompokkan dan disaring berdasarkan kategori spesifik (Semua, Hutang, Kuliah, Personal, Kerja).
* **Pencarian Real-time:** Fitur kolom pencarian untuk menemukan catatan berdasarkan judul atau isi teks.
* **Catatan Favorit:** Fitur penanda (bintang) untuk menyaring dan mengutamakan catatan yang dianggap penting.

## Dependensi yang Digunakan

Proyek ini dibangun menggunakan beberapa *package* pihak ketiga dari pub.dev:

* `sqflite` - Untuk manajemen database SQLite.
* `path` - Untuk manipulasi direktori file database.
* `shared_preferences` - Untuk menyimpan data sesi preferensi tema.
* `provider` - Untuk manajemen state (State Management) secara reaktif pada perubahan tema.

## Struktur Direktori

```text
lib/
├── database/
│   └── db_helper.dart
├── models/
│   └── note_model.dart
├── providers/
│   └── theme_provider.dart
├── screens/
│   ├── home_screen.dart
│   └── detail_screen.dart
└── main.dart

```

## Cara Menjalankan Aplikasi

1. Pastikan Anda sudah menginstal Flutter SDK di komputer Anda.
2. Buka terminal dan arahkan ke direktori proyek ini.
3. Unduh semua dependensi dengan menjalankan perintah:
```bash
flutter pub get

```



```
4. Hubungkan perangkat fisik (smartphone) atau jalankan emulator.
5. Jalankan aplikasi dengan perintah:
   ```bash
   flutter run

```

---

## Screenshot Output Fitur

*Silakan ganti teks di dalam kurung siku dengan gambar tangkapan layar (screenshot) aplikasi Anda.*

### 1. Halaman Utama (Home Screen)

Menampilkan daftar catatan keseluruhan beserta tombol kategori dan navigasi atas.
<img width="1919" height="1089" alt="image" src="https://github.com/user-attachments/assets/59da611c-4fb0-4852-ab91-a3f1f36fee45" />



### 2. Fitur Pencarian dan Kategori

Menampilkan bagaimana catatan disaring saat pengguna mengetik di kolom pencarian atau memilih kategori tertentu (misalnya: Hutang).
<img width="1919" height="1085" alt="image" src="https://github.com/user-attachments/assets/f2e078c6-c53f-447a-8250-8f762a11db71" />



### 3. Halaman Form Tambah/Edit catatan

Menampilkan antarmuka pengguna saat menambahkan catatan baru, memilih kategori, dan menandai favorit.
<img width="1919" height="1085" alt="image" src="https://github.com/user-attachments/assets/4dd15116-e938-416e-be1e-764b8304f442" />
<img width="1919" height="1085" alt="image" src="https://github.com/user-attachments/assets/04ee1c25-0a44-47c8-907a-b05b9ef4202b" />



### 4. Mode Gelap (Dark Mode)

Menampilkan antarmuka aplikasi saat preferensi tema diubah menjadi tampilan gelap (Dark Mode).
<img width="1919" height="1085" alt="image" src="https://github.com/user-attachments/assets/86adb57a-bdd2-4593-a8f9-b4c8f33c43ee" />


### 5. Fitur Favorit
<img width="1919" height="1082" alt="image" src="https://github.com/user-attachments/assets/d8fd9257-a7dc-41e5-97ff-cd540799a4fa" />

