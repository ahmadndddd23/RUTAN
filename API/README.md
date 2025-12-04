# 📦 Aplikasi Inventaris Barang (Revisi)

Aplikasi web admin untuk manajemen inventaris barang dengan interface yang user-friendly.

## 🎯 Konsep Sistem

Sistem web admin untuk manajemen inventaris barang dengan interface yang intuitif. Admin dapat menambah, mengedit, dan menghapus data barang melalui tombol-tombol yang mudah diakses.

## 🔄 Alur Sistem

### Admin

- ✅ Tidak perlu login (akses langsung)
- ➕ Input barang baru
- ✏️ Update data barang
- 📝 Mencatat kondisi barang (Baik, Rusak Ringan, Rusak Berat, Hilang)
- 👤 Mencatat nama petugas pengecekan
- 📅 Mencatat tanggal pengecekan
- 🏢 Mengelola barang per ruangan
- 🗑️ Hapus data barang
- 📱 Generate QR Code untuk setiap ruangan
- 💾 Download QR Code

### Interface Web Admin

- 🖥️ Interface web untuk manajemen inventaris
- ➕ Tombol "Tambah Barang Baru" untuk input data
- ✏️ Tombol "Edit" pada setiap item untuk update
- 🗑️ Tombol "Hapus" dengan konfirmasi
- 📊 Dashboard dengan statistik per ruangan
- 🎨 UI modern dengan form yang user-friendly

## 🚀 Cara Instalasi

### 1. Persiapan Database

```sql
-- Buka phpMyAdmin atau MySQL client
-- Jalankan file database.sql untuk membuat database dan tabel
```

Atau import manual:

1. Buka phpMyAdmin
2. Buat database baru bernama `inventaris_db`
3. Import file `database.sql`

### 2. Konfigurasi

Edit file `config.php` jika perlu mengubah pengaturan database:

```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'inventaris_db');
```

### 3. Akses Aplikasi

- **Halaman User (Default)**: `http://localhost/inventaris_app/`
- **Halaman Admin**: `http://localhost/inventaris_app/admin.php`
- **Halaman Ruangan**: `http://localhost/inventaris_app/ruangan.php?nama=NamaRuangan`

## 📱 Cara Penggunaan

### Untuk Admin:

1. **Buka halaman admin** (`admin.php`)

2. **Lihat QR Code Ruangan**:

   - Di bagian atas halaman admin, tersedia QR Code untuk setiap ruangan
   - Klik "Download QR" untuk menyimpan QR Code
   - Cetak dan tempel QR Code di pintu/dinding ruangan

3. **Tambah Barang Baru**:

   - Isi form:
     - Nama Barang (wajib)
     - Ruangan (wajib, bisa pilih dari dropdown atau ketik baru)
     - Kondisi (pilih dari dropdown)
     - Nama Petugas (wajib)
     - Tanggal Pengecekan (wajib)
     - Keterangan (opsional)
   - Klik "Simpan Barang"

4. **Edit Barang**:

   - Klik tombol "Edit" pada daftar barang
   - Ubah data yang diperlukan
   - Klik "Update Barang"

5. **Hapus Barang**:
   - Klik tombol "Hapus" (akan ada konfirmasi)

### UI/UX Interface Admin:

1. **Tombol "Tambah Barang Baru"**:

   - Lokasi: Di bagian atas halaman admin
   - Fungsi: Membuka modal form input
   - UI: Tombol hijau dengan ikon plus (+)
   - UX: Form dengan validasi real-time, dropdown untuk kondisi

2. **Tombol "Edit" per Item**:

   - Lokasi: Pada setiap card/baris item
   - Fungsi: Membuka modal edit dengan data terisi otomatis
   - UI: Tombol biru dengan ikon pensil
   - UX: Auto-fill form, highlight field yang diubah

3. **Tombol "Hapus" per Item**:

   - Lokasi: Pada setiap card/baris item
   - Fungsi: Menghapus item dengan konfirmasi
   - UI: Tombol merah dengan ikon sampah
   - UX: Dialog konfirmasi dengan detail item

4. **Dashboard Statistik**:

   - Lokasi: Header halaman admin
   - Fungsi: Menampilkan ringkasan per ruangan
   - UI: Card dengan badge warna untuk kondisi
   - UX: Hover effect, klik untuk filter

## 🔧 Struktur File

```
inventaris_app/
├── config.php          # Konfigurasi database
├── database.sql        # Schema database dan sample data
├── index.php          # Halaman default (redirect ke user.php)
├── admin.php          # Halaman admin dengan QR Code generator
├── user.php           # Halaman user dengan daftar ruangan
├── ruangan.php        # Halaman detail inventaris per ruangan
└── README.md          # Dokumentasi ini
```

## 📊 Struktur Database

### Tabel: barang

| Field              | Type         | Description                             |
| ------------------ | ------------ | --------------------------------------- |
| id                 | INT          | Primary key (auto increment)            |
| nama_barang        | VARCHAR(255) | Nama barang                             |
| ruangan            | VARCHAR(100) | Lokasi ruangan (indexed)                |
| kondisi            | ENUM         | Baik, Rusak Ringan, Rusak Berat, Hilang |
| nama_petugas       | VARCHAR(100) | Nama petugas pengecekan                 |
| tanggal_pengecekan | DATE         | Tanggal pengecekan terakhir             |
| keterangan         | TEXT         | Keterangan tambahan                     |
| created_at         | TIMESTAMP    | Waktu pembuatan record                  |
| updated_at         | TIMESTAMP    | Waktu update terakhir                   |

**Catatan**: Tidak ada field barcode per barang. Sistem menggunakan QR Code per ruangan.

## 🎨 Fitur Utama

### QR Code System

- ✨ QR Code otomatis di-generate untuk setiap ruangan
- 📱 Scan langsung dari kamera HP
- 🔗 Link langsung ke halaman inventaris ruangan
- 💾 Download QR Code untuk dicetak

### Admin Interface

- 📊 Dashboard dengan QR Code semua ruangan
- ➕ Form input barang yang mudah
- ✏️ Edit inline dengan auto-fill
- 🗑️ Hapus dengan konfirmasi
- 📋 Tabel daftar semua barang
- 🎨 Desain modern dan responsive

### User Interface

- 🏢 Grid card ruangan dengan statistik
- 📊 Visual statistik kondisi barang
- 📱 QR Code untuk setiap ruangan
- 👁️ Preview inventaris per ruangan
- 🖨️ Fitur cetak laporan

### Halaman Ruangan

- 📈 Statistik lengkap per ruangan
- 📦 Grid card untuk setiap barang
- 🎨 Badge warna untuk kondisi
- 📝 Detail lengkap setiap barang
- 🖨️ Format cetak yang rapi

## 💡 Contoh Penggunaan

### Skenario 1: Setup Awal

1. Admin input semua barang di database
2. Admin download QR Code untuk setiap ruangan
3. Cetak dan tempel QR Code di setiap ruangan
4. User bisa langsung scan untuk cek inventaris

### Skenario 2: Pengecekan Rutin

1. Petugas scan QR Code di ruangan
2. Lihat daftar barang yang harus dicek
3. Catat kondisi barang
4. Admin update data di sistem

### Skenario 3: Laporan

1. User scan QR Code ruangan
2. Lihat statistik dan detail barang
3. Klik "Cetak Laporan"
4. Simpan atau cetak untuk dokumentasi

## 🔒 Keamanan

- Input di-sanitasi menggunakan `mysqli_real_escape_string()`
- Konfirmasi sebelum menghapus data
- Validasi data di sisi server
- URL encoding untuk parameter

## 📝 Catatan Penting

- **Interface web admin** - Semua manajemen dilakukan melalui web interface
- **Tombol intuitif** - Tambah, edit, hapus dengan UI yang user-friendly
- **Dashboard statistik** - Ringkasan kondisi barang per ruangan
- **Tidak perlu login** - Sesuai permintaan, semua akses tanpa autentikasi

## 🆘 Troubleshooting

**Database tidak terkoneksi:**

- Pastikan XAMPP/MySQL sudah running
- Cek konfigurasi di `config.php`
- Pastikan database `inventaris_db` sudah dibuat

**QR Code tidak muncul:**

- Pastikan koneksi internet aktif (menggunakan API online)
- Cek URL di `admin.php` dan `user.php`

**Halaman ruangan tidak muncul:**

- Pastikan parameter `nama` ada di URL
- Cek nama ruangan di database (case-sensitive)

**Error saat menyimpan:**

- Pastikan semua field required sudah diisi
- Cek koneksi database

## 🎯 Sample Data

Database sudah include sample data untuk 4 ruangan:

- **Ruang Admin** - 3 barang
- **Ruang IT** - 3 barang
- **Ruang Rapat** - 3 barang
- **Aula** - 3 barang

Total: 12 barang contoh siap digunakan untuk testing.

## 📞 Support

Jika ada pertanyaan atau masalah, silakan hubungi administrator sistem.

---

Dibuat dengan ❤️ untuk kemudahan pengelolaan inventaris melalui interface web admin
