CREATE DATABASE ptujeb;

CREATE TABLE departemen(
                           id_dep CHAR (2) NOT NULL PRIMARY KEY,
                           nama_dep CHAR (2) NOT NULL,
                           UNIQUE KEY nama_dep (nama_dep)
) ENGINE = InnoDB;

CREATE TABLE proyek (
                        id_proyek INT PRIMARY KEY AUTO_INCREMENT,
                        deskripsi CHAR (100) NOT NULL,
                        selesai BOOLEAN NOT NULL DEFAULT FALSE
) ENGINE = InnoDB;

CREATE TABLE karyawan (
                          no_karyawan CHAR (8) NOT NULL PRIMARY KEY,
                          nama CHAR (35) NOT NULL,
                          jenis_kelamin BOOLEAN NOT NULL,
                          tanggal_lahir DATE NOT NULL,
                          jenis_karyawan CHAR (1) NOT NULL DEFAULT '*',
                          id_dep CHAR (2) NOT NULL,
                          KEY id_dep (id_dep),
                          FOREIGN KEY (id_dep)
                              REFERENCES departemen (id_dep)
) ENGINE = InnoDB;

CREATE TABLE sekretaris (
                            no_karyawan CHAR (8) NOT NULL,
                            bahasa_asing CHAR (10) NOT NULL,
                            FOREIGN KEY (no_karyawan)
                                REFERENCES karyawan (no_karyawan),
                            PRIMARY KEY (no_karyawan, bahasa_asing)
) ENGINE = InnoDB;

CREATE TABLE teknisi (
                         no_karyawan CHAR (8) NOT NULL,
                         keahlian_teknis CHAR (25) NOT NULL,
                         FOREIGN KEY (no_karyawan)
                             REFERENCES karyawan (no_karyawan),
                         PRIMARY KEY (no_karyawan, keahlian_teknis)
) ENGINE = InnoDB;

CREATE TABLE manajer (
                         no_karyawan CHAR (8) NOT NULL PRIMARY KEY,
                         tipe CHAR (15) NOT NULL,
                         no_polisi CHAR (9) NOT NULL,
                         id_dep CHAR (2) NOT NULL,
                         KEY id_dep (id_dep),
                         FOREIGN KEY (id_dep)
                             REFERENCES departemen (id_dep),
                         FOREIGN KEY (no_karyawan)
                             REFERENCES karyawan (no_karyawan)
) ENGINE = InnoDB;

CREATE TABLE teknisi_proyek (
                                no_karyawan CHAR (8) NOT NULL,
                                id_proyek INT NOT NULL,
                                mulai_tanggal DATE NOT NULL,
                                sampai_tanggal DATE,
                                FOREIGN KEY (no_karyawan)
                                    REFERENCES karyawan (no_karyawan),
                                KEY id_proyek (id_proyek),
                                FOREIGN KEY (id_proyek)
                                    REFERENCES proyek (id_proyek),
                                PRIMARY KEY (no_karyawan, id_proyek)
) ENGINE = InnoDB;

INSERT INTO departemen
VALUES ('PD', 'Produksi'),
       ('AK', 'Akuntansi'),
       ('SD', 'SDM'),
       ('RD', 'R & D');

INSERT INTO departemen (id_dep, nama_dep) VALUES ('PS', 'Pemasaran');

ALTER TABLE departemen
    MODIFY COLUMN nama_dep CHAR (10);

SELECT * FROM departemen;

INSERT INTO karyawan
VALUES ('20050001', 'Rusdianto', TRUE, '1975-03-24', 'M','PS');

INSERT INTO karyawan (no_karyawan, nama, jenis_kelamin, tanggal_lahir, jenis_karyawan, id_dep)
VALUES ('2005001', 'Rusdianto', TRUE, '1975-03-24', 'M', 'PS');

SELECT * FROM karyawan;

INSERT INTO departemen
VALUES ('PM', 'Pemasaran');

UPDATE departemen
SET nama_dep = 'Pemasaran' WHERE id_dep = 'PS';

SELECT * FROM departemen;

UPDATE karyawan
SET nama = 'Rusdianto Wijaya', id_dep = 'AK' WHERE no_karyawan ='20050001';

SELECT * FROM karyawan;

DELETE FROM karyawan WHERE no_karyawan = '20050001';

DELETE FROM karyawan WHERE no_karyawan = '2005001';

SELECT * FROM proyek;

SHOW CREATE TABLE proyek;

INSERT INTO proyek
VALUES (1, 'Proyek Pengembangan Aplikasi A/R Internal',0),
       (2, 'Proyek Pengembangan Aplikasi A/P Internal',0),
       (3, 'Proyek LAN di CV Mayapada', 0),
       (4, 'Proyek Instalasi Jaringan Komputer di PT Suramaya',0),
       (5, 'Proyek Instalasi Jaringan Komputer di PT Jayapraya', 0),
       (6, 'Pelatihan LAN di PT Durajati', 0),
       (7, 'Pra-tender PT Sukamaju', 0),
       (8, 'Pengembangan Aplikasi BBN', 0);

INSERT INTO karyawan
VALUES ('20050001', 'Rusdianto', TRUE, 'M', '1975-03-24', 'PS'),
       ('20050002', 'Darmaji', TRUE, 'M', '1977-03-17', 'AK'),
       ('20050003', 'Dirham', TRUE, 'M', '1969-12-01', 'SD'),
       ('20050004', 'Durhan', TRUE, 'T', '1972-03-28', 'EN'),
       ('20060001', 'Dewi Nurhayati', FALSE, 'S', '1973-04-01', 'PS'),
       ('20060002', 'Diah Ariyanti', FALSE, '', '1977-10-14', 'AK'),
       ('20060003', 'Danang Danarhadi', TRUE, 'M', '1976-01-16', 'EN'),
       ('20060004', 'Sakroni', TRUE, '', '1977-06-23', 'PS'),
       ('20080001', 'Sita Amelia', FALSE, '', '1980-12-11', 'SD'),
       ('20080002', 'Rita Andini', FALSE, 'S', '1982-03-01', 'AK'),
       ('20080003', 'Rudy Hartono', TRUE, 'M', '1981-08-08', 'RD'),
       ('20080004', 'Karmen', TRUE, 'T', '1979-05-14', 'EN'),
       ('20080005', 'Santi Wardani', TRUE, '', '1985-11-17', 'PS'),
       ('20080006', 'Savitri', FALSE, '', '1988-12-02', 'PS'),
       ('20080007', 'Firanda', FALSE, '', '1986-07-01', 'PS'),
       ('20080008', 'Rian Adiwarna', TRUE, '', '1986-01-13', 'PS'),
       ('2009001', 'Ratna Maharani', FALSE, '', '1977-08-29', 'PS'),
       ('20090002', 'Robert Simamora', TRUE, 'T', '1969-11-30', 'EN'),
       ('20090003', 'Saman Alhamdi', TRUE, '', '1978-02-28', 'PS'),
       ('20090004', 'Sumartini', FALSE, 'S', '1980-07-24', 'SD'),
       ('20090005', 'Karim Sujawardi', TRUE, '', '1985-10-01', 'RD'),
       ('20090006', 'Suwandi', TRUE, '', '1989-05-15', 'PS'),
       ('20090007', 'Siti Aminah', FALSE, '', '1985-09-01', 'AK'),
       ('20090008', 'Victor Sumardi', TRUE, '', '1976-03-03', 'SD'),
       ('20090009', 'Jaja Miharja', TRUE, 'T', '1974-07-23', 'EN'),
       ('20090010', 'Tarmidzi', TRUE, '', '1981-05-21', 'PS'),
       ('20090011', 'Novia Fitriana', FALSE, '', '1982-08-19', 'AK');

SELECT * FROM karyawan;

ALTER TABLE karyawan
MODIFY COLUMN jenis_karyawan CHAR(1) NOT NULL DEFAULT '*'
AFTER jenis_kelamin;

INSERT manajer
VALUES ('20050001', 'AVANZA G', 'AB1674GA', 'PS'),
       ('20050002', 'AVANZA G', 'AB1675GA', 'SD'),
       ('20050003', 'RUSH G', 'AB6776BA', 'SD'),
       ('20060003', 'RUSH G', 'AB7374SA', 'EN'),
       ('20080003', 'BALENO', 'AB1111TA', 'RD');

SELECT * FROM manajer;

INSERT INTO sekretaris
VALUES ('20060001', 'Inggris'),
       ('20060001', 'Mandaris'),
       ('20080002', 'Inggris'),
       ('20090004', 'Inggris'),
       ('20090004', 'Jerman');

SELECT * FROM sekretaris;

INSERT INTO teknisi
VALUES ('20050004', 'Hardware'),
       ('20050004', 'Jaringan Komputer'),
       ('20080004', 'Jaringan Komputer'),
       ('20080004', 'Linux'),
       ('20090002', 'MySQL'),
       ('20090002', 'Pemograman C'),
       ('20090002', 'PHP'),
       ('20090002', 'SQL Server'),
       ('20090009', 'ASP'),
       ('20090009', 'Foxpro'),
       ('20090009', 'Jaringan Komputer');

INSERT INTO teknisi_proyek
VALUES ('20050004', 3, '2019/03/12', '2019/04/10'),
       ('20050004', 4, '2019/04/20', null),
       ('20050004', 5, '2019/06/01', '2019/07/01'),
       ('20050004', 6, '2019/08/10', '2019/08/25'),
       ('20080004', 4, '2019/04/27', null),
       ('20080004', 5, '2019/06/01', '2019/06/15'),
       ('20080004', 7, '2019/10/10', '2019/10/15'),
       ('20080004', 8, '2019/11/15', null),
       ('20090002', 1, '2019/02/01', null),
       ('20090002', 2, '2019/02/01', null),
       ('20090009', 1, '2019/02/01', null),
       ('20090009', 2, '2019/02/01', null),
       ('20090009', 8, '2019/11/15', '2019/11/25');

SELECT * FROM teknisi_proyek;


SELECT * FROM teknisi_proyek;

DELETE FROM teknisi_proyek
WHERE no_karyawan = 20050004;