CREATE DATABASE akademikSI;
USE akademikSI;

CREATE TABLE Mahasiswa (
    NIM CHAR(12) PRIMARY KEY,
    Nama VARCHAR(100) NOT NULL,
    Angkatan INT NOT NULL,
    Alamat TEXT,
    No_Telepon VARCHAR(15),
    Prodi VARCHAR(50)
);

CREATE TABLE Dosen (
    NIP CHAR(20) PRIMARY KEY,
    Nama VARCHAR(100) NOT NULL,
    No_Telepon VARCHAR(15),
    Alamat TEXT
);

CREATE TABLE MataKuliah (
    Kode_MK CHAR(10) PRIMARY KEY,
    Nama_MK VARCHAR(100) NOT NULL,
    SKS INT (10),
    Semester INT (10)
);

CREATE TABLE KRS (
    ID_KRS INT AUTO_INCREMENT PRIMARY KEY,
    NIM CHAR(12),
    Kode_MK CHAR(10),
    Semester INT (10),
    Tahun_Akademik VARCHAR(10),
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM) ON DELETE CASCADE,
    FOREIGN KEY (Kode_MK) REFERENCES MataKuliah(Kode_MK) ON DELETE CASCADE
);

CREATE TABLE Mengajar (
    ID_Mengajar INT AUTO_INCREMENT PRIMARY KEY,
    NIP CHAR (20),
    Kode_MK CHAR (10),
    Kelas VARCHAR(10),
    Semester INT (10),
    Tahun_Akademik VARCHAR(10),
    FOREIGN KEY (NIP) REFERENCES Dosen(NIP) ON DELETE CASCADE,
    FOREIGN KEY (Kode_MK) REFERENCES MataKuliah(Kode_MK) ON DELETE CASCADE
    
);

SHOW TABLES;

DESC mahasiswa;

INSERT INTO Mahasiswa (NIM, Nama, Angkatan, Alamat, No_Telepon, Prodi) VALUES
('230441100002', 'RADHINA ZAKHRATUL JANNAH', 2023, 'Jl. Ahmad Yani No. 12', '081298765432', 'Sistem Informasi'),
('230441100022', 'LANNY APRILIA', 2023, 'Jl. Merdeka No. 21', '081234567890', 'Sistem Informasi'),
('230441100027', 'DYLAN AKHTARREZA', 2023, 'Jl. Anggrek Raya No. 15', '081398765432', 'Sistem Informasi'),
('230441100030', 'ROHMATUL AZLI FITRI DEVI', 2023, 'Jl. Diponegoro No. 8', '082123456789', 'Sistem Informasi'),
('230441100031', 'ALINI MIRA TRIWAHYUNINGSIH', 2023, ' Jl. Sudirman No. 10', '085267891234', 'Sistem Informasi'),
('230441100034', 'AGUS WEDI', 2023, 'Jl. Pahlawan No. 5', '081987654321', 'Sistem Informasi'),
('230441100101', 'ERLANGGA SATRYA HUSADA', 2023, 'Jl. Melati Indah No. 7', '087845678901', 'Sistem Informasi'),
('230441100120', 'ALVYAN MAULANA KARNAWAN PUTRA', 2023, 'Jl. Gajah Mada No. 30', '083176543210', 'Sistem Informasi'),
('230441100128', 'ADZIKRY DEVEGA MAHARITZA AISY', 2023, 'Jl. Kenanga No. 25', '085723456781', 'Sistem Informasi'),
('230441100136', 'NURUL HASANAH', 2023, 'Jl. Cendana No. 18', '089654321098', 'Sistem Informasi');

SELECT * FROM mahasiswa;

ALTER TABLE Dosen CHANGE Alamat Email VARCHAR(100) NOT NULL;

SELECT * FROM dosen;

INSERT INTO Dosen (NIP, Nama, No_Telepon, Email) VALUES
('197509092002121001', 'Dr. Budi Dwi Satoto, S.T., M.Kom', '081312345678', 'budids@trunojoyo.ac.id'),
('197808042003121001', 'Wahyudi Agustiono, S.Kom., M.Sc., Ph.D', '081398765432', 'wahyudi.agustiono@trunojoyo.ac.id'),
('197709212008122002', 'Dr. Yeni Kustiyahningsih, S.Kom., M.Kom', '082176543210', 'ykustiyahningsih@trunojoyo.ac.id'),
('197809262006041001', 'Dr. Wahyudi Setiawan, S.Kom, M.Kom', '081234567892', 'wsetiawan@trunojoyo.ac.id'),
('198308282008122002', 'Sri Herawati, S.Kom., M.Kom', '081987654321', 'sriherawati@trunojoyo.ac.id'),
('198003212008011008', 'Mohammad Syarief, S.T., M.Cs.', '089764536714', 'Mohammad.syarief@trunojoyo.ac.id'),
('197906052003122003', 'Eza Rahmanita, S.T., M.T.', '085635678925', 'eza_rahmanita@trunojoyo.ac.id'),
('198711272014042001', 'Novi Prastiti, S.Kom, M.Kom', '081345678426', 'prastitinovi@trunojoyo.ac.id'),
('197601202001121001', 'Firli Irhamni, S.T., M.Kom', '087465783326', 'prastitinovi@trunojoyo.ac.id'),
('197508272003122001', 'Fitri Damayanti, S.Kom, M.Kom', '087655438901', 'fitrid@trunojoyo.ac.id');

INSERT INTO MataKuliah (Kode_MK, Nama_MK, SKS, Semester) VALUES
('SI441', 'DATA MINING', 3, 4),
('SI448', 'FINANCIAL TECHNOLOGY', 3, 4),
('SI442', 'IMPLEMENTASI DAN PENGUJIAN PERANGKAT LUNAK', 3, 4),
('SI446', 'MANAJEMEN PROYEK IT', 3, 4),
('SI447', 'PEMROGRAMAN BERGERAK', 4, 4),
('SI445', 'PERENCANAAN SUMBER DAYA PERUSAHAAN', 3, 4),
('SI444', 'SISTEM MANAJEMEN BASIS DATA', 4, 4),
('SI443', 'SISTEM PENDUKUNG KEPUTUSAN', 3, 4),
('SI665', 'SMART CITY', 3, 6),
('SI664', 'INTERNET OF THING', 3, 6);

SELECT * FROM matakuliah;

INSERT INTO KRS (NIM, Kode_MK, Semester, Tahun_Akademik) VALUES
('230441100002', 'SI446', 4, "2024/2025"),
('230441100034', 'SI665', 6, "2024/2025"),
('230441100031', 'SI446', 4, "2024/2025"),
('230441100120', 'SI447', 4, "2024/2025"),
('230441100002', 'SI448', 4, "2024/2025");

SELECT * FROM KRS;

ALTER TABLE Matakuliah RENAME TO Daftar_MK;

SELECT * FROM Daftar_MK;

SELECT * FROM Mengajar;

DROP DATABASE akademiksi;