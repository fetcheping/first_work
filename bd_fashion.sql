-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 29 juin 2019 à 21:27
-- Version du serveur :  5.7.21
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bd_fashion`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `libellecat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_clt` int(11) NOT NULL AUTO_INCREMENT,
  `id_chemise` int(11) DEFAULT NULL,
  `id_jacket` int(11) DEFAULT NULL,
  `id_pantalon` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `quartier` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image_clt` varchar(255) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `appreciation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_clt`),
  KEY `fk_relation_1` (`id_pantalon`),
  KEY `fk_relation_4` (`id_chemise`),
  KEY `fk_relation_5` (`id_jacket`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_clt`, `id_chemise`, `id_jacket`, `id_pantalon`, `nom`, `prenom`, `quartier`, `email`, `image_clt`, `pays`, `appreciation`) VALUES
(1, NULL, NULL, NULL, 'Tchomte', 'cabrel', 'sodikombo', 'cabreltchomte97@gmail.com', NULL, 'Cameroun', 'gut');

-- --------------------------------------------------------

--
-- Structure de la table `client_compose`
--

DROP TABLE IF EXISTS `client_compose`;
CREATE TABLE IF NOT EXISTS `client_compose` (
  `id_clt_Compose` int(11) NOT NULL AUTO_INCREMENT,
  `id_clt` int(11) NOT NULL,
  PRIMARY KEY (`id_clt_Compose`,`id_clt`),
  KEY `fk_client_compose2` (`id_clt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cmd_client`
--

DROP TABLE IF EXISTS `cmd_client`;
CREATE TABLE IF NOT EXISTS `cmd_client` (
  `id_cmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_clt` int(11) NOT NULL,
  `date_cmd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cmd`,`id_clt`),
  KEY `fk_cmd_paiement2` (`id_clt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_cmd` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `date_liv` datetime DEFAULT NULL,
  `est_livre` tinyint(1) DEFAULT NULL,
  `est_solde` tinyint(1) DEFAULT NULL,
  `montant_cmd` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cmd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mesurechemise`
--

DROP TABLE IF EXISTS `mesurechemise`;
CREATE TABLE IF NOT EXISTS `mesurechemise` (
  `id_chemise` int(11) NOT NULL AUTO_INCREMENT,
  `col_c` varchar(5) DEFAULT NULL,
  `cav_c` varchar(5) DEFAULT NULL,
  `car_c` varchar(5) DEFAULT NULL,
  `epaule_c` varchar(5) DEFAULT NULL,
  `t_poitrine_c` varchar(5) DEFAULT NULL,
  `t_bassin_c` varchar(5) DEFAULT NULL,
  `longueur_c` varchar(5) DEFAULT NULL,
  `l_manche_c` varchar(5) DEFAULT NULL,
  `t_manche_c` varchar(5) DEFAULT NULL,
  `poignet_c` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_chemise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mesurejacket`
--

DROP TABLE IF EXISTS `mesurejacket`;
CREATE TABLE IF NOT EXISTS `mesurejacket` (
  `id_jacket` int(11) NOT NULL AUTO_INCREMENT,
  `t_poitrine_j` varchar(5) DEFAULT NULL,
  `t_taille_j` varchar(5) DEFAULT NULL,
  `t_bassin_j` varchar(5) DEFAULT NULL,
  `longueut_j` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_jacket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mesurepantalon`
--

DROP TABLE IF EXISTS `mesurepantalon`;
CREATE TABLE IF NOT EXISTS `mesurepantalon` (
  `id_pantalon` int(11) NOT NULL AUTO_INCREMENT,
  `ceinture` varchar(5) DEFAULT NULL,
  `cuisse` varchar(5) DEFAULT NULL,
  `frappe` varchar(5) DEFAULT NULL,
  `bassin` varchar(5) DEFAULT NULL,
  `longueur_p` varchar(5) DEFAULT NULL,
  `bas` varchar(5) DEFAULT NULL,
  `fond` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_pantalon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE IF NOT EXISTS `model` (
  `id_model` int(11) NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) NOT NULL,
  `image_m` varchar(255) DEFAULT NULL,
  `libelle_model` varchar(255) DEFAULT NULL,
  `couleur` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_model`),
  KEY `fk_modelcategori` (`id_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `model_vetement`
--

DROP TABLE IF EXISTS `model_vetement`;
CREATE TABLE IF NOT EXISTS `model_vetement` (
  `id_vetement` int(11) NOT NULL AUTO_INCREMENT,
  `id_model` int(11) NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_vetement`,`id_model`),
  KEY `fk_model_vetement2` (`id_model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id_paiement` int(11) NOT NULL AUTO_INCREMENT,
  `id_cmd` int(11) NOT NULL,
  `date_paiement` datetime DEFAULT NULL,
  `montant_paiemt` int(11) DEFAULT NULL,
  `mode_paiement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_paiement`),
  KEY `fk_cif` (`id_cmd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vetement`
--

DROP TABLE IF EXISTS `vetement`;
CREATE TABLE IF NOT EXISTS `vetement` (
  `id_vetement` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_vet` varchar(255) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_vetement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vetement_cmd`
--

DROP TABLE IF EXISTS `vetement_cmd`;
CREATE TABLE IF NOT EXISTS `vetement_cmd` (
  `id_cmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_vetement` int(11) NOT NULL,
  `qte_cmd` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cmd`,`id_vetement`),
  KEY `fk_vetement_cmd2` (`id_vetement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_relation_1` FOREIGN KEY (`id_pantalon`) REFERENCES `mesurepantalon` (`id_pantalon`),
  ADD CONSTRAINT `fk_relation_4` FOREIGN KEY (`id_chemise`) REFERENCES `mesurechemise` (`id_chemise`),
  ADD CONSTRAINT `fk_relation_5` FOREIGN KEY (`id_jacket`) REFERENCES `mesurejacket` (`id_jacket`);

--
-- Contraintes pour la table `client_compose`
--
ALTER TABLE `client_compose`
  ADD CONSTRAINT `fk_client_compose` FOREIGN KEY (`id_clt_Compose`) REFERENCES `client` (`id_clt`),
  ADD CONSTRAINT `fk_client_compose2` FOREIGN KEY (`id_clt`) REFERENCES `client` (`id_clt`);

--
-- Contraintes pour la table `cmd_client`
--
ALTER TABLE `cmd_client`
  ADD CONSTRAINT `fk_cmd_paiement` FOREIGN KEY (`id_cmd`) REFERENCES `commande` (`id_cmd`),
  ADD CONSTRAINT `fk_cmd_paiement2` FOREIGN KEY (`id_clt`) REFERENCES `client` (`id_clt`);

--
-- Contraintes pour la table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `fk_modelcategori` FOREIGN KEY (`id_cat`) REFERENCES `categorie` (`id_cat`);

--
-- Contraintes pour la table `model_vetement`
--
ALTER TABLE `model_vetement`
  ADD CONSTRAINT `fk_model_vetement` FOREIGN KEY (`id_vetement`) REFERENCES `vetement` (`id_vetement`),
  ADD CONSTRAINT `fk_model_vetement2` FOREIGN KEY (`id_model`) REFERENCES `model` (`id_model`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `fk_cif` FOREIGN KEY (`id_cmd`) REFERENCES `commande` (`id_cmd`);

--
-- Contraintes pour la table `vetement_cmd`
--
ALTER TABLE `vetement_cmd`
  ADD CONSTRAINT `fk_vetement_cmd` FOREIGN KEY (`id_cmd`) REFERENCES `commande` (`id_cmd`),
  ADD CONSTRAINT `fk_vetement_cmd2` FOREIGN KEY (`id_vetement`) REFERENCES `vetement` (`id_vetement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
