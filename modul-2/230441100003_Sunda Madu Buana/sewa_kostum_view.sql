USE penyewaan_kostum;

-- insert dan select --
INSERT INTO Pelanggan (ID_Pelanggan, Nama_Pelanggan, No_Telepon, Alamat, Email) VALUES
(1, 'Dewi Lestari', '081234567890', 'Jl. Merpati No. 5, Bandung', 'dewi@gmail.com'),
(2, 'Rudi Hartono', '081298765432', 'Jl. Kenari No. 12, Cimahi', 'rudi@yahoo.com'),
(3, 'Siti Aminah', '082134568901', 'Jl. Melati No. 21, Garut', 'aminah@mail.com'),
(4, 'Bambang Sutrisno', '081234123456', 'Jl. Mawar No. 3, Sumedang', 'bambang@outlook.com'),
(5, 'Linda Marlina', '083123456789', 'Jl. Anggrek No. 10, Tasikmalaya', 'linda@gmail.com');

SELECT * FROM pelanggan;

INSERT INTO Kategori (ID_Kategori, Nama_Kategori) VALUES
(1, 'Tradisional'),
(2, 'Hewan'),
(3, 'Cosplay');

SELECT * FROM kategori;

INSERT INTO Kostum (ID_Kostum, Nama_Kostum, ID_Kategori, Ukuran, Harga_Sewa, STATUS) VALUES
(1, 'Kebaya Sunda', 1, 'M', '100000', 'Tersedia'),
(2, 'Baju Adat Bali', 1, 'L', '120000', 'Tersedia'),
(3, 'Kostum Kelinci', 2, 'S', '90000', 'Tidak Tersedia'),
(4, 'Kostum Harimau', 2, 'XL', '95000', 'Tersedia'),
(5, 'Kostum Nico Robin', 3, 'M', '150000', 'Tersedia'),
(6, 'Kostum Boa Hancock', 3, 'L', '160000', 'Tersedia');

SELECT * FROM kostum;

INSERT INTO Peminjaman (ID_Peminjaman, ID_Pelanggan, Tanggal_Pinjam, Tanggal_Kembali, Total_Harga, STATUS) VALUES
(1, 1, '2025-04-01', '2025-04-05', '100000', 'Dikembalikan'), -- Kebaya Sunda --
(2, 2, '2025-04-03', '2025-04-07', '150000', 'Dipinjam'),     -- Nico Robin --
(3, 3, '2025-04-10', '2025-04-12', '90000', 'Dikembalikan'),  -- Kelinci --
(4, 4, '2025-04-15', '2025-04-18', '160000', 'Dikembalikan'), -- Hancock --
(5, 5, '2025-04-17', '2025-04-20', '120000', 'Dipinjam');     -- Baju Adat Bali --

SELECT * FROM peminjaman;

INSERT INTO Pengembalian (ID_Pengembalian, ID_Peminjaman, Tanggal_Kembali_Sebenarnya, Denda_Keterlambatan, Kondisi_Kostum) VALUES
(1, 1, '2025-04-05', '0', 'Baik'),
(2, 3, '2025-04-13', '10000', 'Baik'),
(3, 4, '2025-04-18', '0', 'Baik');

SELECT * FROM pengembalian;

-- view -- 
CREATE VIEW view_peminjaman_pelanggan AS
SELECT 
    p.ID_Peminjaman,
    pl.Nama_Pelanggan,
    pl.No_Telepon,
    p.Tanggal_Pinjam,
    p.Tanggal_Kembali,
    p.Total_Harga,
    p.STATUS AS Status_Peminjaman
FROM Peminjaman p
JOIN Pelanggan pl ON p.ID_Pelanggan = pl.ID_Pelanggan;

SELECT * FROM view_peminjaman_pelanggan;

-- nomor 2 --
CREATE VIEW view_peminjaman_lengkap AS
SELECT 
    pj.ID_Peminjaman,
    pl.Nama_Pelanggan,
    pj.Tanggal_Pinjam,
    pj.Tanggal_Kembali,
    pg.Tanggal_Kembali_Sebenarnya,
    pg.Denda_Keterlambatan,
    pg.Kondisi_Kostum
FROM Peminjaman pj
JOIN Pelanggan pl ON pj.ID_Pelanggan = pl.ID_Pelanggan
LEFT JOIN Pengembalian pg ON pj.ID_Peminjaman = pg.ID_Peminjaman;

SELECT * FROM view_peminjaman_lengkap;

-- nomor 3 --
CREATE VIEW view_peminjaman_aktif AS
SELECT 
    pj.ID_Peminjaman,
    pl.Nama_Pelanggan,
    pj.Tanggal_Pinjam,
    pj.Tanggal_Kembali,
    pj.Total_Harga
FROM Peminjaman pj
JOIN Pelanggan pl ON pj.ID_Pelanggan = pl.ID_Pelanggan
WHERE pj.STATUS = 'Dipinjam';

SELECT * FROM view_peminjaman_aktif;

-- nomor 4 --
CREATE VIEW view_jumlah_peminjaman_pelanggan AS
SELECT 
    pl.ID_Pelanggan,
    pl.Nama_Pelanggan,
    COUNT(pj.ID_Peminjaman) AS Jumlah_Peminjaman
FROM Peminjaman pj
JOIN Pelanggan pl ON pj.ID_Pelanggan = pl.ID_Pelanggan
GROUP BY pl.ID_Pelanggan, pl.Nama_Pelanggan;

SELECT * FROM view_jumlah_peminjaman_pelanggan;

-- nomor 5 --
CREATE VIEW view_ringkasan_transaksi AS
SELECT 
    pj.ID_Peminjaman,
    pl.Nama_Pelanggan,
    pj.Tanggal_Pinjam,
    pj.Tanggal_Kembali,
    pj.Total_Harga,
    pj.STATUS AS Status_Peminjaman,
    pg.Tanggal_Kembali_Sebenarnya,
    pg.Kondisi_Kostum,
    pg.Denda_Keterlambatan
FROM Peminjaman pj
JOIN Pelanggan pl ON pj.ID_Pelanggan = pl.ID_Pelanggan
LEFT JOIN Pengembalian pg ON pj.ID_Peminjaman = pg.ID_Peminjaman;

SELECT * FROM view_ringkasan_transaksi;