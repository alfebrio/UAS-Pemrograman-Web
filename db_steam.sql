-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jan 2025 pada 15.30
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_steam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bundles`
--

CREATE TABLE `bundles` (
  `id` int(11) NOT NULL,
  `franchise_name` varchar(255) NOT NULL,
  `bundle_name` varchar(255) NOT NULL,
  `games` varchar(255) NOT NULL,
  `bundle_price` decimal(10,2) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bundles`
--

INSERT INTO `bundles` (`id`, `franchise_name`, `bundle_name`, `games`, `bundle_price`, `start`, `end`) VALUES
(1, 'Grand Theft Auto', 'GTA The Trilogy: Definitive Edition', 'Grand Theft Auto III, Grand Theft Auto: Vice City, Grand Theft Auto: San Andreas', 260000.00, '2025-02-19', '2026-01-02'),
(2, 'The Witcher', 'The Witcher Trilogy', 'The Witcher 1: Enhanced Edition,  The Witcher 2: Assassins of Kings,  The Witcher 3: Wild Hunt', 75000.00, '2025-06-26', '2025-07-10'),
(3, 'LEGO Batman', 'LEGO Batman Trilogy', 'LEGO Batman 1: The Videogame,   LEGO Batman 2: DC Super Heroes,   LEGO Batman 3: Beyond Gotham', 35000.00, '2025-11-22', '2025-11-28'),
(4, 'Resident Evil', 'Resident Evil Remake Trilogy', 'Resident Evil 2 Remake,   Resident Evil 3 Remake,   Resident Evil 4 Remake', 610000.00, '2025-11-22', '2025-11-28'),
(5, 'Resident Evil ', 'Resident Evil VII & VIII', 'Resident Evil 7: Biohazard,  Resident Evil 8: Village', 335000.00, '2025-11-22', '2025-11-28'),
(6, 'Dying Light', 'Dying Light True Survivor', 'Dying Light 1: Enhanced Edition, Dying Light 2: Stay Human', 365000.00, '2025-12-19', '2026-01-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `game` varchar(255) NOT NULL,
  `highest_discount` varchar(255) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `discount_price` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `game`, `highest_discount`, `start`, `end`, `discount_price`) VALUES
(1, 'Grand Theft Auto V', 'Summer Sale', '2025-06-26', '2025-07-10', 95000.00),
(2, 'Palworld', 'Autumn Sale', '2025-11-22', '2025-11-28', 185000.00),
(3, 'Stardew Valley', 'Fest Sale', '2025-10-07', '2025-10-14', 60000.00),
(4, 'Cyberpunk 2077', 'Winter Sale', '2025-12-19', '2026-01-02', 315000.00),
(5, 'Red Dead Redemption 2', 'Summer Sale', '2025-06-26', '2025-07-10', 215000.00),
(6, 'Monster Hunter: World', 'Winter Sale', '2025-12-19', '2026-01-02', 110000.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bundles`
--
ALTER TABLE `bundles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bundles`
--
ALTER TABLE `bundles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
