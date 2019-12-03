-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2019 at 05:51 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan_sepeda_motor`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_delivery`
--

CREATE TABLE `tb_delivery` (
  `id_delivery` int(11) NOT NULL,
  `id_transaksi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(64) NOT NULL,
  `jenis_produk` enum('Matic','Sport','Bebek','Big Bike') NOT NULL,
  `stok_produk` enum('Tersedia','Tidak Tersedia') NOT NULL DEFAULT 'Tidak Tersedia',
  `harga_produk` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `nama_produk`, `jenis_produk`, `stok_produk`, `harga_produk`) VALUES
(1, 'Yamaha Nmax ABS', 'Matic', 'Tersedia', '31750000'),
(2, 'Yamaha Aerox Tipe S', 'Matic', 'Tersedia', '27600000'),
(3, 'Yamaha R15 V3', 'Sport', 'Tersedia', '32559000'),
(4, 'Yamaha R6', 'Big Bike', 'Tersedia', '366799000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `no_transaksi` varchar(30) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `total_harga` varchar(11) NOT NULL,
  `status` enum('Menunggu Pembayaran','Pengiriman Barang') NOT NULL DEFAULT 'Menunggu Pembayaran'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `id_produk`, `id_user`, `no_transaksi`, `alamat`, `total_harga`, `status`) VALUES
(1, 3, 2, 'PSM20191113001', 'Komplek Sukasari Indah No 58 RT 02/07 Desa Langonsari Kecamatan Pameungpeuk', '32559000', 'Pengiriman Barang'),
(2, 3, 4, 'PSM20191113002', 'Denpasar, Bali', '32559000', 'Pengiriman Barang');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `password` varchar(256) NOT NULL,
  `NIP` varchar(64) NOT NULL,
  `NIK` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `role` enum('Admin','Pegawai','Member') NOT NULL DEFAULT 'Member',
  `kontak` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama`, `password`, `NIP`, `NIK`, `email`, `role`, `kontak`) VALUES
(1, 'Muhammad Irfan Sugiharto', '$2y$10$v.Zi58Ucry6knGCLg/m3ZOjexNfqZpf7y3M9bDtYDy3Sv.ui57gVq', '1301154188', '', 'mirfansugiharto1@gmail.com', 'Admin', '081222145399'),
(2, 'Rizky Hidayatullah', '$2y$10$Nto6l0qlGxuGjtdcadEEDee3y6aY3KAEVY9XiYZlw9HoBQycJl5be', '', '', 'kujeng123@gmail.com', 'Member', ''),
(3, 'Ibrahim Bimo', '$2y$10$RduD1PZatOPoIh5Ba9cpvezASyL/x/EV1JcEwCq/cixEsNtZuoV0m', '1301154193', '', 'ibrahimbimo11@gmail.com', 'Pegawai', '081225904118'),
(4, 'Agus Maulana', '$2y$10$SZFUahs0g5pfu/Vsdp/tduVrrWRC9O.g.GuK6MxXqERVOu5jbjSOG', '', '100294859382', 'Agus@gmail.com', 'Member', ''),
(5, 'Aji Saepuloh', '$2y$10$x7qBJAbvTcKORnBlBkH4YOx.QjoGZZ14Co0FncVK/v3o1.OyLwClK', '1301154223', '', 'ajisaepuloh@gmail.com', 'Pegawai', '08122343451');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_delivery`
--
ALTER TABLE `tb_delivery`
  ADD PRIMARY KEY (`id_delivery`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_delivery`
--
ALTER TABLE `tb_delivery`
  MODIFY `id_delivery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
