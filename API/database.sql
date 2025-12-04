-- Database Schema untuk Aplikasi Inventaris (Revisi)
CREATE DATABASE IF NOT EXISTS inventaris_db;
USE inventaris_db;

-- Tabel untuk data barang (tanpa barcode per barang)
CREATE TABLE IF NOT EXISTS barang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_barang VARCHAR(255) NOT NULL,
    ruangan VARCHAR(100) NOT NULL,
    jumlah INT DEFAULT 1,
    kondisi ENUM('Baik', 'Rusak Ringan', 'Rusak Berat', 'Hilang') DEFAULT 'Baik',
    status_pengecekan ENUM('Belum_Dicek', 'Sedang_Dicek', 'Sudah_Dicek') DEFAULT 'Belum_Dicek',
    nama_petugas VARCHAR(100) NOT NULL,
    tanggal_pengecekan DATE NOT NULL,
    keterangan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_ruangan (ruangan),
    INDEX idx_status_pengecekan (status_pengecekan)
);

-- Tabel untuk history perubahan barang
CREATE TABLE IF NOT EXISTS barang_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    barang_id INT NOT NULL,
    field_name VARCHAR(100) NOT NULL,
    old_value TEXT,
    new_value TEXT,
    changed_by VARCHAR(100),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (barang_id) REFERENCES barang(id) ON DELETE CASCADE
);

-- Insert sample data
INSERT INTO barang (nama_barang, ruangan, jumlah, kondisi, status_pengecekan, nama_petugas, tanggal_pengecekan, keterangan) VALUES
('Meja Kantor', 'Aula', 5, 'Baik', 'Sudah_Dicek', 'Ahmad', '2024-01-15', 'Kondisi baik, tidak ada kerusakan'),
('Kursi Putar', 'Aula', 10, 'Baik', 'Sudah_Dicek', 'Ahmad', '2024-01-15', 'Kondisi baik'),
('Lemari Arsip', 'Aula', 3, 'Baik', 'Sudah_Dicek', 'Ahmad', '2024-01-15', 'Berfungsi normal'),
('Komputer Desktop', 'Klinik', 8, 'Baik', 'Sudah_Dicek', 'Budi', '2024-01-15', 'Berfungsi normal'),
('Printer Laser', 'Klinik', 2, 'Rusak Ringan', 'Sudah_Dicek', 'Budi', '2024-01-15', 'Perlu penggantian toner'),
('Router WiFi', 'Klinik', 1, 'Baik', 'Sudah_Dicek', 'Budi', '2024-01-15', 'Koneksi stabil'),
('AC Split', 'Dapur', 1, 'Baik', 'Sudah_Dicek', 'Citra', '2024-01-15', 'Dingin normal'),
('Proyektor', 'Dapur', 1, 'Baik', 'Sudah_Dicek', 'Citra', '2024-01-15', 'Lampu masih terang'),
('Whiteboard', 'Dapur', 2, 'Baik', 'Sudah_Dicek', 'Citra', '2024-01-15', 'Kondisi baik'),
('Meja Panjang', 'Aula', 6, 'Baik', 'Sudah_Dicek', 'Dewi', '2024-01-15', 'Kokoh dan stabil'),
('Kursi Lipat', 'Aula', 50, 'Baik', 'Sudah_Dicek', 'Dewi', '2024-01-15', '50 unit tersedia'),
('Sound System', 'Aula', 1, 'Baik', 'Sudah_Dicek', 'Dewi', '2024-01-15', 'Audio jernih');