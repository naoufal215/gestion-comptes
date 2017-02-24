-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 24 Février 2017 à 15:21
-- Version du serveur :  5.6.20-log
-- Version de PHP :  5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `database1`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
`code` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`code`, `email`, `nom`) VALUES
(1, 'naoufal@gmail.com', 'naoufal'),
(2, 'youness@gmail.com', 'youness'),
(3, 'berouain@gmail.com', 'berouain');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `type_compte` varchar(2) NOT NULL,
  `code_compte` varchar(255) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `sold` double NOT NULL,
  `dicouvert` double DEFAULT NULL,
  `taux` double DEFAULT NULL,
  `code_client` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`type_compte`, `code_compte`, `date_creation`, `sold`, `dicouvert`, `taux`, `code_client`) VALUES
('CE', 'CE1', '2017-02-22 15:29:12', 1803, NULL, 12.2, 1),
('CC', 'CC1', '2017-02-22 15:29:12', 14478, 4855, NULL, 3),
('CC', 'CC2', '2017-02-22 15:29:12', 60558, 9965, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE IF NOT EXISTS `operation` (
  `type_operation` varchar(1) NOT NULL,
`code_operation` bigint(20) NOT NULL,
  `date_operation` datetime DEFAULT NULL,
  `montant` double NOT NULL,
  `code_compte` varchar(255) DEFAULT NULL,
  `compte` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `operation`
--

INSERT INTO `operation` (`type_operation`, `code_operation`, `date_operation`, `montant`, `code_compte`, `compte`) VALUES
('R', 1, '2017-02-22 15:29:12', 1452, 'CC2', NULL),
('R', 2, '2017-02-22 15:29:12', 638, 'CE1', NULL),
('V', 3, '2017-02-22 15:29:12', 798, 'CC1', NULL),
('V', 4, '2017-02-23 10:03:32', 1275, 'CE1', NULL),
('V', 5, '2017-02-23 10:15:12', 1275, 'CE1', NULL),
('V', 6, '2017-02-23 10:20:34', 1275, 'CE1', NULL),
('R', 7, '2017-02-23 14:29:16', 122, 'CE1', NULL),
('V', 8, '2017-02-23 14:44:31', 92, 'CE1', NULL),
('R', 9, '2017-02-23 14:44:47', 450, 'CE1', NULL),
('R', 10, '2017-02-23 14:45:21', 9000, 'CC2', NULL),
('V', 11, '2017-02-23 14:45:21', 9000, 'CE1', NULL),
('R', 12, '2017-02-23 15:49:47', 411, 'Ce1', NULL),
('R', 13, '2017-02-23 15:49:54', 7454, 'Ce1', NULL),
('R', 14, '2017-02-23 15:50:05', 999, 'Ce1', NULL),
('R', 15, '2017-02-23 15:50:14', 3333, 'Ce1', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `role` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `roles`
--

INSERT INTO `roles` (`role`) VALUES
('ADMIN'),
('USER');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 1),
('user', 'ee11cbb19052e40b07aac0ca060c23ee', 1),
('naoufal', 'ee11cbb19052e40b07aac0ca060c23ee', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `role` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users_roles`
--

INSERT INTO `users_roles` (`username`, `role`) VALUES
('admin', 'ADMIN'),
('admin', 'USER'),
('naoufal', 'USER'),
('user', 'USER');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`code`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
 ADD PRIMARY KEY (`code_compte`), ADD KEY `FK4j39u1ymy78ien5aes05ut81e` (`code_client`);

--
-- Index pour la table `operation`
--
ALTER TABLE `operation`
 ADD PRIMARY KEY (`code_operation`), ADD KEY `FK6x81chpvk8psd9e86steac7jf` (`code_compte`), ADD KEY `FK5o12n0rda285c7agc6y4apmuy` (`compte`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`role`), ADD UNIQUE KEY `roles_role_uindex` (`role`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`username`), ADD UNIQUE KEY `users_username_uindex` (`username`);

--
-- Index pour la table `users_roles`
--
ALTER TABLE `users_roles`
 ADD PRIMARY KEY (`username`,`role`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
MODIFY `code` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `operation`
--
ALTER TABLE `operation`
MODIFY `code_operation` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
