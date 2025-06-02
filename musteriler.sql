-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 01 Haz 2025, 07:52:23
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `musteriler`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri`
--

CREATE TABLE `musteri` (
  `musteriID` int(11) NOT NULL,
  `adi` varchar(100) NOT NULL,
  `soyadi` varchar(100) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `eposta` varchar(100) DEFAULT NULL,
  `adres` text DEFAULT NULL,
  `semt` varchar(100) DEFAULT NULL,
  `sehir` varchar(100) DEFAULT NULL,
  `puan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `musteri`
--

INSERT INTO `musteri` (`musteriID`, `adi`, `soyadi`, `telefon`, `eposta`, `adres`, `semt`, `sehir`, `puan`) VALUES
(3, 'Ali', 'Yılmaz', '05551234567', 'ali@example.com', 'Adres 1', 'Semt 1', 'İstanbul', 10),
(4, 'Ayşe', 'Demir', '05559876543', 'ayse@example.com', 'Adres 2', 'Semt 2', 'Ankara', 15),
(5, 'Eren', 'Demir', '05519522967', 'eren@gmail.com', 'Atatürk Mahallesi', 'Esenyurt', 'İstanbul', 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis`
--

CREATE TABLE `siparis` (
  `siparisID` int(11) NOT NULL,
  `musteriID` int(11) NOT NULL,
  `urunID` int(11) NOT NULL,
  `adet` int(11) NOT NULL,
  `fiyat` decimal(10,2) NOT NULL,
  `toplam` decimal(10,2) NOT NULL,
  `tarih` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `siparis`
--

INSERT INTO `siparis` (`siparisID`, `musteriID`, `urunID`, `adet`, `fiyat`, `toplam`, `tarih`) VALUES
(8, 3, 2, 2, 1222.00, 2444.00, '2025-06-01'),
(9, 3, 2, 2, 1222.00, 2444.00, '2025-06-01'),
(10, 5, 5, 3, 1231312.00, 3693936.00, '2025-06-02');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun`
--

CREATE TABLE `urun` (
  `urunID` int(11) NOT NULL,
  `urunAdi` varchar(255) NOT NULL,
  `fiyat` decimal(10,2) NOT NULL,
  `aciklama` text DEFAULT NULL,
  `resim` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `urun`
--

INSERT INTO `urun` (`urunID`, `urunAdi`, `fiyat`, `aciklama`, `resim`) VALUES
(2, 'Margaritta', 1222.00, '', '683be940ec45f_IMG_0364.png'),
(3, 'Kalem', 5.00, 'Mavi kalem', 'kalem.png'),
(4, 'Defter', 20.00, 'A5 boy defter', 'defter.png'),
(5, 'Margaritta', 1231312.00, '1231', '683be9d64a4f9_IMG_0364.png');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `musteri`
--
ALTER TABLE `musteri`
  ADD PRIMARY KEY (`musteriID`);

--
-- Tablo için indeksler `siparis`
--
ALTER TABLE `siparis`
  ADD PRIMARY KEY (`siparisID`),
  ADD KEY `musteriID` (`musteriID`),
  ADD KEY `urunID` (`urunID`);

--
-- Tablo için indeksler `urun`
--
ALTER TABLE `urun`
  ADD PRIMARY KEY (`urunID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `musteri`
--
ALTER TABLE `musteri`
  MODIFY `musteriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `siparis`
--
ALTER TABLE `siparis`
  MODIFY `siparisID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `urun`
--
ALTER TABLE `urun`
  MODIFY `urunID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `siparis`
--
ALTER TABLE `siparis`
  ADD CONSTRAINT `siparis_ibfk_1` FOREIGN KEY (`musteriID`) REFERENCES `musteri` (`musteriID`) ON DELETE CASCADE,
  ADD CONSTRAINT `siparis_ibfk_2` FOREIGN KEY (`urunID`) REFERENCES `urun` (`urunID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
