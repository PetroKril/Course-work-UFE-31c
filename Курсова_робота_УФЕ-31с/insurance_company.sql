-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Трв 23 2020 р., 18:29
-- Версія сервера: 10.3.13-MariaDB-log
-- Версія PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `insurance_company`
--

DELIMITER $$
--
-- Процедури
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `available_types` ()  NO SQL
SELECT type_name FROM insurance_type WHERE available = 'yes'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insurance_premium500` ()  NO SQL
SELECT firstname_insured_person, lastname_insured_person FROM contract WHERE insurance_premium = 500$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `location_phone_lvivbrok` ()  NO SQL
SELECT location, phone FROM branch WHERE branch_name LIKE '%Lviv Brok%'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `min_insurance_premium` ()  NO SQL
SELECT firstname_insured_person, lastname_insured_person FROM contract WHERE insurance_premium =(SELECT MIN(insurance_premium))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validity_period` ()  NO SQL
SELECT validity_period FROM contract GROUP BY validity_period$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблиці `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(10) NOT NULL,
  `branch_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(10) NOT NULL,
  `agent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `location`, `phone`, `agent_id`) VALUES
(1, 'Uzhhorod Brok', 'Uzhhorod, Visochana Vul., bld. 35, appt. 3', 75133018, 1000),
(2, 'Kyiv Brok', 'Kyiv, Krasnogvardeyskaya Ul., bld. 27/А', 17458925, 1111),
(3, 'Kharkiv Brok', 'Kharkiv, Stelmakha M. Ul., bld. 3, appt. 33', 71859637, 2222),
(4, 'Lviv Brok', 'Lviv, CHekhoslovatskaya Ul., bld. 12', 85144568, 3333),
(5, 'Cherkasy Brok', 'Cherkasy,Lyuteranskaya Ul., bld. 30, appt. 17', 78167166, 4444),
(6, 'Zaporizhzhia Brok', 'Zaporizhzhia,Fastovskaya Ul., bld. 28/2, appt. 55', 17487576, 5555),
(7, 'Dnipro Brok', 'Dnipro,Griboedova Ul., bld. 36, appt. 176', 85481785, 6666),
(8, 'Vinnytsia Brok', 'Vinnytsia, Tobіlevicha, bld. 24', 14682587, 7777),
(9, 'Odessa Brok', 'Odessa,Ilicha Pr., bld. 25, appt. 53', 13854785, 8888),
(10, 'Ternopil Brok', 'Uzhhorod,Kropivnitskogo Ul., bld. 77, appt. 29', 14078585, 9999);

-- --------------------------------------------------------

--
-- Структура таблиці `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `firstname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(20) NOT NULL,
  `city` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `client`
--

INSERT INTO `client` (`client_id`, `firstname`, `lastname`, `phone`, `city`, `contract_id`) VALUES
(111, 'Mykhailo', 'Kravchenko', 77857, 'Uzhhorod', 1),
(222, 'Anton', 'Kravchuk', 67867, 'Kyiv', 2),
(333, 'Inna', 'Tarashchuk', 27862, 'Kharkiv', 3),
(444, 'Timothy', 'Dmitrenko', 4446456, 'Lviv', 4),
(555, 'Ivan', 'Sergienko', 5171175, 'Cherkasy', 5),
(666, 'Joseph', 'Tarashchuk', 645656, 'Zaporizhzhia', 6),
(777, 'Vsevolod', 'Ponomarenko', 65465, 'Dnipro', 7),
(888, 'Adam', 'Ponomarchuk', 6786554, 'Vinnytsia', 8),
(999, 'Maxim', 'Antonenko', 5678667, 'Odessa', 9),
(1212, 'Volodymyr', 'Shevchenko', 1645454, 'Ternopil', 10);

-- --------------------------------------------------------

--
-- Структура таблиці `contract`
--

CREATE TABLE `contract` (
  `contract_id` int(10) NOT NULL,
  `start_date` date NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `contract`
--

INSERT INTO `contract` (`contract_id`, `start_date`, `name`, `client_id`, `type_id`, `agent_id`) VALUES
(19, '2021-08-20', 'Protection for every day', 1212, 158, 1000),
(23, '2021-05-29', 'Protection for every day', 111, 174, 1111),
(26, '2021-09-08', 'Protection for every day', 222, 158, 2222),
(27, '2020-12-17', 'Protection for every day', 333, 507, 3333),
(34, '2021-03-31', 'Protection for every day', 444, 507, 4444),
(39, '2020-12-15', 'Protection for every day', 555, 158, 5555),
(42, '2021-07-09', 'Protection for every day', 666, 507, 6666),
(44, '2021-06-17', 'Protection for every day', 777, 158, 7777),
(45, '2021-05-20', 'Protection for every day', 888, 507, 8888),
(54, '2020-12-01', 'Protection for every day', 999, 174, 9999);

-- --------------------------------------------------------

--
-- Структура таблиці `insurance_agent`
--

CREATE TABLE `insurance_agent` (
  `agent_id` int(11) NOT NULL,
  `agent_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `insurance_agent`
--

INSERT INTO `insurance_agent` (`agent_id`, `agent_name`, `branch_id`) VALUES
(1000, 'Mikhail Kravchuk', 7),
(1111, 'Miroshnychenko Hryhoriy ', 8),
(2222, 'Tarashchuk Valeria', 9),
(3333, 'Vladimir Romanchenko', 10),
(4444, 'Vitaly Kravchuk', 1),
(5555, 'Anna Zakharchuk', 2),
(6666, 'Maria Dmitrenko', 3),
(7777, 'Nikita Ponomarenko', 4),
(8888, 'Andrinan Kril', 5),
(9999, 'Igor Sereda', 6);

-- --------------------------------------------------------

--
-- Структура таблиці `insurance_type`
--

CREATE TABLE `insurance_type` (
  `type_id` int(10) NOT NULL,
  `available` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `insurance_premium` int(10) NOT NULL,
  `insurance_payment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `insurance_type`
--

INSERT INTO `insurance_type` (`type_id`, `available`, `type_name`, `insurance_premium`, `insurance_payment`) VALUES
(158, 'yes', 'Life insurance', 400, 20000),
(174, 'yes', 'Animal insurance', 300, 10000),
(453, 'no', 'Life insurance of landowners', 350, 15000),
(457, 'no', 'Fire insurance', 450, 18000),
(507, 'yes', 'Transport insurance', 500, 30000),
(728, 'no', 'Workers\' insurance', 250, 25000),
(978, 'no', 'Hail insurance', 150, 11000);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Індекси таблиці `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`);

--
-- Індекси таблиці `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `contract_id` (`contract_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Індекси таблиці `insurance_agent`
--
ALTER TABLE `insurance_agent`
  ADD PRIMARY KEY (`agent_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Індекси таблиці `insurance_type`
--
ALTER TABLE `insurance_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `insurance_agent` (`agent_id`) ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `insurance_agent` (`agent_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `insurance_type` (`type_id`) ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `insurance_agent`
--
ALTER TABLE `insurance_agent`
  ADD CONSTRAINT `insurance_agent_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
