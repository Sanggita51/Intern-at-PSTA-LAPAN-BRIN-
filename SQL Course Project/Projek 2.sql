use penjualan;
create table tr_penjualan_1(
	kode_transaksi varchar (20) not null,
    kode_pelanggan varchar (20) not null,
    no_urut varchar (20) not null,
    kode_produk varchar (20) not null,
    nama_produk varchar (50) not null,
    qty varchar (20) not null,
    harga varchar (20) not null,
    total varchar (20) not null
); 

insert into tr_penjualan_1 (kode_transaksi, kode_pelanggan, no_urut, kode_produk, nama_produk, qty, harga, total) values
('tr-001','dqlabcust07','1','prod-01','Kotak Pensil DQLab','5','62500','312500'),
('tr-001','dqlabcust07','2','prod-03','Flash disk DQLab 32 GB','1','100000','100000'),
('tr-001','dqlabcust07','3','prod-09','Buku Planner Agenda DQLab','3','92000','276000'),
('tr-001','dqlabcust07','4','prod-04','Flash disk DQLab 32 GB','3','40000','120000'),
('tr-002','dqlabcust01','1','prod-03','Gift Voucher DQLab 100rb','2','100000','200000'),
('tr-002','dqlabcust01','2','prod-10','Sticky Notes DQLab 500 sheets','4','55000','220000'),
('tr-002','dqlabcust01','3','prod-07','Tas Travel Organizer DQLab','1','48000','48000'),
('tr-003','dqlabcust03','1','prod-02','Flash disk DQLab 64 GB','2','55000','110000'),
('tr-004','dqlabcust03','1','prod-10','Sticky Notes DQLab 500 sheets','5','55000','275000'),
('tr-004','dqlabcust03','2','prod-04','Flash disk DQLab 32 GB','4','40000','160000'),
('tr-005','dqlabcust05','1','prod-09','Buku Planner Agenda DQLab','3','92000','276000'),
('tr-005','dqlabcust05','2','prod-01','Kotak Pensil DQLab','1','62500','62500'),
('tr-005','dqlabcust05','3','prod-04','Flash disk DQLab 32 GB','2','40000','80000'),
('tr-006','dqlabcust02','1','prod-05','Gift Voucher DQLab 100rb','4','250000','1000000'),
('tr-006','dqlabcust02','2','prod-08','Gantungan Kunci DQLab','2','15800','31600');

select * from tr_penjualan_1;

-- 1. Total jumlah seluruh penjualan (total/revenue).
SELECT SUM(total) as total FROM tr_penjualan_1;
-- 2. Total quantity seluruh produk yang terjual.
SELECT SUM(qty) as qty FROM tr_penjualan_1;
-- 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT kode_produk, sum(qty) as qty, sum(total) as total FROM tr_penjualan_1
GROUP BY kode_produk;
-- 4. Rata - Rata total belanja per kode pelanggan.
SELECT kode_pelanggan, AVG(total) as avg_total FROM tr_penjualan_1
GROUP BY kode_pelanggan;
-- 5. Selain itu,  jangan lupa untuk menambahkan kolom baru dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K.
SELECT kode_transaksi,kode_pelanggan,no_urut,kode_produk, nama_produk, qty, total,
CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'  
    ELSE 'Medium'  
END as kategori 
FROM tr_penjualan_1;
