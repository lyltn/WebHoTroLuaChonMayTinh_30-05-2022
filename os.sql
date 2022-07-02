-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 17, 2022 lúc 06:10 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `os`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mail`
--

CREATE TABLE `mail` (
  `stt` int(11) NOT NULL,
  `ten` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `chude` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `mail` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `noidung` varchar(1000) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `mail`
--

INSERT INTO `mail` (`stt`, `ten`, `chude`, `mail`, `noidung`) VALUES
(1, 'LYLY', 'khuyên', 'ngocly27112003@gmail.com', 'cập nhật lại web sớm với ạ'),
(8, 'Hiền', 'Korea', 'hienntt.21it@vku.udn.vn', 'A lô ,\r\nMy name is Thiên Hành'),
(9, 'ZLinh', 'Câu hỏi', 'llinh1413@gmail.com', 'Em muốn mua máy tính để học thiết kế web thì nên chọn loại máy nào là phù hợp nhất ạ '),
(10, 'Hoàng', 'câu hỏi', 'linhln.21it@vku.udn.vn', 'Dưới 20 triệu có mua được laptop gaming không?');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nd`
--

CREATE TABLE `nd` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `pass` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Đang đổ dữ liệu cho bảng `nd`
--

INSERT INTO `nd` (`name`, `pass`) VALUES
('ngocly', '1234'),
('nhatlinh', '9876');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `nd`
--
ALTER TABLE `nd`
  ADD PRIMARY KEY (`name`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `mail`
--
ALTER TABLE `mail`
  MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
