DROP DATABASE  IF EXISTS `zene-kerdoiv`;

CREATE DATABASE  IF NOT EXISTS `zene-kerdoiv`;
USE `zene-kerdoiv`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- Default passwords here are: fun123
--

INSERT INTO `users` 
VALUES 
('john','{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1),
('mary','{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1),
('susan','{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('john','ROLE_RESPONDENT'),
('mary','ROLE_RESPONDENT'),
('susan','ROLE_RESPONDENT'),
('susan','ROLE_ADMIN');

DROP TABLE IF EXISTS `respondent`;
CREATE TABLE `respondent` (
  `id` int(4)  NOT NULL AUTO_INCREMENT,
  `created_on` DATETIME NULL,
  `gender` varchar(5) NOT NULL,
  `age` int(2) NOT NULL,
  `year` int(2) NOT NULL,
  `studies` int(2) NOT NULL,
  `note` int(1) NOT NULL,
  `county` int(2) NOT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(10)  NOT NULL AUTO_INCREMENT,
  `resp_id` int(4),
  `question` int(3),
  `answer` varchar(16),
  `start_time` DATETIME,
  `end_time` DATETIME,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `county`;
CREATE TABLE `county` (
  `id` int(2)  NOT NULL,
  `county` varchar(40),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `county`
VALUES
('1', 'Budapest'),
('2', 'Bács-Kiskun'),
('3', 'Baranya'),
('4', 'Békés'),
('5', 'Borsod-Abaúj-Zemplén'),
('6', 'Csongrád'),
('7', 'Fejér'),
('8', 'Győr-Moson-Sopron'),
('9', 'Hajdú-Bihar'),
('10', 'Heves'),
('11', 'Jász-Nagykun-Szolnok'),
('12', 'Komárom-Esztergom'),
('13', 'Nógrád'),
('14', 'Pest'),
('15', 'Somogy'),
('16', 'Szabolcs-Szatmár-Bereg'),
('17', 'Tolna'),
('18', 'Vas'),
('19', 'Veszprém'),
('20', 'Zala');

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(1)  NOT NULL,
  `type` varchar(25),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `type`
VALUES
('1', 'Főváros'),
('2', 'Megyei jogú város'),
('3', 'Kisváros'),
('4', 'Község');

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(3) auto_increment,
  `title` varchar(100) NOT NULL,
  `sub_id` tinyint(2),
  `q_answers` tinyint(1) NOT NULL,
  `answer1` varchar(16) NOT NULL,
  `answer2` varchar(16),
  `answer3` varchar(16),
  `q_files` tinyint(1) NOT NULL,
  `file_path1` varchar(200) NOT NULL,
  `file_path2` varchar(200),
  `nr` INT(3) NOT NULL,
  `right` VARCHAR(16) NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `question`
VALUES
('1', 'Példa', null, '2', 'Azonos', 'Különböző', null, '2', '1A.mp3', '1B.mp3', '1', null, '1'),
('2', 'Hangmagasság', '1', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H1.mp3', null, '2', 'Második magasabb', '1'),
('3', 'Hangmagasság', '2', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H2.mp3', null, '3', 'Azonosak', '1'),
('4', 'Hangmagasság', '3', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H3.mp3', null, '4', 'Második magasabb', '1'),
('5', 'Hangmagasság', '4', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H4.mp3', null, '5', 'Első magasabb', '1'),
('6', 'Hangmagasság', '5', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H5.mp3', null, '6', 'Első magasabb', '1'),
('7', 'Hangmagasság', '6', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H6.mp3', null, '7', 'Azonosak', '1'),
('8', 'Hangmagasság', '7', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H7.mp3', null, '8', 'Második magasabb', '1'),
('9', 'Hangmagasság', '8', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H8.mp3', null, '9', 'Második magasabb', '1'),
('10', 'Hangerő', '1', '2', 'A hangosabb', 'B hangosabb', null, '2', '1A.mp3', '1B.mp3', '13', 'B hangosabb', '1'),
('11', 'Hangerő', '2', '2', 'A hangosabb', 'B hangosabb', null, '2', '2A.mp3', '2B.mp3', '14', 'A hangosabb', '1'),
('12', 'Hangerő', '3', '2', 'A hangosabb', 'B hangosabb', null, '2', '3A.mp3', '3B.mp3', '15', 'A hangosabb', '1'),
('13', 'Hangerő', '4', '2', 'A hangosabb', 'B hangosabb', null, '2', '4A.mp3', '4B.mp3', '16', 'B hangosabb', '1'),
('14', 'Hangerő', '5', '2', 'A hangosabb', 'B hangosabb', null, '2', '5A.mp3', '5B.mp3', '17', 'B hangosabb', '1'),
('15', 'Hangerő', '6', '2', 'A hangosabb', 'B hangosabb', null, '2', '6A.mp3', '6B.mp3', '18', 'A hangosabb', '1'),
('16', 'Hangerő', '7', '2', 'A hangosabb', 'B hangosabb', null, '2', '7A.mp3', '7B.mp3', '19', 'B hangosabb', '1'),
('17', 'Hangerő', '8', '2', 'A hangosabb', 'B hangosabb', null, '2', '8A.mp3', '8B.mp3', '20', 'A hangosabb', '1'),
('18', 'Hangerő', '9', '2', 'A hangosabb', 'B hangosabb', null, '2', '9A.mp3', '9B.mp3', '21', 'A hangosabb', '1'),
('19', 'Hangerő', '10', '2', 'A hangosabb', 'B hangosabb', null, '2', '10A.mp3', '10B.mp3', '22', 'A hangosabb', '1'),
('20', 'Hangerő', '11', '2', 'A hangosabb', 'B hangosabb', null, '2', '11A.mp3', '11B.mp3', '23', 'A hangosabb', '1'),
('21', 'Hangerő', '12', '2', 'A hangosabb', 'B hangosabb', null, '2', '12A.mp3', '12B.mp3', '24', 'A hangosabb', '1'),
('22', 'Hangerő', '13', '2', 'A hangosabb', 'B hangosabb', null, '2', '13A.mp3', '13B.mp3', '25', 'B hangosabb', '1'),
('23', 'Hangerő', '14', '2', 'A hangosabb', 'B hangosabb', null, '2', '14A.mp3', '14B.mp3', '26', 'B hangosabb', '1'),
('24', 'Hangerő', '15', '2', 'A hangosabb', 'B hangosabb', null, '2', '15A.mp3', '15B.mp3', '27', 'A hangosabb', '1'),
('25', 'Hangerő', '16', '2', 'A hangosabb', 'B hangosabb', null, '2', '16A.mp3', '16B.mp3', '28', 'B hangosabb', '1'),
('26', 'Dallam', '1', '2', 'Azonos', 'Különböző', null, '2', '1A.mp3', '1B.mp3', '29', 'Különböző', '1'),
('27', 'Dallam', '2', '2', 'Azonos', 'Különböző', null, '2', '2A.mp3', '2B.mp3', '30', 'Különböző', '1'),
('28', 'Dallam', '3', '2', 'Azonos', 'Különböző', null, '2', '3A.mp3', '3B.mp3', '31', 'Azonos', '1'),
('29', 'Dallam', '4', '2', 'Azonos', 'Különböző', null, '2', '4A.mp3', '4B.mp3', '32', 'Különböző', '1'),
('30', 'Dallam', '5', '2', 'Azonos', 'Különböző', null, '2', '5A.mp3', '5B.mp3', '33', 'Azonos', '1'),
('31', 'Dallam', '6', '2', 'Azonos', 'Különböző', null, '2', '6A.mp3', '6B.mp3', '34', 'Azonos', '1'),
('32', 'Dallam', '7', '2', 'Azonos', 'Különböző', null, '2', '7A.mp3', '7B.mp3', '35', 'Különböző', '1'),
('33', 'Dallam', '8', '2', 'Azonos', 'Különböző', null, '2', '8A.mp3', '8B.mp3', '36', 'Azonos', '1'),
('34', 'Dallam', '9', '2', 'Azonos', 'Különböző', null, '2', '9A.mp3', '9B.mp3', '37', 'Azonos', '1'),
('35', 'Dallam', '10', '2', 'Azonos', 'Különböző', null, '2', '10A.mp3', '10B.mp3', '38', 'Különböző', '1'),
('36', 'Dallam', '11', '2', 'Azonos', 'Különböző', null, '2', '11A.mp3', '11B.mp3', '39', 'Azonos', '1'),
('37', 'Dallam', '12', '2', 'Azonos', 'Különböző', null, '2', '12A.mp3', '12B.mp3', '40', 'Különböző', '1'),
('38', 'Dallam', '13', '2', 'Azonos', 'Különböző', null, '2', '13A.mp3', '13B.mp3', '41', 'Különböző', '1'),
('39', 'Dallam', '14', '2', 'Azonos', 'Különböző', null, '2', '14A.mp3', '14B.mp3', '42', 'Különböző', '1'),
('40', 'Dallam', '15', '2', 'Azonos', 'Különböző', null, '2', '15A.mp3', '15B.mp3', '43', 'Különböző', '1'),
('41', 'Dallam', '16', '2', 'Azonos', 'Különböző', null, '2', '16A.mp3', '16B.mp3', '44', 'Azonos', '1'),
('42', 'Hangszín', '1', '2', 'Azonos', 'Különböző', null, '2', '1A.mp3', '1B.mp3', '45', 'Különböző', '1'),
('43', 'Hangszín', '2', '2', 'Azonos', 'Különböző', null, '2', '2A.mp3', '2B.mp3', '46', 'Különböző', '1'),
('44', 'Hangszín', '3', '2', 'Azonos', 'Különböző', null, '2', '3A.mp3', '3B.mp3', '47', 'Azonos', '1'),
('45', 'Hangszín', '4', '2', 'Azonos', 'Különböző', null, '2', '4A.mp3', '4B.mp3', '48', 'Különböző', '1'),
('46', 'Hangszín', '5', '2', 'Azonos', 'Különböző', null, '2', '5A.mp3', '5B.mp3', '49', 'Azonos', '1'),
('47', 'Hangszín', '6', '2', 'Azonos', 'Különböző', null, '2', '6A.mp3', '6B.mp3', '50', 'Különböző', '1'),
('48', 'Hangszín', '7', '2', 'Azonos', 'Különböző', null, '2', '7A.mp3', '7B.mp3', '51', 'Azonos', '1'),
('49', 'Hangszín', '8', '2', 'Azonos', 'Különböző', null, '2', '8A.mp3', '8B.mp3', '52', 'Különböző', '1'),
('50', 'Hangszín', '9', '2', 'Azonos', 'Különböző', null, '2', '9A.mp3', '9B.mp3', '53', 'Azonos', '1'),
('51', 'Hangszín', '10', '2', 'Azonos', 'Különböző', null, '2', '10A.mp3', '10B.mp3', '54', 'Különböző', '1'),
('52', 'Ritmus', '1', '2', 'Azonos', 'Különböző', null, '2', '1A.mp3', '1B.mp3', '55', 'Különböző', '1'),
('53', 'Ritmus', '2', '2', 'Azonos', 'Különböző', null, '2', '2A.mp3', '2B.mp3', '56', 'Azonos', '1'),
('54', 'Ritmus', '3', '2', 'Azonos', 'Különböző', null, '2', '3A.mp3', '3B.mp3', '57', 'Különböző', '1'),
('55', 'Ritmus', '4', '2', 'Azonos', 'Különböző', null, '2', '4A.mp3', '4B.mp3', '58', 'Különböző', '1'),
('56', 'Ritmus', '5', '2', 'Azonos', 'Különböző', null, '2', '5A.mp3', '5B.mp3', '59', 'Különböző', '1'),
('57', 'Ritmus', '6', '2', 'Azonos', 'Különböző', null, '2', '6A.mp3', '6B.mp3', '60', 'Különböző', '1'),
('58', 'Ritmus', '7', '2', 'Azonos', 'Különböző', null, '2', '7A.mp3', '7B.mp3', '61', 'Azonos', '1'),
('59', 'Ritmus', '8', '2', 'Azonos', 'Különböző', null, '2', '8A.mp3', '8B.mp3', '62', 'Különböző', '1'),
('60', 'Ritmus', '9', '2', 'Azonos', 'Különböző', null, '2', '9A.mp3', '9B.mp3', '63', 'Különböző', '1'),
('61', 'Ritmus', '10', '2', 'Azonos', 'Különböző', null, '2', '10A.mp3', '10B.mp3', '64', 'Azonos', '1'),
('62', 'Ritmus', '11', '2', 'Azonos', 'Különböző', null, '2', '11A.mp3', '11B.mp3', '65', 'Különböző', '1'),
('63', 'Ritmus', '12', '2', 'Azonos', 'Különböző', null, '2', '12A.mp3', '12B.mp3', '66', 'Azonos', '1'),
('64', 'Ritmus', '13', '2', 'Azonos', 'Különböző', null, '2', '13A.mp3', '13B.mp3', '67', 'Azonos', '1'),
('65', 'Ritmus', '14', '2', 'Azonos', 'Különböző', null, '2', '14A.mp3', '14B.mp3', '68', 'Különböző', '1'),
('66', 'Ritmus', '15', '2', 'Azonos', 'Különböző', null, '2', '15A.mp3', '15B.mp3', '69', 'Különböző', '1'),
('67', 'Ritmus', '16', '2', 'Azonos', 'Különböző', null, '2', '16A.mp3', '16B.mp3', '70', 'Azonos', '1'),
('68', 'Tempó', '1', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '1A.mp3', '1B.mp3', '71', 'A gyorsabb', '1'),
('69', 'Tempó', '2', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '2A.mp3', '2B.mp3', '72', 'B gyorsabb', '1'),
('70', 'Tempó', '3', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '3A.mp3', '3B.mp3', '73', 'A gyorsabb', '1'),
('71', 'Tempó', '4', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '4A.mp3', '4B.mp3', '74', 'B gyorsabb', '1'),
('72', 'Tempó', '5', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '5A.mp3', '5B.mp3', '75', 'B gyorsabb', '1'),
('73', 'Tempó', '6', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '6A.mp3', '6B.mp3', '76', 'A gyorsabb', '1'),
('74', 'Tempó', '7', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '7A.mp3', '7B.mp3', '77', 'B gyorsabb', '1'),
('75', 'Tempó', '8', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '8A.mp3', '8B.mp3', '78', 'B gyorsabb', '1'),
('76', 'Tempó', '9', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '9A.mp3', '9B.mp3', '79', 'A gyorsabb', '1'),
('77', 'Tempó', '10', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '10A.mp3', '10B.mp3', '80', 'B gyorsabb', '1'),
('78', 'Tempó', '11', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '11A.mp3', '11B.mp3', '81', 'A gyorsabb', '1'),
('79', 'Tempó', '12', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '12A.mp3', '12B.mp3', '82', 'B gyorsabb', '1'),
('80', 'Tempó', '13', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '13A.mp3', '13B.mp3', '83', 'B gyorsabb', '1'),
('81', 'Tempó', '14', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '14A.mp3', '14B.mp3', '84', 'B gyorsabb', '1'),
('82', 'Tempó', '15', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '15A.mp3', '15B.mp3', '85', 'B gyorsabb', '1'),
('83', 'Tempó', '16', '2', 'A gyorsabb', 'B gyorsabb', null, '2', '16A.mp3', '16B.mp3', '86', 'B gyorsabb', '1'),
('84', 'Hangmagasság', '9', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H9.mp3', null, '10', 'Első magasabb', '1'),
('85', 'Hangmagasság', '10', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H10.mp3', null, '11', 'Első magasabb', '1'),
('86', 'Hangmagasság', '11', '3', 'Első magasabb', 'Második magasabb', 'Azonosak', '1', 'H11.mp3', null, '12', 'Azonosak', '1');