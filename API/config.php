<?php
// Matikan error reporting biar path server tidak bocor ke publik jika error
error_reporting(0);

// Data dari TiDB Cloud (Cek Langkah 2 tadi)
$host = "gateway01.ap-southeast-1.prod.aws.tidbcloud.com"; // Ganti dengan Host TiDB Anda
$user = "PgcYvhTrnMwgLYW.root";                    // Ganti dengan User TiDB Anda
$pass = "hsynlUp5TW4MHL8l ";          // Ganti dengan Password TiDB Anda
$db_name = "inventaris_db";                     // Nama database (Default TiDB biasanya 'test', kecuali Anda buat baru)
$port = 4000;                          // Port TiDB selalu 4000

// Koneksi dengan Port
$koneksi = mysqli_connect($host, $user, $pass, $db_name, $port);

// Cek Koneksi
if (!$koneksi) {
    // Kalau gagal, tampilkan pesan error sederhana
    die("Gagal koneksi ke Database Cloud: " . mysqli_connect_error());
}
