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

ALTER TABLE departemen
    MODIFY COLUMN nama_dep CHAR (10);

SELECT * FROM departemen;

INSERT INTO karyawan
VALUES ('20050001', 'Rusdianto', TRUE, '1975-03-24', 'PS');


