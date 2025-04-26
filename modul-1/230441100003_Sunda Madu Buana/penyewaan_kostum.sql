CREATE DATABASE penyewaan_kostum;
USE penyewaan_kostum;

CREATE TABLE Pelanggan (
    ID_Pelanggan INT PRIMARY KEY,
    Nama_Pelanggan VARCHAR(100),
    No_Telepon VARCHAR(15),
    Alamat TEXT,
    Email VARCHAR(100)
);

CREATE TABLE Kategori_Kostum (
    ID_Kategori INT PRIMARY KEY,
    Nama_Kategori VARCHAR(50)
);

CREATE TABLE Kostum (
    ID_Kostum INT PRIMARY KEY,
    Nama_Kostum VARCHAR(100),
    ID_Kategori INT,
    Ukuran ENUM('S', 'M', 'L', 'XL', 'XXL'),
    Harga_Sewa VARCHAR(100),
    STATUS ENUM('Tersedia', 'Tidak Tersedia'),
    FOREIGN KEY (ID_Kategori) REFERENCES Kategori_Kostum(ID_Kategori)
);

CREATE TABLE Peminjaman (
    ID_Peminjaman INT PRIMARY KEY,
    ID_Pelanggan INT,
    Tanggal_Pinjam DATE,
    Tanggal_Kembali DATE,
    Total_Harga VARCHAR(100),
    STATUS ENUM('Dipinjam', 'Dikembalikan'),
    FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan(ID_Pelanggan)
);

CREATE TABLE Pengembalian (
    ID_Pengembalian INT PRIMARY KEY,
    ID_Peminjaman INT,
    Tanggal_Kembali_Sebenarnya DATE,
    Denda_Keterlambatan VARCHAR(100),
    Kondisi_Kostum ENUM('Baik', 'Rusak'),
    FOREIGN KEY (ID_Peminjaman) REFERENCES Peminjaman(ID_Peminjaman)
);




