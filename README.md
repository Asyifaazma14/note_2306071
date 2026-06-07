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
<img width="1600" height="907" alt="image" src="https://github.com/user-attachments/assets/a779f83c-65af-4a51-92c7-8bb7880d79de" />


### 2. Fitur Pencarian dan Kategori

Menampilkan bagaimana catatan disaring saat pengguna mengetik di kolom pencarian atau memilih kategori tertentu (misalnya: Hutang).
<img width="1919" height="1088" alt="image" src="https://github.com/user-attachments/assets/a982f343-2277-4290-a2d3-3330eddf04e8" />


### 3. Halaman Form Tambah Catatan

Menampilkan antarmuka pengguna saat menambahkan catatan baru, memilih kategori, dan menandai favorit.
<img width="1919" height="1086" alt="image" src="https://github.com/user-attachments/assets/534471c5-6f70-40a6-9b99-04cdce6b2279" />


### 4. Mode Gelap (Dark Mode)

Menampilkan antarmuka aplikasi saat preferensi tema diubah menjadi tampilan gelap (Dark Mode).
<img width="1919" height="1087" alt="image" src="https://github.com/user-attachments/assets/6b4cd208-809c-46a8-a62c-2c79215c09b9" />

### 5. Fitur Favorit
<img width="1919" height="1086" alt="image" src="https://github.com/user-attachments/assets/b1517434-7da0-4734-8e87-96b72c02c35f" />
