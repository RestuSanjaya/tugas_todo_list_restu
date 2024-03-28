-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2024 pada 12.33
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `todo`
--

CREATE TABLE `todo` (
  `id_todo` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `deadline` date NOT NULL,
  `status` enum('belum','selesai','telat') NOT NULL,
  `id_goal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `todo`
--

INSERT INTO `todo` (`id_todo`, `title`, `deadline`, `status`, `id_goal`) VALUES
(37, 'Belajar OOP di WPU', '2022-09-08', 'belum', 23),
(38, 'Lari 100 putaran', '2022-09-08', 'selesai', 23),
(39, 'aaaaa', '2022-09-08', 'telat', 23),
(40, 'Menambahkan Fitur Todo', '2022-09-30', 'belum', 25),
(41, 'ke bandara', '2024-03-07', 'belum', 27);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto_profil` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `name`, `username`, `email`, `password`, `foto_profil`) VALUES
(10, 'user', 'user', 'user@mail.com', '$2y$10$rb7kS5Cf/BsHUlnDnHKwD.LexlwCEyVqUtbPf5KXkb89gDGwhCulu', '631f2bd33535d.png'),
(20, 'user', 'restu', 'restusanjaya7110@gmail.com', '$2y$10$QZnyGfTuIkA4Kd4YBBoFkOYKxVuKIs.YJ9Fnkq0hzVU.QbhHnRGFq', '66054f36d11ee.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `workspace`
--

CREATE TABLE `workspace` (
  `id_goal` int(11) NOT NULL,
  `nm_goal` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `workspace`
--

INSERT INTO `workspace` (`id_goal`, `nm_goal`, `deskripsi`, `id_user`) VALUES
(23, 'Belajar OOP', 'OOP PHP', 10),
(25, 'Push Rank Mythic', 'gggg', 10),
(27, 'perjalanan ', 'menuju ke bandara untuk berangkat ke jakarta', 20);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id_todo`),
  ADD KEY `id_goal` (`id_goal`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `workspace`
--
ALTER TABLE `workspace`
  ADD PRIMARY KEY (`id_goal`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `todo`
--
ALTER TABLE `todo`
  MODIFY `id_todo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `workspace`
--
ALTER TABLE `workspace`
  MODIFY `id_goal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`id_goal`) REFERENCES `workspace` (`id_goal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `workspace`
--
ALTER TABLE `workspace`
  ADD CONSTRAINT `workspace_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
