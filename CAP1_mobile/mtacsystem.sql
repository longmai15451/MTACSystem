-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2021 at 02:59 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mtacsystem`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Anamnesis_update` (IN `id` INT(10), IN `idcard` VARCHAR(12) CHARSET utf8, IN `a1` BIT(1), IN `a2` BIT(1), IN `a3` BIT(1), IN `a4` BIT(1), IN `a5` BIT(1), IN `a6` BIT(1), IN `a7` BIT(1), IN `a8` BIT(1), IN `a9` BIT(1), IN `a10` BIT(1))  NO SQL
BEGIN
set id = (SELECT anamnesisID from patients WHERE id_card = idcard);
if (id = 0) THEN
BEGIN    
   INSERT INTO anamnesis 
   VALUES(Null,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10);
   Update patients 
   SET anamnesisID = (SELECT LAST_INSERT_ID())
   WHERE id_card = idcard;
END;
ELSE
UPDATE anamnesis set anamnesis1 = a1, anamnesis2 = a2, anamnesis3 = a3, anamnesis4 = a4, anamnesis5 = a5, anamnesis6 = a6, anamnesis7 = a7, anamnesis8 = a8, anamnesis9 = a9, anamnesis10 = a10 WHERE anamnesisID = id;
end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkAvailibleTestRegis` (IN `id_hos` INT(255))  select * from time_web_moblie WHERE time_web_moblie.id_hos = id_hos and type = 1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkAvailibleVacRegis` (IN `id_hos` INT(11))  select * from time_web_moblie WHERE time_web_moblie.id_hos = id_hos and type = 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `disease_data` ()  NO SQL
SELECT * from diseases$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_patients_data` (IN `phone` CHAR(255) CHARSET utf8, IN `pass` VARCHAR(255) CHARSET utf8)  READS SQL DATA
SELECT patients.*, anamnesis.anamnesis1,anamnesis.anamnesis2,anamnesis.anamnesis3,anamnesis.anamnesis4,anamnesis.anamnesis5,anamnesis.anamnesis6,anamnesis.anamnesis7,anamnesis.anamnesis8,anamnesis.anamnesis9,anamnesis.anamnesis10
FROM patients, anamnesis
WHERE anamnesis.anamnesisID=patients.anamnesisID and patients.phone like phone and patients.password like pass$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hospital_data` ()  NO SQL
SELECT h.id, h.name, h.phone, h.address from hospitals as h$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Searchvaccine` ()  select v.id,v.name,v.country,v.description, v.age_use_from,v.age_use_to,d.name as `disease_name`, d.symptom from vaccines as v, diseases as d WHERE d.id = v.id_disease$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `testhistory` (IN `id_card` VARCHAR(12) CHARSET utf8)  SELECT tp.id as `regisID`,'Lịch xét nghiệm' as `title`,'Địa chỉ xét nghiệm: ' as `note`,h.address as `address`, tp.date as `registerDate`, tp.registerTime, '0' as `type` from test_patient as tp, hospitals as h WHERE h.id = tp.id_hos and tp.id_card = idCard and tp.wait_at = '1'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `testRegisInfo` (IN `regisID` INT(12))  NO SQL
SELECT p.fullname, p.phone, p.id_card, h.name as `hos_name`, tp.date as `registerDate`, tp.registerTime, h.address as `hos_address`
FROM patients as p, hospitals as h, test_patient as tp
WHERE p.id_card = tp.id_card and h.id = tp.id_hos and  tp.id = regisID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test_register` (IN `id_card` VARCHAR(12) CHARSET utf8, IN `id_hosp` INT(11), IN `registerDate` DATE, IN `registerTimed` TIME(6), IN `startTime` TIME(6), IN `endTime` TIME(6))  MODIFIES SQL DATA
BEGIN
Set @count = (SELECT Count(*) from test_patient WHERE test_patient.id_hos = id_hosp and test_patient.date = registerDate and test_patient.wait_at = 0);
if registerTimed < startTime and registerDate = CURRENT_DATE() THEN
set registerTimed = startTime;
end if;
if @count >0 THEN
BEGIN
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = 0 and test_patient.date = registerDate and registerTime BETWEEN startTime AND endTime and id_hos = id_hosp and registerTime <= registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = 0 and test_patient.date = registerDate and registerTime BETWEEN startTime AND endTime and id_hos = id_hosp and registerTime >= registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET registerTimed = addtime(registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET registerTimed = addtime(registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,registerTimed) >= @defaultTime and subtime(registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET registerTimed = addtime(registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET registerTimed = addtime(registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
 INSERT INTO `test_patient` VALUES(null,id_card,id_hosp,registerDate,null,'0',CURRENT_DATE(),registerTimed,2,null,null,null);
END;
ELSE
INSERT INTO `test_patient` VALUES(null,id_card,id_hosp,registerDate,null,'0',CURRENT_DATE(),registerTimed,2,null,null,null);
end if;
SELECT  registerDate, registerTimed,h.address as `address` from hospitals as h WHERE h.id = id_hosp;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test_regis_schedule` (IN `idCard` VARCHAR(12) CHARSET utf8, IN `registerDate` DATE)  NO SQL
SELECT tp.id as `regisID`,'Lịch xét nghiệm' as `title`,'Địa chỉ xét nghiệm: ' as `note`,h.address as `address`, tp.date as `registerDate`, tp.registerTime, '0' as `type` from test_patient as tp, hospitals as h WHERE h.id = tp.id_hos and tp.id_card = idCard and tp.date = registerDate and tp.wait_at = '0'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vaccineHistory` (IN `id_card` VARCHAR(12) CHARSET utf8)  SELECT vp.id as `regisID`,'Lịch tiêm vaccine' as `title`,'Địa chỉ tiêm: ' as `note`,h.address as `address`, vp.date as `registerDate`, vp.registerTime, '1' as `type` from vaccine_patients as vp, hospitals as h WHERE h.id = vp.id_hos and vp.id_card = idCard and vp.done_inject = '1'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vaccine_data` (IN `id_disease` INT(12))  NO SQL
SELECT v.id, v.name, v.country, v.description, v.age_use_from, v.age_use_to from vaccines as v where v.id_disease = id_disease$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vaccine_regis_schedule` (IN `idCard` VARCHAR(12) CHARSET utf8, IN `registerDate` DATE)  NO SQL
SELECT vp.id as `regisID`,'Lịch tiêm vaccine' as `title`,'Địa chỉ tiêm: ' as `note`,h.address as `address`, vp.date as `registerDate`, vp.registerTime, '1' as `type` from vaccine_patients as vp, hospitals as h WHERE h.id = vp.id_hos and vp.id_card = idCard and vp.date = registerDate and vp.done_inject = '0'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Vacc_register` (IN `id_card` VARCHAR(12) CHARSET utf8, IN `id_hosp` INT(11), IN `id_vac` INT(11), IN `registerDate` DATE, IN `registerTimed` TIME(6), IN `startTime` TIME(6), IN `endTime` TIME(6))  MODIFIES SQL DATA
BEGIN
set @count = (SELECT COUNT(*) FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = registerDate and registerTime BETWEEN startTime AND endTime and id_hos = id_hosp);
if registerTimed < startTime and registerDate = CURRENT_DATE() THEN
set registerTimed = startTime;
end if;
if @count > 0 THEN
BEGIN
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = registerDate and registerTime BETWEEN startTime AND endTime and id_hos = id_hosp and registerTime <= registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = registerDate and registerTime BETWEEN startTime AND endTime and id_hos = id_hosp and registerTime >= registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET registerTimed = addtime(registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET registerTimed = addtime(registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,registerTimed) >= @defaultTime and subtime(registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET registerTimed = addtime(registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET registerTimed = addtime(registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
 INSERT INTO vaccine_patients VALUES(null,id_card,id_hosp,id_vac,0,null,null,null,registerDate,CURRENT_DATE(),registerTimed,'0',null,null,null);
END;
ELSE
INSERT INTO vaccine_patients VALUES(null,id_card,id_hosp,id_vac,0,null,null,null,registerDate,CURRENT_DATE(),registerTimed,'0',null,null,null);
end if;
SELECT  registerDate, registerTimed,h.address as `address` from hospitals as h WHERE h.id = id_hosp;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vacDetail` ()  NO SQL
SELECT v.*,d.name,d.symptom from vaccines as v, diseases as d WHERE d.id = v.id_disease$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vacResgisInfo` (IN `regisID` INT(255))  READS SQL DATA
SELECT p.fullname, p.phone, p.id_card, h.name as `hos_name`, v.name as `vaccine_name`, vp.date as `registerDate`, vp.registerTime, h.address as `hos_address`
FROM patients as p, hospitals as h, vaccine_patients as vp, vaccines as v
WHERE p.id_card = vp.id_card and h.id = vp.id_hos and v.id = vp.id_vac and vp.id = regisID$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `anamnesis`
--

CREATE TABLE `anamnesis` (
  `anamnesisID` int(12) NOT NULL,
  `anamnesis1` bit(1) NOT NULL,
  `anamnesis2` bit(1) NOT NULL,
  `anamnesis3` bit(1) NOT NULL,
  `anamnesis4` bit(1) NOT NULL,
  `anamnesis5` bit(1) NOT NULL,
  `anamnesis6` bit(1) NOT NULL,
  `anamnesis7` bit(1) NOT NULL,
  `anamnesis8` bit(1) NOT NULL,
  `anamnesis9` bit(1) NOT NULL,
  `anamnesis10` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `anamnesis`
--

INSERT INTO `anamnesis` (`anamnesisID`, `anamnesis1`, `anamnesis2`, `anamnesis3`, `anamnesis4`, `anamnesis5`, `anamnesis6`, `anamnesis7`, `anamnesis8`, `anamnesis9`, `anamnesis10`) VALUES
(0, b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(2, b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symptom` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `name`, `symptom`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Cảm Cúm', 'ho sốt', NULL, '2021-12-02 14:30:27', NULL),
(10, 'covid 19', 'ho sốt nhiều', '2021-11-16 07:53:17', '2021-12-02 14:30:58', NULL),
(19, 'Sởi', 'ho sốt cao', '2021-11-20 02:29:23', '2021-11-20 02:29:23', NULL),
(22, 'hết tiền', '132', '2021-12-03 02:55:05', '2021-12-03 03:04:12', '2021-12-03 03:04:12'),
(23, 'hết tiền rồi', 'cháy túi', '2021-12-03 02:57:16', '2021-12-03 02:57:29', '2021-12-03 02:57:29'),
(24, 'hết tiền', 'cháy túi', '2021-12-03 02:57:38', '2021-12-03 03:04:17', '2021-12-03 03:04:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `address`, `phone`, `id_user`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'Bệnh Viện Nhi Đồng nè', 'Nghệ An nè', '1234567983', 2, NULL, '2021-11-26', '2021-11-29 02:31:06'),
(4, 'Bệnh Viện Quân Y 108', 'Nghệ An', '3214569874', 4, NULL, '2021-11-27', NULL),
(6, 'BỆNH VIỆN F', 'Đà Nẵng 2', NULL, 9, NULL, '2021-11-27', '2021-11-27 08:20:49'),
(7, 'gia đình 2', 'Đà Nẵng 2', NULL, 10, NULL, '2021-11-29', '2021-11-29 13:06:07'),
(8, 'hoàn mỹ vinh', 'Nghệ An', NULL, 11, NULL, '2021-11-29', '2021-11-29 13:07:23'),
(9, 'Hoàn Mỹ Hà Nội', 'Hà Nội', NULL, 12, NULL, '2021-11-29', '2021-11-29 13:08:00'),
(152, 'BV Bạc Liêu', 'Bạc Liêu', NULL, 562, NULL, '2021-11-29', '2021-11-29 14:43:31'),
(153, 'Bệnh Viện Quốc Tế', 'Đà Nẵng', '132465789', 563, NULL, '2021-11-30', '2021-11-30 06:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `limit_web_mobile`
--

CREATE TABLE `limit_web_mobile` (
  `id` int(10) NOT NULL,
  `id_hos` int(12) NOT NULL,
  `limit_test` int(10) DEFAULT NULL,
  `limit_vac` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `limit_web_mobile`
--

INSERT INTO `limit_web_mobile` (`id`, `id_hos`, `limit_test`, `limit_vac`, `created_at`, `updated_at`) VALUES
(1, 0, 10, 1000, NULL, '2021-12-01 02:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_11_13_110355_add_deletesoft_users_table', 2),
(5, '2021_11_13_110436_add_deletesoft_hospitals_table', 3),
(6, '2021_11_13_110452_add_deletesoft_patients_table', 3),
(7, '2021_11_15_090828_add_patients_table', 4),
(8, '2021_11_15_091004_add_hospitals_table', 5),
(13, '2021_11_15_152502_create_vaccine_patients_table', 6),
(14, '2021_11_16_084558_create_diseases_table', 7),
(15, '2021_11_16_085140_create_vaccine_hos_table', 8),
(16, '2021_11_16_103011_add_forenkey_to_a_table', 9),
(17, '2021_11_16_154412_add_forenkey_to_vaccine_hos_table', 10),
(18, '2021_11_16_164347_add_forenkey_to_vaccines_table', 11),
(19, '2021_11_19_091508_add_forenkey_to_vaccine_patients_table', 12),
(20, '2021_11_30_214626_add_update_to_limit_web_mobile', 13),
(21, '2021_12_02_211027_add_update_to_disease', 14);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('nhidong@gmail.com', '$2y$10$lwA.eWryAOwu9HJsjmD0Z.djf5IKx7K7w0t1Uvc8h3YkxUU98FuMi', '2021-11-28 13:52:40');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id_card` varchar(12) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `birthDate` date NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `health_card` varchar(12) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `job` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ward` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `district` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `nation` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `anamnesisID` int(12) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id_card`, `fullname`, `birthDate`, `gender`, `health_card`, `phone`, `email`, `job`, `address`, `ward`, `district`, `city`, `country`, `nation`, `password`, `avatar`, `anamnesisID`, `deleted_at`, `created_at`, `updated_at`) VALUES
('12', 'ac', '2000-12-12', 'male', '23123', '1', 'qav@gmaail', 'sdb', 'qưe', 'qưe', 'qưe', 'qưe', 'qưe', 'qưe', '1', '', 2, NULL, NULL, NULL),
('123', '231', '2021-12-04', 'male', '', '123', '', '', '', '', '', '', '', '', '123', '', 0, NULL, NULL, NULL),
('1234', 'LLG', '2021-12-04', 'male', '', '1234', '', '', '', '', '', '', '', '', '1', '', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_patient`
--

CREATE TABLE `test_patient` (
  `id` int(11) NOT NULL,
  `id_card` varchar(12) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `id_hos` int(11) NOT NULL,
  `date` date NOT NULL,
  `result` enum('1','0') COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `wait_at` enum('0','1') COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT '0',
  `registerDate` date DEFAULT NULL,
  `registerTime` time DEFAULT NULL,
  `id_disease` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Triggers `test_patient`
--
DELIMITER $$
CREATE TRIGGER `trigger_time_test` AFTER INSERT ON `test_patient` FOR EACH ROW begin
if (SELECT new.registerTime) BETWEEN cast('07:00:00' as time) and cast('09:00:00' as time) THEN
set @registerTimed = cast('07:00:00' as time);
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = '0' and test_patient.date = new.date and registerTime BETWEEN cast('07:00:00' as time) AND cast('09:00:00' as time) and id_hos = new.id_hos and registerTime <= @registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = '0' and test_patient.date = new.date and registerTime BETWEEN cast('07:00:00' as time) AND cast('09:00:00' as time) and id_hos = new.id_hos and registerTime >= @registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(@registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime and subtime(@registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET @registerTimed = addtime(@registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  if cast(@registerTimed as time) > cast('09:00:00' as time) then
  Update time_web_moblie set `7-9` = 0 where date = new.date and id_hos = new.id_hos and type = 1;
  end if;
elseif (SELECT new.registerTime) BETWEEN cast('09:00:00' as time) and cast('11:00:00' as time) THEN
set @registerTimed = cast('09:00:00' as time);
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = '0' and test_patient.date = new.date and registerTime BETWEEN cast('09:00:00' as time) AND cast('11:00:00' as time) and id_hos = new.id_hos and registerTime <= @registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = '0' and test_patient.date = new.date and registerTime BETWEEN cast('09:00:00' as time) AND cast('11:00:00' as time) and id_hos = new.id_hos and registerTime >= @registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(@registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime and subtime(@registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET @registerTimed = addtime(@registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  if cast(@registerTimed as time) > cast('11:00:00' as time) then
    Update time_web_moblie set `9-11` = 0 where date = new.date and id_hos = new.id_hos and type = 1;
    end if;
elseif (SELECT new.registerTime) BETWEEN cast('13:00:00' as time) and cast('15:00:00' as time) THEN
set @registerTimed = cast('13:00:00' as time);
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = '0' and test_patient.date = new.date and registerTime BETWEEN cast('13:00:00' as time) AND cast('15:00:00' as time) and id_hos = new.id_hos and registerTime <= @registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = '0' and test_patient.date = new.date and registerTime BETWEEN cast('13:00:00' as time) AND cast('15:00:00' as time) and id_hos = new.id_hos and registerTime >= @registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(@registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime and subtime(@registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET @registerTimed = addtime(@registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  if cast(@registerTimed as time) > cast('15:00:00' as time) then
  Update time_web_moblie set `13-15` = 0 where date = new.date and id_hos = new.id_hos and type = 1;
  end if;
elseif (SELECT new.registerTime) BETWEEN cast('15:00:00' as time) and cast('17:00:00' as time) THEN
set @registerTimed = cast('15:00:00' as time);
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = '0' and test_patient.date = new.date and registerTime BETWEEN cast('15:00:00' as time) AND cast('17:00:00' as time) and id_hos = new.id_hos and registerTime <= @registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = '0' and test_patient.date = new.date and registerTime BETWEEN cast('15:00:00' as time) AND cast('17:00:00' as time) and id_hos = new.id_hos and registerTime >= @registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(@registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime and subtime(@registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET @registerTimed = addtime(@registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  if cast(@registerTimed as time) > cast('17:00:00' as time) then
  Update time_web_moblie set `15-17` = 0 where date = new.date and id_hos = new.id_hos and type = 1;
  end if;
else
set @registerTimed = cast('17:00:00' as time);
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = '0' and test_patient.date = new.date and registerTime BETWEEN cast('17:00:00' as time) AND cast('19:00:00' as time) and id_hos = new.id_hos and registerTime <= @registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM test_patient WHERE test_patient.wait_at = '0' and test_patient.date = new.date and registerTime BETWEEN cast('17:00:00' as time) AND cast('19:00:00' as time) and id_hos = new.id_hos and registerTime >= @registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(@registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime and subtime(@registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET @registerTimed = addtime(@registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  if cast(@registerTimed as time) > cast('19:00:00' as time) then
  Update time_web_moblie set `17-19` = 0 where date = new.date and id_hos = new.id_hos and type = 1;
  end if;
end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `time_web_moblie`
--

CREATE TABLE `time_web_moblie` (
  `id` int(10) NOT NULL,
  `id_hos` int(12) NOT NULL,
  `7-9` bit(1) NOT NULL,
  `9-11` bit(1) NOT NULL,
  `13-15` bit(1) NOT NULL,
  `15-17` bit(1) NOT NULL,
  `17-19` bit(1) NOT NULL,
  `date` date DEFAULT NULL,
  `type` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `time_web_moblie`
--

INSERT INTO `time_web_moblie` (`id`, `id_hos`, `7-9`, `9-11`, `13-15`, `15-17`, `17-19`, `date`, `type`) VALUES
(1, 11, b'1', b'1', b'0', b'1', b'1', '2021-12-12', b'0'),
(23, 11, b'1', b'1', b'1', b'1', b'1', '2021-12-12', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('hospital','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'a@gmail.com', '$2y$10$coDDsmr2XJ1jIRMNpSNTeud3oklbBqnZS66Je/F2nYYg4bicRl2E6', 'hospital', 'dKdZ6wByALzcPoHrP35s30QqbTe0pEvQ4o1X93XkaEfbKL7bPdECD7DI8QNS', NULL, '2021-11-27 04:14:44', '2021-11-27 04:14:44'),
(2, 'giadinh@gmail.com', '$2y$10$6XxiA2XcAF8HhZjSZcZL7uUg3VYBrjU02iGn4T/fDZ7vBaYfPHava', 'hospital', 'IAaxaH8V2urCe4RHrNs0l60nDEBfkY1N22ComZvztuwNeDtZcsllpfKorkVi', NULL, '2021-11-28 13:54:43', NULL),
(4, 'quany@gmail.com', '$2y$10$Ueqa9nuaeefQL5eyaFLm/OgagUnnKGkx/QqWq4lFyPiUExxsHhUbu', 'hospital', NULL, NULL, NULL, NULL),
(5, 'admin', '$2y$10$lf4WQpTyBM0.2xn9IND0/u3HwOlsozw9gI8algkeadbHu5qphP2mW', 'admin', NULL, NULL, NULL, NULL),
(9, 'giadinhaaaa@gmail.com', '$2y$10$wz/yrf6A1z/8kjt6Yvi5tuGJl8Zi2XrSfUuD3REvqqTtyGTD95Qye', 'hospital', NULL, '2021-11-27', '2021-11-27 08:20:49', NULL),
(10, 'giadinh2@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-29 13:06:07', NULL),
(11, 'hoanmyvinh@gmail.com', '$2y$10$/DySfZdcHwdKanEJ3GBLueEWrpR1eG/A0xN2vWLUhTC.Q1f4QapmG', 'hospital', NULL, '2021-11-29', '2021-11-29 13:07:23', NULL),
(12, 'hoanmyhanoi@gmail.com', '$2y$10$SHgNICzD4Bv8QbBzYnU2VeUZ0XtvTjjPV7RFMY.yBtC4igcDpX.aG', 'hospital', NULL, '2021-11-29', '2021-11-29 13:08:00', NULL),
(371, 'giadinh3@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-01-29', '2021-01-28 17:00:00', NULL),
(372, 'giadinh4@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-01-29', '2021-01-28 17:00:00', NULL),
(373, 'giadinh5@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-01-29', '2021-01-28 17:00:00', NULL),
(374, 'giadinh6@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-01-29', '2021-01-28 17:00:00', NULL),
(375, 'giadinh7@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-01-29', '2021-01-28 17:00:00', NULL),
(376, 'giadinh8@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-01-29', '2021-01-28 17:00:00', NULL),
(377, 'giadinh9@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-01-29', '2021-01-28 17:00:00', NULL),
(378, 'giadinh10@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-01-29', '2021-01-28 17:00:00', NULL),
(379, 'giadinh11@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-02-09', '2021-02-08 17:00:00', NULL),
(380, 'giadinh12@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-02-09', '0000-00-00 00:00:00', NULL),
(381, 'giadinh13@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-02-09', '0000-00-00 00:00:00', NULL),
(382, 'giadinh14@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-02-09', '0000-00-00 00:00:00', NULL),
(383, 'giadinh15@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-02-09', '0000-00-00 00:00:00', NULL),
(384, 'giadinh16@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-02-09', '0000-00-00 00:00:00', NULL),
(385, 'giadinh17@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-02-09', '0000-00-00 00:00:00', NULL),
(386, 'giadinh18@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-02-09', '0000-00-00 00:00:00', NULL),
(387, 'giadinh19@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-02-09', '0000-00-00 00:00:00', NULL),
(388, 'giadinh20@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-02-09', '0000-00-00 00:00:00', NULL),
(389, 'giadinh21@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(390, 'giadinh22@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(391, 'giadinh23@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(392, 'giadinh24@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(393, 'giadinh25@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(394, 'giadinh26@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(395, 'giadinh27@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(396, 'giadinh28@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(397, 'giadinh29@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(398, 'giadinh30@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(399, 'giadinh31@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(400, 'giadinh32@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(401, 'giadinh33@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(402, 'giadinh34@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(403, 'giadinh35@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(404, 'giadinh36@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(405, 'giadinh37@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(406, 'giadinh38@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(407, 'giadinh39@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(408, 'giadinh40@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(409, 'giadinh42@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(410, 'giadinh43@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(411, 'giadinh44@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(412, 'giadinh45@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(413, 'giadinh46@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(414, 'giadinh47@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(415, 'giadinh41@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(416, 'giadinh48@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(417, 'giadinh49@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(418, 'giadinh50@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(419, 'giadinh51@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(420, 'giadinh52@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(421, 'giadinh53@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(422, 'giadinh54@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(423, 'giadinh55@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(424, 'giadinh56@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(425, 'giadinh57@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(426, 'giadinh58@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(427, 'giadinh59@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(428, 'giadinh60@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(429, 'giadinh61@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(430, 'giadinh62@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(431, 'giadinh63@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(432, 'giadinh64@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(433, 'giadinh65@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(434, 'giadinh66@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(435, 'giadinh67@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(436, 'giadinh68@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(437, 'giadinh69@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(438, 'giadinh70@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(439, 'giadinh71@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(440, 'giadinh72@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(441, 'giadinh73@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(442, 'giadinh74@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(443, 'giadinh75@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(444, 'giadinh76@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(445, 'giadinh77@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(446, 'giadinh78@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(447, 'giadinh79@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(448, 'giadinh80@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(449, 'giadinh81@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(450, 'giadinh82@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(451, 'giadinh83@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(452, 'giadinh84@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(453, 'giadinh85@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(454, 'giadinh86@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(455, 'giadinh87@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(456, 'giadinh88@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(457, 'giadinh89@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(458, 'giadinh90@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(459, 'giadinh91@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(460, 'giadinh92@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(461, 'giadinh93@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(462, 'giadinh94@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(463, 'giadinh95@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(464, 'giadinh96@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(465, 'giadinh97@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(466, 'giadinh98@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(467, 'giadinh99@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(468, 'giadinh101@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(469, 'giadinh102@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(470, 'giadinh103@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(471, 'giadinh104@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(472, 'giadinh105@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(473, 'giadinh106@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(474, 'giadinh107@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(475, 'giadinh108@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(476, 'giadinh109@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(477, 'giadinh100@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(478, 'giadinh111@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(479, 'giadinh112@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(480, 'giadinh113@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(481, 'giadinh114@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(482, 'giadinh115@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(483, 'giadinh116@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(484, 'giadinh117@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(485, 'giadinh118@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(486, 'giadinh119@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(487, 'giadinh200@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(488, 'giadinh112128@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(489, 'giadinh112129@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(490, 'giadinh310@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-03-29', '2021-03-28 17:00:00', NULL),
(491, 'giadinh311@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(492, 'giadinh312@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(493, 'giadinh313@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(494, 'giadinh314@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(495, 'giadinh319@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(496, 'giadinh410@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-04-29', '2021-04-28 17:00:00', NULL),
(497, 'giadinh412@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(498, 'giadinh413@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(499, 'giadinh414@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(500, 'giadinh411@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(501, 'giadinh418@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(502, 'giadinh419@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-05-29', '2021-05-28 17:00:00', NULL),
(503, 'giadinh512@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(504, 'giadinh513@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(505, 'giadinh514@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(506, 'giadinh515@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(507, 'giadinh516@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(508, 'giadinh517@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(509, 'giadinh518@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(510, 'giadinh519@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(511, 'giadinh610@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-06-29', '2021-06-28 17:00:00', NULL),
(512, 'giadinh611@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(513, 'giadinh612@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(514, 'giadinh613@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(515, 'giadinh614@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(516, 'giadinh615@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(517, 'giadinh616@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(518, 'giadinh617@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(519, 'giadinh618@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(520, 'giadinh619@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-07-29', '2021-07-28 17:00:00', NULL),
(521, 'giadinh714@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(522, 'giadinh715@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(523, 'giadinh716@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(524, 'giadinh717@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(525, 'giadinh718@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(526, 'giadinh719@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(527, 'giadinh810@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-08-29', '2021-08-28 17:00:00', NULL),
(528, 'giadinh811@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(529, 'giadinh812@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(530, 'giadinh813@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(531, 'giadinh814@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(532, 'giadinh815@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(533, 'giadinh816@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(534, 'giadinh817@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(535, 'giadinh818@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(536, 'giadinh819@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-09-29', '2021-09-28 17:00:00', NULL),
(537, 'giadinh915@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(538, 'giadinh916@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(539, 'giadinh917@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(540, 'giadinh918@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(541, 'giadinh919@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-10-29', '2021-10-28 17:00:00', NULL),
(542, 'giadinh1011@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(543, 'giadinh1012@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(544, 'giadinh1013@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(545, 'giadinh1014@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(546, 'giadinh1015@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(547, 'giadinh1016@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(548, 'giadinh1017@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(549, 'giadinh1018@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(550, 'giadinh1019@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(551, 'giadinh1010@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-11-29', '2021-11-28 17:00:00', NULL),
(552, 'giadinh1111@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(553, 'giadinh1112@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(554, 'giadinh1113@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(555, 'giadinh1114@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(556, 'giadinh1115@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(557, 'giadinh1116@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(558, 'giadinh1117@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(559, 'giadinh1118@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(560, 'giadinh1119@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(561, 'giadinh1121200@gmail.com', '$2y$10$ffnhDqkpdwIDLtUgCm95ze3BRwM0YFsEWz0EFzpPi6oycEvJcsIZy', 'hospital', NULL, '2021-12-29', '2021-12-28 17:00:00', NULL),
(562, 'bvbaclieu@gmail.com', '$2y$10$Z9OADo5uieEhW.6aZL0bTOLzRODWR8NcimcUPpTROW5JjGWcl2d46', 'hospital', NULL, '2021-11-29', '2021-11-29 14:43:31', NULL),
(563, 'nhunguoixala10@gmail.com', '$2y$10$SjUrN2oaNd2FlyifQU/rhOmbNNrloebCAXZH1k2b6..uOktzy1F8K', 'hospital', NULL, '2021-11-30', '2021-11-30 06:50:22', NULL),
(1231, '123@@', '1', 'hospital', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccines`
--

CREATE TABLE `vaccines` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `description` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `age_use_from` int(11) NOT NULL,
  `age_use_to` int(11) NOT NULL,
  `id_disease` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `vaccines`
--

INSERT INTO `vaccines` (`id`, `name`, `country`, `description`, `age_use_from`, `age_use_to`, `id_disease`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Vero Cell', 'Trung Quốc', 'ok nhé nhé', 11, 80, 10, NULL, '2021-12-03 08:35:22', NULL),
(4, 'Comirnaty', 'Bỉ', 'ok', 18, 80, 2, NULL, '2021-11-16 09:46:14', NULL),
(5, 'Janssen', 'Bỉ', 'ok', 18, 80, 19, NULL, NULL, NULL),
(6, 'vaccine Hayat', 'Trung Quốc', 'ok', 18, 80, 10, NULL, NULL, NULL),
(8, 'Abdala', 'Cuba', 'ok', 18, 80, 19, NULL, '2021-11-16 14:21:36', NULL),
(19, 'covid stop', 'Việt Nam', 'hehe', 18, 80, 2, '2021-11-16 07:52:47', '2021-12-02 16:03:55', NULL),
(25, 'covid stop 3', 'Việt Nam', 'aaa', 4, 4, 2, '2021-11-19 07:43:30', '2021-11-19 07:43:30', NULL),
(28, 'covid stop 2', 'Việt Nam', 'hehe', 18, 80, 2, '2021-11-19 08:48:04', '2021-12-02 16:03:55', NULL),
(29, 'covid stop 4', 'Việt Nam', 'huhu', 18, 80, 2, '2021-11-20 02:29:23', '2021-12-02 16:03:55', NULL),
(30, 'covid stop 5', 'Việt Nam', 'hhh', 1, 4, 2, '2021-11-22 16:16:11', '2021-12-02 16:03:55', NULL),
(34, '500 ngàn', 'Việt Nam', 'rất vui', 18, 80, 24, '2021-12-03 02:58:05', '2021-12-03 02:58:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_hos`
--

CREATE TABLE `vaccine_hos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_vac` int(11) NOT NULL,
  `id_hos` int(11) NOT NULL,
  `lot_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `quantity_received` int(10) DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `date_of_manufacture` date DEFAULT NULL,
  `out_of_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vaccine_hos`
--

INSERT INTO `vaccine_hos` (`id`, `id_vac`, `id_hos`, `lot_number`, `quantity`, `quantity_received`, `date_add`, `date_of_manufacture`, `out_of_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(23, 3, 153, '01', 998, 1000, '2021-12-01', '2020-11-09', '2022-11-09', NULL, '2021-12-01 02:49:53', NULL),
(24, 4, 153, '01', 899, 1000, '2021-11-10', '2020-11-09', '2022-11-17', NULL, '2021-12-01 02:49:43', NULL),
(25, 19, 153, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-30 15:46:25', '2021-11-30 15:46:25', NULL),
(26, 19, 153, '01', 1500000, 1500000, '2021-11-30', '2021-11-23', '2023-11-23', '2021-11-30 15:47:13', '2021-11-30 15:47:13', NULL),
(27, 19, 153, NULL, 0, NULL, NULL, NULL, NULL, '2021-12-02 13:51:12', '2021-12-02 13:51:12', NULL),
(28, 19, 153, NULL, 0, NULL, NULL, NULL, NULL, '2021-12-02 13:51:33', '2021-12-02 13:51:33', NULL),
(29, 4, 153, '02', 1000000, 1000000, '2021-12-02', '2021-12-03', '2022-05-26', '2021-12-02 13:58:32', '2021-12-02 13:58:32', NULL),
(30, 25, 153, '03', 123465798, 123465798, '2021-12-02', '2021-11-30', '2022-12-09', '2021-12-02 14:03:05', '2021-12-02 14:03:05', NULL),
(31, 3, 153, '02', 124651216, 124651216, '2021-12-02', '2021-12-07', '2022-12-11', '2021-12-02 14:03:57', '2021-12-02 14:03:57', NULL),
(32, 34, 153, NULL, 0, NULL, NULL, NULL, NULL, '2021-12-03 02:58:05', '2021-12-03 02:58:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_patients`
--

CREATE TABLE `vaccine_patients` (
  `id` int(20) UNSIGNED NOT NULL,
  `id_card` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `id_hos` int(11) NOT NULL,
  `id_vac` int(11) DEFAULT NULL,
  `injection_times` int(11) NOT NULL DEFAULT 1,
  `vaccine_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vaccine_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vaccine_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `registerDate` date DEFAULT NULL,
  `registerTime` time DEFAULT NULL,
  `done_inject` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `vaccine_patients`
--
DELIMITER $$
CREATE TRIGGER `trigger_time_vac` AFTER INSERT ON `vaccine_patients` FOR EACH ROW begin
if (SELECT new.registerTime) BETWEEN cast('07:00:00' as time) and cast('09:00:00' as time) THEN
set @registerTimed = cast('07:00:00' as time);
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = new.date and registerTime BETWEEN cast('07:00:00' as time) AND cast('09:00:00' as time) and id_hos = new.id_hos and registerTime <= @registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = new.date and registerTime BETWEEN cast('07:00:00' as time) AND cast('09:00:00' as time) and id_hos = new.id_hos and registerTime >= @registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(@registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime and subtime(@registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET @registerTimed = addtime(@registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  if cast(@registerTimed as time) > cast('09:00:00' as time) then
  Update time_web_moblie set `7-9` = 0 where date = new.date and id_hos = new.id_hos and type = 0;
  end if;
elseif (SELECT new.registerTime) BETWEEN cast('09:00:00' as time) and cast('11:00:00' as time) THEN
set @registerTimed = cast('09:00:00' as time);
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = new.date and registerTime BETWEEN cast('09:00:00' as time) AND cast('11:00:00' as time) and id_hos = new.id_hos and registerTime <= @registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = new.date and registerTime BETWEEN cast('09:00:00' as time) AND cast('11:00:00' as time) and id_hos = new.id_hos and registerTime >= @registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(@registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime and subtime(@registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET @registerTimed = addtime(@registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  if cast(@registerTimed as time) > cast('11:00:00' as time) then
    Update time_web_moblie set `9-11` = 0 where date = new.date and id_hos = new.id_hos and type = 0;
    end if;
elseif (SELECT new.registerTime) BETWEEN cast('13:00:00' as time) and cast('15:00:00' as time) THEN
set @registerTimed = cast('13:00:00' as time);
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = new.date and registerTime BETWEEN cast('13:00:00' as time) AND cast('15:00:00' as time) and id_hos = new.id_hos and registerTime <= @registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = new.date and registerTime BETWEEN cast('13:00:00' as time) AND cast('15:00:00' as time) and id_hos = new.id_hos and registerTime >= @registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(@registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime and subtime(@registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET @registerTimed = addtime(@registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  if cast(@registerTimed as time) > cast('15:00:00' as time) then
  Update time_web_moblie set `13-15` = 0 where date = new.date and id_hos = new.id_hos and type = 0;
  end if;
elseif (SELECT new.registerTime) BETWEEN cast('15:00:00' as time) and cast('17:00:00' as time) THEN
set @registerTimed = cast('15:00:00' as time);
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = new.date and registerTime BETWEEN cast('15:00:00' as time) AND cast('17:00:00' as time) and id_hos = new.id_hos and registerTime <= @registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = new.date and registerTime BETWEEN cast('15:00:00' as time) AND cast('17:00:00' as time) and id_hos = new.id_hos and registerTime >= @registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(@registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime and subtime(@registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET @registerTimed = addtime(@registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  if cast(@registerTimed as time) > cast('17:00:00' as time) then
  Update time_web_moblie set `15-17` = 0 where date = new.date and id_hos = new.id_hos and type = 0;
  end if;
else
set @registerTimed = cast('17:00:00' as time);
set @defaultTime = cast('00:05:00' as time);
label1: LOOP
set @minTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = new.date and registerTime BETWEEN cast('17:00:00' as time) AND cast('19:00:00' as time) and id_hos = new.id_hos and registerTime <= @registerTimed order by registerTime DESC LIMIT 1 );
set @maxTime = (SELECT registerTime FROM vaccine_patients WHERE vaccine_patients.done_inject = '0' and vaccine_patients.date = new.date and registerTime BETWEEN cast('17:00:00' as time) AND cast('19:00:00' as time) and id_hos = new.id_hos and registerTime >= @registerTimed order by registerTime ASC LIMIT 1 );
    IF @maxTime is null THEN
    BEGIN
        IF subtime(@registerTimed,@minTime) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    LEAVE label1;
        end if;
    END;
    ELSEIF @minTime is null THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime THEN
        LEAVE label1;
        ELSE
        SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
        end if;
    END;
    ELSEIF SubTIME(@maxTime,@minTime) >= ADDTime(@defaultTime,@defaultTime) THEN
    BEGIN
    IF subtime(@maxTime,@registerTimed) >= @defaultTime and subtime(@registerTimed,@minTime) >= @defaultTime THEN
    LEAVE label1;
    ELSE
    SET @registerTimed = addtime(@registerTimed,@defaultTime);
    ITERATE label1;
    end if;
    END;
    ELSE
      SET @registerTimed = addtime(@registerTimed,@defaultTime);
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  if cast(@registerTimed as time) > cast('19:00:00' as time) then
  Update time_web_moblie set `17-19` = 0 where date = new.date and id_hos = new.id_hos and type = 0;
  end if;
end if;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anamnesis`
--
ALTER TABLE `anamnesis`
  ADD PRIMARY KEY (`anamnesisID`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `limit_web_mobile`
--
ALTER TABLE `limit_web_mobile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id_card`),
  ADD KEY `anamnesisID` (`anamnesisID`);

--
-- Indexes for table `test_patient`
--
ALTER TABLE `test_patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_card` (`id_card`),
  ADD KEY `id_hos` (`id_hos`);

--
-- Indexes for table `time_web_moblie`
--
ALTER TABLE `time_web_moblie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vaccines`
--
ALTER TABLE `vaccines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_disease` (`id_disease`);

--
-- Indexes for table `vaccine_hos`
--
ALTER TABLE `vaccine_hos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_hos` (`id_hos`),
  ADD KEY `foreign_vac` (`id_vac`);

--
-- Indexes for table `vaccine_patients`
--
ALTER TABLE `vaccine_patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id_hospitals` (`id_hos`),
  ADD KEY `foreign_id_vaccines` (`id_vac`),
  ADD KEY `foreign_id_patients` (`id_card`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anamnesis`
--
ALTER TABLE `anamnesis`
  MODIFY `anamnesisID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `limit_web_mobile`
--
ALTER TABLE `limit_web_mobile`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `test_patient`
--
ALTER TABLE `test_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2356;

--
-- AUTO_INCREMENT for table `time_web_moblie`
--
ALTER TABLE `time_web_moblie`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1232;

--
-- AUTO_INCREMENT for table `vaccines`
--
ALTER TABLE `vaccines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `vaccine_hos`
--
ALTER TABLE `vaccine_hos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `vaccine_patients`
--
ALTER TABLE `vaccine_patients`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3121;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anamnesis`
--
ALTER TABLE `anamnesis`
  ADD CONSTRAINT `anamnesis_ibfk_1` FOREIGN KEY (`anamnesisID`) REFERENCES `patients` (`anamnesisID`);

--
-- Constraints for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD CONSTRAINT `foreign_id` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`anamnesisID`) REFERENCES `anamnesis` (`anamnesisID`);

--
-- Constraints for table `test_patient`
--
ALTER TABLE `test_patient`
  ADD CONSTRAINT `foreign_hospitals` FOREIGN KEY (`id_hos`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_patients` FOREIGN KEY (`id_card`) REFERENCES `patients` (`id_card`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vaccines`
--
ALTER TABLE `vaccines`
  ADD CONSTRAINT `foreign_id_disease` FOREIGN KEY (`id_disease`) REFERENCES `diseases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vaccine_hos`
--
ALTER TABLE `vaccine_hos`
  ADD CONSTRAINT `foreign_hos` FOREIGN KEY (`id_hos`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_vac` FOREIGN KEY (`id_vac`) REFERENCES `vaccines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vaccine_patients`
--
ALTER TABLE `vaccine_patients`
  ADD CONSTRAINT `foreign_id_hospitals` FOREIGN KEY (`id_hos`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_id_patients` FOREIGN KEY (`id_card`) REFERENCES `patients` (`id_card`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_id_vaccines` FOREIGN KEY (`id_vac`) REFERENCES `vaccines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
