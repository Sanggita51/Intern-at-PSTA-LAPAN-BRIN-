use penjualan;

create table ms_pelanggan(
	no_urut varchar (20) not null,
    kode_pelanggan varchar (20) not null,
    nama_customer varchar (50) not null,
    alamat varchar (100) not null
); 

insert into ms_pelanggan (no_urut, kode_pelanggan, nama_customer, alamat) values
('1','dqlabcust01','Eva Novianti, S.H.','Vila Sempilan, No. 67 - Kota B'),
('2','dqlabcust02','Heidi Goh','Vila Sempilan, No. 11 - Kota B'),
('3','dqlabcust03','Unang Handoko','Vila Sempilan, No. 1 - Kota B'),
('4','dqlabcust04','Jokolono Sukarman','Vila Permata Intan Berkilau, Blok C5-7'),
('5','dqlabcust05','Tommy Sinaga','Vila Permata Intan Berkilau, Blok A1/2'),
('6','dqlabcust06','Irwan Setianto','Vila Gunung Seribu, Blok O1 - No. 1'),
('7','dqlabcust07','Agus Cahyono','Vila Gunung Seribu, Blok F4 - No. 8'),
('8','dqlabcust08','Maria Sirait','Vila Bukit Sagitarius, Gang. Sawit No.3'),
('9','dqlabcust09','Ir. Ita Nugraha','Vila Bukit Sagitarius, Gang Kelapa No.6'),
('10','dqlabcust10','Djoko Wardoyo, Drs.','Vila Bukit Sagitarius, Blok A1 No. 1'),
('11','dqlabcust11','Unang Handoko','Vila Sempilan, No. 1 - Kota B'),
('12','dqlabcust12','Tommy Sinaga','Vila Permata Intan Berkilau, Blok A1/2');
 select * FROM ms_pelanggan;
 
-- Projek Inner Join 
SELECT DISTINCT
Ms_pelanggan.kode_pelanggan,
Ms_pelanggan.nama_customer,
Ms_pelanggan.alamat FROM ms_pelanggan
INNER JOIN tr_penjualan
ON ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
WHERE tr_penjualan.nama_produk = 'Kotak Pensil DQLab' or 
tr_penjualan.nama_produk = 'Flashdisk DQLab 32 GB' or 
tr_penjualan.nama_produk = 'Sticky Notes DQLab 500 sheets' ;

-- Projek Union
create table ms_produk_1(
	no_urut varchar (20) not null,
    kode_produk varchar (20) not null,
    nama_produk varchar (50) not null,
    harga varchar (20) not null
); 

insert into ms_produk_1 (no_urut, kode_produk, nama_produk, harga) values
('1','prod-01','Kotak Pensil DQLab','62500'),
('2','prod-02','Flashdisk DQLab 64 GB','55000'),
('3','prod-03','Gift Voucher DQLab 100rb','100000'),
('4','prod-04','Flashdisk DQLab 32 GB','40000'),
('5','prod-05','Gift Voucher DQLab 250rb','250000');

create table ms_produk_2(
	no_urut varchar (20) not null,
    kode_produk varchar (20) not null,
    nama_produk varchar (50) not null,
    harga varchar (20) not null
); 

insert into ms_produk_2 (no_urut, kode_produk, nama_produk, harga) values
('6','prod-06','Pulpen Multidfunction + Laser DQLab','92500'),
('7','prod-07','Tas Travel Organizer DQLab','48000'),
('8','prod-08','Gantungan Kunci DQLab','15800'),
('9','prod-09','Buku Planner Agenda DQLab','92000'),
('10','prod-10','Sticky Notes DQLab 500 sheets','55000');

SELECT nama_produk, kode_produk,harga FROM ms_produk_1
WHERE harga <100000
UNION
SELECT nama_produk, kode_produk, harga FROM ms_produk_2
WHERE harga <50000;