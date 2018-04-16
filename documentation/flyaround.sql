-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 16 Avril 2018 à 15:24
-- Version du serveur :  5.7.21-0ubuntu0.17.10.1
-- Version de PHP :  7.2.1-1+ubuntu17.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `flyaround`
--

-- --------------------------------------------------------

--
-- Structure de la table `flight`
--

CREATE TABLE `flight` (
  `id` int(11) NOT NULL,
  `nbFreeSeats` smallint(6) NOT NULL,
  `seatPrice` double NOT NULL,
  `takeOffTime` datetime NOT NULL,
  `publicationDate` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `wasDone` tinyint(1) NOT NULL,
  `departure_id` int(11) NOT NULL,
  `arrival_id` int(11) NOT NULL,
  `plane_id` int(11) NOT NULL,
  `pilot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plane_model`
--

CREATE TABLE `plane_model` (
  `id` int(11) NOT NULL,
  `model` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `manufacturer` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cruiseSpeed` smallint(6) NOT NULL,
  `planeNbSeats` smallint(6) NOT NULL,
  `isAvailable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `plane_model`
--

INSERT INTO `plane_model` (`id`, `model`, `manufacturer`, `cruiseSpeed`, `planeNbSeats`, `isAvailable`) VALUES
(2, 'Aeronca 7AC Champion', 'Aeronca', 128, 2, 1),
(3, 'Beechcraft 23', 'Beechcraft Musketeer', 194, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `nbReservedSeats` smallint(6) NOT NULL,
  `publicationDate` datetime NOT NULL,
  `wasDone` tinyint(1) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `user_rated_id` int(11) NOT NULL,
  `review_author_id` int(11) NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `publicationDate` datetime NOT NULL,
  `note` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `icao` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `city` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `site`
--

INSERT INTO `site` (`id`, `name`, `icao`, `latitude`, `longitude`, `city`) VALUES
(1, 'Charles de Gaulle International Airport', 'LFPG', 49.0127983093, 2.54999995232, 'Paris'),
(2, 'Paris-Orly Airport', 'LFPO', 48.7233333, 2.3794444, 'Paris'),
(3, 'Nice-Côte d\'Azur Airport', 'LFMN', 43.6584014893, 7.215869903560001, 'Nice'),
(4, 'Marseille Provence Airport', 'LFML', 43.439271922, 5.22142410278, 'Marseille'),
(5, 'Toulouse-Blagnac Airport', 'LFBO', 43.629101, 1.36382, 'Toulouse/Blagnac'),
(6, 'Lyon Saint-Exupéry Airport', 'LFLL', 45.7255556, 5.0811111, 'Lyon'),
(7, 'EuroAirport Basel-Mulhouse-Freiburg Airport', 'LFSB', 47.59, 7.5291667, 'Bâle/Mulhouse'),
(8, 'Paris-Le Bourget Airport', 'LFPB', 48.969398498535156, 2.441390037536621, 'Paris'),
(9, 'Bordeaux-Mérignac Airport', 'LFBD', 44.828300476100004, -0.715556025505, 'Bordeaux/Mérignac'),
(10, 'Paris Beauvais Tillé Airport', 'LFOB', 49.45439910888672, 2.1127800941467285, 'Beauvais/Tillé'),
(11, 'Nantes Atlantique Airport', 'LFRS', 47.153198242200006, -1.61073005199, 'Nantes'),
(12, 'Montpellier-Méditerranée Airport', 'LFMT', 43.57619857788086, 3.96301007270813, 'Montpellier/Méditerranée'),
(13, 'Lyon-Bron Airport', 'LFLY', 45.72719955444336, 4.944270133972168, 'Lyon/Bron'),
(14, 'Le Touquet-Côte d\'Opale Airport', 'LFAT', 50.517398834228516, 1.6205899715423584, 'Le Touquet-Paris-Plage'),
(15, 'Lille-Lesquin Airport', 'LFQQ', 50.563332, 3.086886, 'Lille/Lesquin'),
(16, 'Strasbourg Airport', 'LFST', 48.538299560546875, 7.628230094909668, 'Strasbourg'),
(17, 'Carcassonne Airport', 'LFMK', 43.215999603271484, 2.3063199520111084, 'Carcassonne/Salvaza'),
(18, 'Cannes-Mandelieu Airport', 'LFMD', 43.54199981689453, 6.953479766845703, 'Cannes/Mandelieu'),
(19, 'Chambéry-Savoie Airport', 'LFLB', 45.638099670410156, 5.880229949951172, 'Chambéry/Aix-les-Bains'),
(20, 'Avignon-Caumont Airport', 'LFMV', 43.90729904174805, 4.901830196380615, 'Avignon/Caumont'),
(21, 'Bastia-Poretta Airport', 'LFKB', 42.55270004272461, 9.48373031616211, 'Bastia/Poretta'),
(22, 'La Rochelle-Île de Ré Airport', 'LFBH', 46.17919921875, -1.1952799558639526, 'La Rochelle/Île de Ré'),
(23, 'Grenoble-Isère Airport', 'LFLS', 45.36289978027344, 5.329370021820068, 'Grenoble/Saint-Geoirs'),
(24, 'Perpignan-Rivesaltes (Llabanère) Airport', 'LFMP', 42.74039840698242, 2.8706700801849365, 'Perpignan/Rivesaltes'),
(25, 'Ajaccio-Napoléon Bonaparte Airport', 'LFKJ', 41.92359924316406, 8.8029203414917, 'Ajaccio/Napoléon Bonaparte'),
(26, 'Calvi-Sainte-Catherine Airport', 'LFKC', 42.5244444, 8.7930556, 'Calvi/Sainte-Catherine'),
(27, 'Tours-Val-de-Loire Airport', 'LFOT', 47.4322013855, 0.727605998516, 'Tours/Val de Loire (Loire Valley)'),
(28, 'Annecy-Haute-Savoie-Mont Blanc Airport', 'LFLP', 45.9308333, 6.1063889, 'Annecy/Meythet'),
(29, 'Clermont-Ferrand Auvergne Airport', 'LFLC', 45.7867012024, 3.1691699028, 'Clermont-Ferrand/Auvergne'),
(30, 'Figari Sud-Corse Airport', 'LFKF', 41.5005989074707, 9.097780227661133, 'Figari Sud-Corse'),
(31, 'Calais-Dunkerque Airport', 'LFAC', 50.962100982666016, 1.954759955406189, 'Calais/Dunkerque'),
(32, 'Limoges Airport', 'LFBL', 45.86280059814453, 1.1794400215148926, 'Limoges/Bellegarde'),
(33, 'Toulon-Hyères Airport', 'LFTH', 43.0973014832, 6.14602994919, 'Toulon/Hyères/Le Palyvestre'),
(34, 'Deauville-Saint-Gatien Airport', 'LFRG', 49.3652992249, 0.154305994511, 'Deauville'),
(35, 'Dinard-Pleurtuit-Saint-Malo Airport', 'LFRD', 48.58769989013672, -2.0799601078033447, 'Dinard/Pleurtuit/Saint-Malo'),
(36, 'Bergerac-Roumanière Airport', 'LFBE', 44.82529830932617, 0.5186110138893127, 'Bergerac/Roumanière'),
(37, 'Poitiers-Biard Airport', 'LFBI', 46.58769989013672, 0.30666598677635193, 'Poitiers/Biard'),
(38, 'Toussus-le-Noble Airport', 'LFPN', 48.75189971923828, 2.1061899662017822, 'Toussus-le-Noble'),
(39, 'Troyes-Barberey Airport', 'LFQB', 48.322102, 4.0167, 'Troyes/Barberey'),
(40, 'Grenoble Le Versoud Airport', 'LFLG', 45.219200134277344, 5.849720001220703, 'Bourges'),
(41, 'Biarritz-Anglet-Bayonne Airport', 'LFBZ', 43.4683333, -1.5311111, 'Biarritz/Anglet/Bayonne'),
(42, 'Pau Pyrénées Airport', 'LFBP', 43.380001068115234, -0.41861099004745483, 'Pau/Pyrénées (Uzein)'),
(43, 'Pontoise - Cormeilles-en-Vexin Airport', 'LFPT', 49.0966667, 2.0408333, 'Cormeilles-en-Vexin'),
(44, 'Rennes-Saint-Jacques Airport', 'LFRN', 48.069499969499994, -1.73478996754, 'Rennes/Saint-Jacques'),
(45, 'Saint-Étienne-Bouthéon Airport', 'LFMH', 45.54059982299805, 4.296390056610107, 'Saint-Étienne/Bouthéon'),
(46, 'Annemasse Airport', 'LFLI', 46.1920013428, 6.268390178680001, 'Annemasse'),
(47, 'Propriano Airport', 'LFKO', 41.66059875488281, 8.889749526977539, 'Propriano'),
(48, 'Nîmes-Arles-Camargue Airport', 'LFTW', 43.75740051269531, 4.4163498878479, 'Nîmes/Garons'),
(49, 'Béziers-Vias Airport', 'LFMU', 43.32350158691406, 3.3538999557495117, 'Béziers/Vias'),
(50, 'Brest Bretagne Airport', 'LFRB', 48.447898864746094, -4.418540000915527, 'Brest/Guipavas'),
(51, 'Caen-Carpiquet Airport', 'LFRK', 49.173301696777344, -0.44999998807907104, 'Caen/Carpiquet'),
(52, 'Tarbes-Lourdes-Pyrénées Airport', 'LFBT', 43.1786994934082, -0.006438999902456999, 'Tarbes/Lourdes/Pyrénées'),
(53, 'Colmar-Houssen Airport', 'LFGA', 48.109901428222656, 7.359010219573975, 'Colmar/Houssen'),
(54, 'Le Castellet Airport', 'LFMQ', 43.252498626708984, 5.785190105438232, 'Le Castellet'),
(55, 'Nevers-Fourchambault Airport', 'LFQG', 47.002601623535156, 3.1133298873901367, 'Nevers/Fourchambault'),
(56, 'Saint-Cyr-l\'École Airport', 'LFPZ', 48.8114013671875, 2.0747199058532715, 'Villacoublay'),
(57, 'Dole-Tavaux Airport', 'LFGJ', 47.042686, 5.435061, 'Dole/Tavaux'),
(58, 'Valence-Chabeuil Airport', 'LFLU', 44.9216, 4.9699, 'Valence/Chabeuil'),
(59, 'Carpentras Airport', 'LFNH', 44.02980041503906, 5.078060150146484, 'Carpentras'),
(60, 'Courchevel Airport', 'LFLJ', 45.39670181274414, 6.6347198486328125, 'Courcheval'),
(61, 'Aérodrome de Vinon', 'LFNF', 43.737801, 5.78417, 'Vinon-sur-Verdon'),
(62, 'Rouen Airport', 'LFOP', 49.38420104980469, 1.1748000383377075, 'Rouen/Vallée de Seine'),
(63, 'Saint-Nazaire-Montoir Airport', 'LFRZ', 47.3105556, -2.1566667, 'Saint-Nazaire/Montoir'),
(64, 'Nancy-Essey Airport', 'LFSN', 48.692100524902344, 6.230460166931152, 'Nancy/Essey'),
(65, 'Dijon-Bourgogne Airport', 'LFSD', 47.268901825, 5.09000015259, 'Dijon/Longvic'),
(66, 'Auxerre-Branches Airport', 'LFLA', 47.85020065307617, 3.497109889984131, 'Auxerre/Branches'),
(67, 'Mâcon-Charnay Airport', 'LFLM', 46.295101, 4.79577, 'Mâcon/Charnay'),
(68, 'Mende-Brenoux Airport', 'LFNB', 44.50210189819336, 3.532819986343384, 'Mende/Brénoux'),
(69, 'Gap - Tallard Airport', 'LFNA', 44.45500183105469, 6.037779808044434, 'Avignon'),
(70, 'Bourg-Ceyzériat Airport', 'LFHS', 46.20090103149414, 5.292029857635498, 'Bourg/Ceyzériat'),
(71, 'Dijon Darois Airport', 'LFGI', 47.38690185546875, 4.948060035705566, 'Colmar'),
(72, 'Montpellier Candillargues Airport', 'LFNG', 43.61029815673828, 4.070280075073242, 'Mende'),
(73, 'Lognes Emerainville Airport', 'LFPL', 48.821028, 2.625967, 'Paris'),
(74, 'Ruoms Airport', 'LFHF', 44.4453010559082, 4.333889961242676, 'Verdun'),
(75, 'Megève Airport', 'LFHM', 45.82080078125, 6.652219772338867, 'Verdun'),
(76, 'Aurillac Airport', 'LFLW', 44.89139938354492, 2.4219400882720947, 'Aurillac'),
(77, 'Quimper-Cornouaille Airport', 'LFRQ', 47.974998474121094, -4.167789936065674, 'Quimper/Pluguffan'),
(78, 'Châlons-Vatry Air Base', 'LFOK', 48.776100158691406, 4.184490203857422, 'Châlons/Vatry'),
(79, 'Vichy-Charmeil Airport', 'LFLV', 46.169700622558594, 3.4037399291992188, 'Vichy/Charmeil'),
(80, 'Abbeville', 'LFOI', 50.143501, 1.831891, 'Abbeville'),
(81, 'Aérodrome de Saint-Rambert-d\'Albon', 'LFLR', 45.2561, 4.82583, 'Albon'),
(82, 'Aix-en-Provence (BA 114) Airport', 'LFMA', 43.5056, 5.36778, 'Aix Les Milles'),
(83, 'Montélimar - Ancône Airport', 'LFLQ', 44.583599, 4.74056, 'Annecy'),
(84, 'Besançon-La Vèze Airport', 'LFQM', 47.2066, 6.083681, 'Besançon/La Vèze'),
(85, 'Oyonnax-Arbent Airport', 'LFLK', 46.27920150756836, 5.667500019073486, 'Chalon'),
(86, 'Chambéry-Challes-les-Eaux Airport', 'LFLE', 45.5611000061, 5.975759983060001, 'Chambéry/Challes-les-Eaux'),
(87, 'Cuers-Pierrefeu Airport', 'LFTF', 43.247798919677734, 6.126699924468994, 'Cuers/Pierrefeu'),
(88, 'Quiberon Airport', 'LFEQ', 47.482200622558594, -3.0999999046325684, 'Pontivy'),
(89, 'Orléans-Saint-Denis-de-l\'Hôtel Airport', 'LFOZ', 47.8969, 2.16333, 'Saint-Denis-de-l\'Hôtel'),
(90, 'Toulouse-Lasbordes Airport', 'LFCL', 43.58610153198242, 1.499169945716858, 'Toulouse/Lasbordes'),
(91, 'Villefranche-Tarare Airport', 'LFHV', 45.919983, 4.634931, 'Villefranche/Tarare'),
(92, 'Metz-Nancy-Lorraine Airport', 'LFJL', 48.9821014404, 6.25131988525, 'Metz / Nancy'),
(93, 'Rodez-Marcillac Airport', 'LFCR', 44.407901763916016, 2.4826700687408447, 'Rodez/Marcillac'),
(94, 'Agen-La Garenne Airport', 'LFBA', 44.17470169067383, 0.5905560255050659, 'Agen/La Garenne'),
(95, 'Cherbourg-Maupertus Airport', 'LFRC', 49.65010070800781, -1.4702800512313843, 'Cherbourg/Maupertus'),
(96, 'Lannion-Côte de Granit Airport', 'LFRO', 48.754398345947266, -3.4716598987579346, 'Lannion'),
(97, 'Le Havre Octeville Airport', 'LFOH', 49.53390121459961, 0.08805599808692932, 'Le Havre/Octeville'),
(98, 'Castres-Mazamet Airport', 'LFCK', 43.55630111694336, 2.289180040359497, 'Castres/Mazamet'),
(99, 'Épinal-Mirecourt Airport', 'LFSG', 48.32500076293945, 6.069980144500732, 'Épinal/Mirecourt'),
(100, 'Montluçon-Guéret Airport', 'LFBK', 46.222599029541016, 2.363960027694702, 'Montluçon/Guéret'),
(101, 'Charleville-Mézières Airport', 'LFQV', 49.78390121459961, 4.647079944610596, 'Charleville-Mézières'),
(102, 'Châteauroux-Déols \"Marcel Dassault\" Airport', 'LFLX', 46.86027778, 1.7211111, 'Châteauroux/Déols'),
(103, 'La Môle Airport', 'LFTZ', 43.20539855957031, 6.48199987411499, 'La Môle'),
(104, 'Saint-Brieuc-Armor Airport', 'LFRT', 48.5378, -2.85444, 'Saint-Brieuc/Armor'),
(105, 'Le Mans-Arnage Airport', 'LFRM', 47.94860076904297, 0.20166699588298798, 'Le Mans/Arnage'),
(106, 'Alès-Deaux Airport', 'LFMS', 44.069698, 4.14212, 'Alès/Deaux'),
(107, 'Aubenas-Ardèche Méridional Airport', 'LFHO', 44.5442008972, 4.37218999863, 'Aubenas/Ardèche Méridional'),
(108, 'Blois-Le Breuil Airport', 'LFOQ', 47.678502, 1.20884, 'Blois/Le Breuil'),
(109, 'Cahors-Lalbenque Airport', 'LFCC', 44.35139846801758, 1.4752800464630127, 'Cahors/Lalbenque'),
(110, 'Laval-Entrammes Airport', 'LFOV', 48.03139877319336, -0.7429860234260559, 'Laval/Entrammes'),
(111, 'Roanne-Renaison Airport', 'LFLO', 46.05830001831055, 4.001389980316162, 'Roanne/Renaison'),
(112, 'Méribel Altiport', 'LFKX', 45.407003, 6.577942, 'Les Allues'),
(113, 'Château-Arnoux-Saint-Auban Airport', 'LFMX', 44.060001373291016, 5.991390228271484, 'Avignon'),
(114, 'Strasbourg Neuhof Airport', 'LFGC', 48.55440139770508, 7.778059959411621, 'Colmar'),
(115, 'Corte Airport', 'LFKT', 42.29359817504883, 9.193059921264648, 'Corte'),
(116, 'Dinan - Trélivan Airport', 'LFEB', 48.444400787353516, -2.1013898849487305, 'Dinan'),
(117, 'Graulhet-Montdragon Airport', 'LFCQ', 43.77109909057617, 2.0108299255371094, 'Graulhet/Montdragon'),
(118, 'Altiport L\'Alpe d\'Huez - Henri GIRAUD', 'LFHU', 45.088299, 6.08472, 'L\'Alpe d\'Huez'),
(119, 'Les Sables-d\'Olonne Talmont Airport', 'LFOO', 46.476898193359375, -1.7227799892425537, 'Les Sables-d\'Olonne'),
(120, 'Uzès Airport', 'LFNU', 44.08470153808594, 4.395279884338379, 'Mende'),
(121, 'Corlier Airport', 'LFJD', 46.03969955444336, 5.4969401359558105, 'Moulins'),
(122, 'Biscarrosse Parentis Airport', 'LFBS', 44.36940002441406, -1.130560040473938, 'Muret'),
(123, 'Chelles le Pin Airport', 'LFPH', 48.89780044555664, 2.6075000762939453, 'Paris'),
(124, 'Pontarlier Airport', 'LFSP', 46.90399932861328, 6.3273701667785645, 'Pontarlier'),
(125, 'Sedan Douzy Airport', 'LFSJ', 49.659698486328125, 5.037779808044434, 'St Dizier'),
(126, 'Pierrelatte Airport', 'LFHD', 44.39889907836914, 4.71806001663208, 'Verdun'),
(127, 'Le Puy-Loudes Airport', 'LFHP', 45.0806999206543, 3.762890100479126, 'Le Puy/Loudes'),
(128, 'Lorient South Brittany (Bretagne Sud) Airport', 'LFRH', 47.76060104370117, -3.440000057220459, 'Lorient/Lann/Bihoué'),
(129, 'Île d\'Yeu Airport', 'LFEY', 46.71860122680664, -2.3911099433898926, 'Île d\'Yeu'),
(130, 'Saint-Yan Airport', 'LFLN', 46.412498474121094, 4.0132598876953125, 'Saint-Yan'),
(131, 'La Roche-sur-Yon Airport', 'LFRI', 46.701900482177734, -1.3786300420761108, 'La Roche-sur-Yon/Les Ajoncs'),
(132, 'Albi-Le Séquestre Airport', 'LFCI', 43.91389846801758, 2.1130599975585938, 'Albi/Le Séquestre'),
(133, 'Merville-Calonne Airport', 'LFQT', 50.61840057373047, 2.642240047454834, 'Merville/Calonne'),
(134, 'Salon-de-Provence (BA 701) Air Base', 'LFMY', 43.60639953613281, 5.109250068664551, 'Salon'),
(135, 'Ambérieu Air Base (BA 278)', 'LFXA', 45.987301, 5.32844, 'Ambérieu'),
(136, 'Amiens-Glisy Airport', 'LFAY', 49.873004, 2.387074, 'Amiens/Glisy'),
(137, 'Auch-Lamothe Airport', 'LFDH', 43.687801, 0.601667, 'Auch/Lamothe'),
(138, 'Chalon-Champforgeuil Airport', 'LFLH', 46.82609939575195, 4.817629814147949, 'Chalon/Champforgueil'),
(139, 'Maubeuge-Élesmes Airport', 'LFQJ', 50.31050109863281, 4.033120155334473, 'Maubeuge/Élesmes'),
(140, 'Niort-Souché Airport', 'LFBN', 46.313477, -0.394529, 'Niort/Souché'),
(141, 'Saumur-Saint-Florent Airport', 'LFOD', 47.256802, -0.115142, 'Saumur/Saint-Florent'),
(142, 'Verdun-Le Rozelier Airfield', 'LFGW', 49.122398, 5.46905, 'Verdun'),
(143, 'Briare Chatillon Airport', 'LFEI', 47.614399, 2.78194, 'Briare'),
(144, 'Pons Avy Airport', 'LFCP', 45.57, -0.515, 'Avy'),
(145, 'Jonzac Neulles Airport', 'LFCJ', 45.48419952392578, -0.42138901352882385, 'Albi'),
(146, 'Albertville Airport', 'LFKA', 45.627201, 6.32972, 'Angers'),
(147, 'Eu Mers Le Treport Airport', 'LFAE', 50.06919860839844, 1.426669955253601, 'Calais-Dunkerque'),
(148, 'Nîmes Courbessac Airport', 'LFME', 43.85390090942383, 4.413609981536865, 'Cannes'),
(149, 'Fayence Airport', 'LFMF', 43.6088981628418, 6.702779769897461, 'Cannes'),
(150, 'Castelnaudary Villeneuve Airport', 'LFMW', 43.312199, 1.92111, 'Castelnaudary Villeneuve'),
(151, 'Dreux Vernouillet Airport', 'LFON', 48.70669937133789, 1.362779974937439, 'Chalons'),
(152, 'Meaux Esbly Airport', 'LFPE', 48.927799224853516, 2.835279941558838, 'Creil'),
(153, 'Bernay – St Martin Airport', 'LFPD', 49.102798461899994, 0.566667020321, 'Creil'),
(154, 'Épinal Dogneville Airport', 'LFSE', 48.21189880371094, 6.449170112609863, 'Dijon'),
(155, 'Étampes Mondésir Airport', 'LFOX', 48.381901, 2.07528, 'Guillerval'),
(156, 'Haguenau Airport', 'LFSH', 48.7943000793, 7.81760978699, 'Haguenau'),
(157, 'Lézignan-Corbières Airport', 'LFMZ', 43.17580032348633, 2.7341699600219727, 'Lézignan-Corbières'),
(158, 'Lunéville-Croismare Airport', 'LFQC', 48.593299865722656, 6.543459892272949, 'Lunéville/Croismare'),
(159, 'Mont-Dauphin - St-Crépin Airport', 'LFNC', 44.701698, 6.60028, 'Mende'),
(160, 'Salon Eyguières Airport', 'LFNE', 43.65829849243164, 5.013609886169434, 'Mende'),
(161, 'Millau-Larzac Airport', 'LFCM', 43.98929977416992, 3.183000087738037, 'Millau/Larzac'),
(162, 'Aubenasson Airport', 'LFJF', 44.69449996948242, 5.1511101722717285, 'Moulins'),
(163, 'Moulins-Montbeugny Airport', 'LFHY', 46.53459930419922, 3.423719882965088, 'Moulins/Montbeugny'),
(164, 'Muret-Lherm Airport', 'LFBR', 43.44889831542969, 1.2633299827575684, 'Muret/Lherm'),
(165, 'Persan Beaumont Airport', 'LFPA', 49.16579818725586, 2.3130600452423096, 'Orleans'),
(166, 'Le Plessis Belleville Airport', 'LFPP', 49.11000061035156, 2.7380599975585938, 'Paris'),
(167, 'Le Blanc Airport', 'LFEL', 46.62080001831055, 1.087499976158142, 'Pontivy'),
(168, 'Reims-Prunay Airport', 'LFQA', 49.20869827270508, 4.156579971313477, 'Reims/Prunay'),
(169, 'Montendre Marcillac Airport', 'LFDC', 45.27439880371094, -0.45222198963165283, 'Royan'),
(170, 'Épernay Plivot Airport', 'LFSW', 49.00529861450195, 4.086939811706543, 'Strasbourg'),
(171, 'Ouessant Airport', 'LFEC', 48.463199615478516, -5.06358003616333, 'Ushant'),
(172, 'Romans - Saint-Paul Airport', 'LFHE', 45.06610107421875, 5.103330135345459, 'Verdun'),
(173, 'Chavenay Villepreux Airport', 'LFPX', 48.84360122680664, 1.9822200536727905, 'Villacoublay'),
(175, 'Angoulême-Brie-Champniers Airport', 'LFBU', 45.72919845581055, 0.22145600616931915, 'Angoulême/Brie/Champniers'),
(176, 'Villacoublay-Vélizy (BA 107) Air Base', 'LFPV', 48.7741667, 2.1916667, 'Villacoublay/Vélizy'),
(177, 'Cazaux (BA 120) Air Base', 'LFBC', 44.53329849243164, -1.125, 'Cazaux (La Teste-de-Buch)'),
(178, 'Phalsbourg-Bourscheid Air Base', 'LFQP', 48.7680556, 7.205, 'Phalsbourg/Bourscheid'),
(179, 'Orléans-Bricy (BA 123) Air Base', 'LFOJ', 47.9878005981, 1.7605600357100002, 'Orléans/Bricy'),
(180, 'Périgueux-Bassillac Airport', 'LFBX', 45.19810104370117, 0.815555989742279, 'Périgueux/Bassillac'),
(181, 'Rochefort-Saint-Agnant (BA 721) Airport', 'LFDN', 45.88779830932617, -0.9830560088157654, 'Rochefort/Saint-Agnant'),
(182, 'Le Luc-Le Cannet Airport', 'LFMC', 43.384700775146484, 6.387139797210693, 'Le Luc/Le Cannet'),
(183, 'Nancy-Ochey (BA 133) Air Base', 'LFSO', 48.583099365234375, 5.954999923706055, 'Nancy/Ochey'),
(184, 'Arcachon-La Teste-de-Buch Airport', 'LFCH', 44.596401, -1.11083, 'Arcachon/La Teste-de-Buch'),
(185, 'Beaune-Challanges Airport', 'LFGF', 47.005901, 4.89342, 'Beaune/Challanges'),
(186, 'Bourges Airport', 'LFLD', 47.058101654052734, 2.3702800273895264, 'Bourges'),
(187, 'Granville Airport', 'LFRF', 48.88309860229492, -1.564170002937317, 'Granville'),
(188, 'La Baule-Escoublac Airport', 'LFRE', 47.289398193359375, -2.3463900089263916, 'La Baule-Escoublac'),
(189, 'Libourne-Artigues-de-Lussac Airport', 'LFDI', 44.982498, -0.134722, 'Libourne/Artigues-de-Lussac'),
(190, 'Montauban Airport', 'LFDB', 44.025699615478516, 1.3780399560928345, 'Montauban'),
(191, 'Morlaix-Ploujean Airport', 'LFRU', 48.6031990051, -3.81577992439, 'Morlaix/Ploujean'),
(192, 'Royan-Médis Airport', 'LFCY', 45.62810134887695, -0.9725000262260437, 'Royan/Médis'),
(193, 'Valenciennes-Denain Airport', 'LFAV', 50.325801849365234, 3.4612600803375244, 'Valenciennes/Denain'),
(194, 'Vannes-Meucon Airport', 'LFRV', 47.72330093383789, -2.718559980392456, 'Monterblanc'),
(195, 'Sarlat Domme Airfield', 'LFDS', 44.793301, 1.24472, 'Domme'),
(196, 'St Florentin Cheu Airfield', 'LFGP', 47.98019, 3.775583, 'Jaulges'),
(197, 'Lons Le Saulnier Courlaoux Airfield', 'LFGL', 46.676102, 5.47111, 'Courlaoux'),
(198, 'Nancy Malzeville Glider Field', 'LFEZ', 48.7244, 6.20778, 'Nancy'),
(199, 'Sarrebourg Buhl Airfield', 'LFGT', 48.717087, 7.074805, 'Buhl-Lorraine'),
(200, 'Sarreguemines Neunkirch Airfield', 'LFGU', 49.128101, 7.10833, 'Frauenberg'),
(201, 'St Pierre d\'Oléron Airfield', 'LFDP', 45.959202, -1.31611, 'Saint-Pierre-d\'Oléron'),
(202, 'Couhé Vérac Airfield', 'LFDV', 46.2728, 0.190556, 'Couhé'),
(203, 'Altiport de La Motte Chalancon', 'LFJE', 44.4958, 5.40285, 'La Motte-Chalancon'),
(204, 'Aire-sur-l\'Adour Airport', 'LFDA', 43.70940017700195, -0.245278000831604, 'Aire-sur-Adour'),
(205, 'Lyon Brindas Airport', 'LFKL', 45.711700439453125, 4.697780132293701, 'Ajaccio'),
(206, 'La Tour Du Pin Airport', 'LFKP', 45.560001373291016, 5.3847198486328125, 'Ajaccio'),
(207, 'Albert-Bray Airport', 'LFAQ', 49.9715003967, 2.69765996933, 'Albert/Bray'),
(208, 'Ancenis Airport', 'LFFI', 47.40810012817383, -1.1775000095367432, 'Ancenis'),
(209, 'Soissons - Courmelles Airport', 'LFJS', 49.34579849243164, 3.284169912338257, 'Angers'),
(210, 'Avranches Le Val St Père Airport', 'LFRW', 48.661701, -1.40444, 'Avranches'),
(211, 'Bagnères De Luchon Airport', 'LFCB', 42.79999923706055, 0.6000000238418579, 'Biarritz'),
(212, 'Châtellerault Airport', 'LFCA', 46.781399, 0.551944, 'Biarritz'),
(213, 'St Valéry Vittefleur Airport', 'LFOS', 49.83610153198242, 0.6549999713897705, 'Blois'),
(214, 'Andernos Les Bains Airport', 'LFCD', 44.756099700927734, -1.063330054283142, 'Cahors'),
(215, 'Dunkerque les Moeres Airfield', 'LFAK', 51.0406, 2.55028, 'Calais-Dunkerque'),
(216, 'Compiègne Margny Airport', 'LFAD', 49.43439865112305, 2.80610990524292, 'Calais-Dunkerque'),
(217, 'Saint-Jean-en-Royans Airport', 'LFKE', 45.027801513671875, 5.309999942779541, 'Calvi'),
(218, 'Châlons Ecury Sur Coole Airport', 'LFQK', 48.90610122680664, 4.354169845581055, 'Cambrai'),
(219, 'L\'aigle St Michel Airport', 'LFOL', 48.759700775146484, 0.6591669917106628, 'Chalons'),
(220, 'Saverne Steinbourg Airport', 'LFQY', 48.75419998168945, 7.426390171051025, 'Charleville-Mezieres'),
(221, 'Chartres – Métropole Airport', 'LFOR', 48.4589, 1.52389, 'Chartres / Champhol'),
(222, 'St Aubin Airport', 'LFAB', 49.88249969482422, 1.085279941558838, 'Dieppe'),
(223, 'Alençon Valframbert Airport', 'LFOF', 48.447498, 0.109167, 'Evreux'),
(224, 'Ghisonaccia Alzitone Airport', 'LFKG', 42.05500030517578, 9.40194034576416, 'Figari/Sud Corse'),
(225, 'Gaillac Lisle Sur Tarn Airport', 'LFDG', 43.88389968869999, 1.87556004524, 'Gaillac'),
(226, 'Tournus Cuisery Airport', 'LFFX', 46.562801361083984, 4.976669788360596, 'Guiscriff'),
(227, 'Nancy Azelot Airport', 'LFEX', 48.59280014038086, 6.241109848022461, 'Guiscriff'),
(228, 'St André De L\'eure Airport', 'LFFD', 48.89860153198242, 1.2505600452423096, 'Guiscriff'),
(229, 'Château-Thierry - Belleau Airport', 'LFFH', 49.06719970703125, 3.3569400310516357, 'Guiscriff'),
(230, 'Puimoisson Airport', 'LFTP', 43.87030029296875, 6.164720058441162, 'Hyeres'),
(231, 'Joigny Airport', 'LFGK', 47.9921989440918, 3.3922200202941895, 'Joigny'),
(232, 'Barcelonnette - Saint-Pons Airport', 'LFMR', 44.387198, 6.609186, 'Le Castellet'),
(233, 'Feurs Chambéon Airport', 'LFLZ', 45.7036018371582, 4.201109886169434, 'Lyon'),
(234, 'Marmande-Virazeil Airport', 'LFDM', 44.4989013671875, 0.20051400363445282, 'Marmande/Virazeil'),
(235, 'Avignon Pujaut Airport', 'LFNT', 43.99689865112305, 4.755559921264648, 'Mende'),
(236, 'Valréas Visan Airport', 'LFNV', 44.33689880371094, 4.908060073852539, 'Mende'),
(237, 'Sarre Union Airport', 'LFQU', 48.95140075683594, 7.077779769897461, 'Merville'),
(238, 'Mimizan Airport', 'LFCZ', 44.145928, -1.16432, 'Mimizan'),
(239, 'Mortagne Au Perche Airport', 'LFAX', 48.540298, 0.533889, 'Mortagne'),
(240, 'Peyresourde Balestas Airport', 'LFIP', 42.79690170288086, 0.43555599451065063, 'Moulins'),
(241, 'Chalais Airport', 'LFIH', 45.26810073852539, 0.016944000497460365, 'Moulins'),
(242, 'St Jean D\'angély Airport', 'LFIY', 45.966400146484375, -0.5252779722213745, 'Moulins'),
(243, 'Marennes Le Bournet Airport', 'LFJI', 45.82500076293945, -1.0766700506210327, 'Moulins'),
(244, 'Sallanches Airport', 'LFHZ', 45.95389938354492, 6.639170169830322, 'Moulins'),
(245, 'Mulhouse-Habsheim Airport', 'LFGB', 47.74129867553711, 7.4322099685668945, 'Mulhouse/Habsheim'),
(246, 'Nangis-Les Loges Airport', 'LFAI', 48.59619903564453, 3.0067899227142334, 'Nangis/Les Loges'),
(247, 'Soulac Sur Mer Airport', 'LFDK', 45.494998931884766, -1.0822199583053589, 'Pamiers'),
(248, 'Fontenay Trésigny Airport', 'LFPQ', 48.70719909667969, 2.904439926147461, 'Paris'),
(249, 'Aérodrome du Plan-de-Dieu - Orange', 'LF51', 44.18, 4.91889, 'Plan-de-Dieu'),
(250, 'St Junien Airport', 'LFBJ', 45.90330123901367, 0.9200000166893005, 'Poitiers'),
(251, 'Tours Sorigny Airport', 'LFEN', 47.26750183105469, 0.7011110186576843, 'Pontivy'),
(252, 'Redon Bains-sur-Oust Airport', 'LFER', 47.69940185546875, -2.036669969558716, 'Redon'),
(253, 'Aérodrome de Ribérac-Tourette', 'LFIK', 45.238667, 0.264798, 'Ribérac'),
(254, 'Fumel Montayral Airport', 'LFDX', 44.463600158691406, 1.0077799558639526, 'Rochefort'),
(255, 'Bordeaux Yvrac Airport', 'LFDY', 44.877201080322266, -0.47916701436042786, 'Rochefort'),
(256, 'Belle Ile Airport', 'LFEA', 47.326698303222656, -3.1983299255371094, 'Rochefort'),
(257, 'Ste Foy La Grande Airport', 'LFDF', 44.853599548339844, 0.1766670048236847, 'Royan'),
(258, 'Égletons Airport', 'LFDE', 45.4213981628418, 2.06889009475708, 'Royan'),
(259, 'Saint Omer Wizernes Airfield', 'LFQN', 50.7294444, 2.2358333, 'Saint Omer'),
(260, 'Saint-Flour-Coltines Airport', 'LFHQ', 45.07640075683594, 2.99360990524292, 'Saint-Flour/Coltines'),
(261, 'Semur En Auxois Airfield', 'LFGQ', 47.481899, 4.34417, 'Semur En Auxois'),
(262, 'Besançon–Thise Airport', 'LFSA', 47.274700164799995, 6.084169864650001, 'St Nazaire'),
(263, 'Mourmelon Airport', 'LFXM', 49.11140060424805, 4.366940021514893, 'St Pierre I'),
(264, 'Les Mureaux Airport', 'LFXU', 48.99829864501953, 1.9427800178527832, 'St Pierre I'),
(265, 'Ste Léocadie Airport', 'LFYS', 42.447200775146484, 2.0108299255371094, 'St Pierre I'),
(266, 'Saintes Thénac Airport', 'LFXB', 45.701900482177734, -0.6361110210418701, 'St Pierre I'),
(267, 'Pont St Vincent Airport', 'LFSV', 48.60139846801758, 6.057779788970947, 'Strasbourg'),
(268, 'Til Châtel Airfield', 'LFET', 47.547501, 5.21194, 'Til Châtel'),
(269, 'Nuits St Georges Airport', 'LFGZ', 47.14310073852539, 4.969170093536377, 'Verdun'),
(270, 'Champagnole Crotenay Airport', 'LFGX', 46.764400482177734, 5.82082986831665, 'Verdun'),
(271, 'Pérouges - Meximieux Airport', 'LFHC', 45.86970138549805, 5.187220096588135, 'Verdun'),
(272, 'Vienne Reventin Airport', 'LFHH', 45.464199, 4.82944, 'Verdun'),
(273, 'Morestel Airport', 'LFHI', 45.687801361083984, 5.453609943389893, 'Verdun'),
(274, 'Bellegarde-Vouvray Airport', 'LFHN', 46.12419891357422, 5.80610990524292, 'Verdun'),
(275, 'Villeneuve-sur-Lot Airport', 'LFCW', 44.39690017700195, 0.7588890194892883, 'Villeneuve-sur-Lot'),
(276, 'Avord (BA 702) Air Base', 'LFOA', 47.053299, 2.6325, 'Avord'),
(277, 'Angers-Loire Airport', 'LFJR', 47.560298919677734, -0.3122220039367676, 'Angers/Marcé'),
(278, 'Mont-de-Marsan (BA 118) Air Base', 'LFBM', 43.911701, -0.5075, 'Mont-de-Marsan'),
(279, 'Évreux-Fauville (BA 105) Air Base', 'LFOE', 49.02870178222656, 1.2198599576950073, 'Évreux/Fauville'),
(280, 'Luxeuil-Saint-Sauveur (BA 116) Air Base', 'LFSX', 47.7830556, 6.36416667, 'Luxeuil/Saint-Sauveur'),
(281, 'Melun-Villaroche Air Base', 'LFPM', 48.604698181152344, 2.6711199283599854, 'Melun/Villaroche'),
(282, 'Istres Le Tubé/Istres Air Base (BA 125) Airport', 'LFMI', 43.522701, 4.92384, 'Istres/Le Tubé'),
(283, 'Orange-Caritat (BA 115) Air Base', 'LFMO', 44.140499114990234, 4.866720199584961, 'Orange/Caritat'),
(284, 'Cognac-Châteaubernard (BA 709) Air Base', 'LFBG', 45.65829849243164, -0.3174999952316284, 'Cognac/Châteaubernard'),
(285, 'Creil Air Base', 'LFPC', 49.253501892089844, 2.5191400051116943, 'Creil'),
(286, 'Landivisiau Air Base', 'LFRJ', 48.53030014038086, -4.151639938354492, 'Landivisiau'),
(287, 'Saint-Dizier-Robinson (BA 113) Air Base', 'LFSI', 48.63600158691406, 4.899419784545898, 'Saint-Dizier/Robinson'),
(288, 'Toulouse-Francazal (BA 101) Air Base', 'LFBF', 43.54560089111328, 1.3674999475479126, 'Toulouse/Francazal'),
(289, 'Châteaudun (BA 279) Air Base', 'LFOC', 48.058102, 1.37662, 'Châteaudun'),
(290, 'Cholet Le Pontreau Airport', 'LFOU', 47.08209991455078, -0.8770639896392822, 'Cholet/Le Pontreau'),
(291, 'Étain-Rouvres Air Base', 'LFQE', 49.226898193359375, 5.672220230102539, 'Étain/Rouvres'),
(292, 'Lanvéoc-Poulmic Air Base', 'LFRL', 48.281700134277344, -4.4450201988220215, 'Lanvéoc/Poulmic'),
(293, 'Montbéliard-Courcelles Airfield', 'LFSM', 47.487, 6.79054, 'Montbéliard/Courcelles'),
(294, 'Péronne-Saint-Quentin Airport', 'LFAG', 49.8685, 3.02958, 'Péronne/Saint-Quentin'),
(295, 'Saint-Girons-Antichan Airport', 'LFCG', 43.0078010559082, 1.1031500101089478, 'Saint-Girons/Antichan'),
(296, 'Solenzara (BA 126) Air Base', 'LFKS', 41.924400329589844, 9.406000137329102, 'Solenzara'),
(297, 'Vesoul-Frotey Airport', 'LFQW', 47.6376, 6.20392, 'Vesoul/Frotey'),
(298, 'Saulieu Liernais Airfield', 'LFEW', 47.239399, 4.26583, 'Liernais'),
(299, 'Montceau Les Mines Airfield', 'LFGM', 46.604198, 4.33389, 'Pouilloux'),
(300, 'Paray Le Monial Airfield', 'LFGN', 46.466381, 4.133798, 'Paray-le-Monial'),
(301, 'Pont Sur Yonne Airfield', 'LFGO', 48.289172, 3.247912, 'Gisy-les-Nobles'),
(302, 'Châtillon Sur Seine Airfield', 'LFQH', 47.843924, 4.580045, 'Châtillon-sur-Seine'),
(303, 'Cessy Baigneux les Juifs Airfield', 'LFSY', 47.609722, 4.6175, 'Saint-Dizier/Robinson'),
(304, 'Buno Bonnevaux Airfield', 'LFFB', 48.351101, 2.42556, 'Buno-Bonnevaux'),
(305, 'Mantes Chérence Airfield', 'LFFC', 49.078899, 1.68972, 'Chérence'),
(306, 'La Ferté Alais Airfield', 'LFFQ', 48.498652, 2.338867, 'Cerny'),
(307, 'Doncourt Les Conflans Airfield', 'LFGR', 49.152802, 5.93278, 'Doncourt Les Conflans'),
(308, 'Longuyon Villette Airfield', 'LFGS', 49.484402, 5.57278, 'Villette'),
(310, 'Marville Montmédy Airfield', 'LFYK', 49.459202, 5.4025, 'Longuyon'),
(311, 'Nogaro Airport', 'LFCN', 43.769699, -0.032778, 'Nogaro'),
(312, 'Vitry en Artois Airfield', 'LFQS', 50.338299, 2.99333, 'Vitry-en-Artois'),
(313, 'Châteaubriant Pouancé Airfield', 'LFTQ', 47.739562, -1.189519, 'Pouance'),
(314, 'Montdidier Airfield', 'LFAR', 49.6731, 2.56917, 'Montdidier'),
(315, 'Chauvigny Airfield', 'LFDW', 46.583599, 0.6425, 'Chauvigny'),
(316, 'St Galmier Airport', 'LFKM', 45.607200622558594, 4.305830001831055, 'Ajaccio'),
(317, 'Belley - Peyrieu Airport', 'LFKY', 45.69499969482422, 5.692780017852783, 'Ajaccio'),
(318, 'Amboise Dierre Airport', 'LFEF', 47.3414, 0.9425, 'Amboise'),
(319, 'Tours Le Louroux Airport', 'LFJT', 47.150001525878906, 0.7127779722213745, 'Angers'),
(320, 'Aspres-sur-Buëch Airport', 'LFNJ', 44.518902, 5.7375, 'Aspres sur Buëch'),
(321, 'Aubigny-sur-Nère Airport', 'LFEH', 47.480556, 2.394167, 'Aubigny-sur-Nère'),
(322, 'Autun-Bellevue Airport', 'LFQF', 46.96730041503906, 4.260570049285889, 'Autun/Bellevue'),
(323, 'Bagnoles-de-l\'Orne-Couterne Airport', 'LFAO', 48.545799255371094, -0.38744398951530457, 'Bagnoles-de-l\'Orne/Couterne'),
(324, 'Bar Le Duc Airfield', 'LFEU', 48.868301, 5.18583, 'Bar Le Duc'),
(325, 'Berck sur Mer Airport', 'LFAM', 50.4231, 1.59194, 'Berck sur Mer'),
(326, 'Lille/Marcq-en-Baroeul Airport', 'LFQO', 50.687198638916016, 3.0755600929260254, 'Besancon'),
(327, 'Bordeaux Léognan Saucats Airport', 'LFCS', 44.700298, -0.595556, 'Bordeaux-Saucats'),
(328, 'Ambert Le Poyet Airport', 'LFHT', 45.51689910888672, 3.7463901042938232, 'Bourg'),
(329, 'Brienne-le-Château Airport', 'LFFN', 48.4297981262207, 4.48222017288208, 'Brienne-le-Château'),
(330, 'Brioude Beaumont Airport', 'LFHR', 45.3250007629, 3.35916996002, 'Brioude'),
(331, 'Guéret St Laurent Airport', 'LFCE', 46.179199, 1.95833, 'Cahors'),
(332, 'Figeac Livernon Airport', 'LFCF', 44.673301696777344, 1.7891700267791748, 'Cahors'),
(333, 'Rethel Airport', 'LFAP', 49.48189926147461, 4.364719867706299, 'Calais-Dunkerque'),
(334, 'Argentan Airport', 'LFAJ', 48.710601806640625, 0.003889000043272972, 'Calais-Dunkerque'),
(335, 'Falaise Airport', 'LFAS', 48.92720031738281, -0.14472199976444244, 'Calais-Dunkerque'),
(336, 'Laon - Chambry Airport', 'LFAF', 49.59579849243164, 3.6316699981689453, 'Calais-Dunkerque'),
(337, 'Sollières Sardières Airport', 'LFKD', 45.25640106201172, 6.801390171051025, 'Calvi'),
(338, 'Lens Benifontaine Airport', 'LFQL', 50.466400146484375, 2.8197200298309326, 'Cambrai'),
(339, 'Montagne Noire Airport', 'LFMG', 43.407501220703125, 1.990280032157898, 'Cannes'),
(340, 'Cassagnes-Bégonhès Airport', 'LFIG', 44.177799224853516, 2.515000104904175, 'Cassagnes-Bégonhès'),
(341, 'Lessay Airport', 'LFOM', 49.20309829711914, -1.5066699981689453, 'Chalons'),
(342, 'Chambley', 'LF52', 49.025501251221, 5.876070022583, 'Chambley'),
(343, 'Juvancourt Airport', 'LFQX', 48.1150016784668, 4.82082986831665, 'Charleville-Mezieres'),
(344, 'Chaumont-Semoutiers Airport', 'LFJA', 48.0863, 5.04902, 'Chaumont/Semoutiers'),
(345, 'Avallon Airport', 'LFGE', 47.50310134887695, 3.899440050125122, 'Colmar'),
(346, 'Cosne Sur Loire Airport', 'LFGH', 47.360599517822266, 2.9194400310516357, 'Colmar'),
(347, 'Belfort Chaux Airport', 'LFGG', 47.70220184326172, 6.832499980926514, 'Colmar'),
(348, 'Coulommiers-Voisins Airport', 'LFPK', 48.83769989013672, 3.016119956970215, 'Coulommiers/Voisins'),
(349, 'Beynes Thiverval Airport', 'LFPF', 48.84360122680664, 1.9088900089263916, 'Creil'),
(350, 'Flers Saint Paul Airport', 'LFOG', 48.752498626708984, -0.5894439816474915, 'Evreux'),
(351, 'St Jean D\'avelanne Airport', 'LFKH', 45.516700744628906, 5.680560111999512, 'Figari/Sud Corse'),
(352, 'Gray St Adrien Airfield', 'LFEV', 47.432023, 5.619518, 'Gray St Adrien'),
(353, 'Coëtquidan Air Base', 'LFXQ', 47.94660186767578, -2.1923000812530518, 'Guer'),
(354, 'Guiscriff Scaer Airport', 'LFES', 48.0525016784668, -3.664720058441162, 'Guiscriff'),
(355, 'Bailleau Armenonville Airport', 'LFFL', 48.51580047607422, 1.6399999856948853, 'Guiscriff'),
(356, 'Pithiviers Airport', 'LFFP', 48.15719985961914, 2.192500114440918, 'Guiscriff'),
(357, 'Châteauneuf Sur Cher Airport', 'LFFU', 46.87110137939453, 2.3769400119781494, 'Guiscriff'),
(358, 'Vierzon Méreau Airport', 'LFFV', 47.194698, 2.06667, 'Guiscriff'),
(359, 'Joinville Mussey Airport', 'LFFJ', 48.38610076904297, 5.144999980926514, 'Guiscriff'),
(360, 'Bar Sur Seine Airport', 'LFFR', 48.066898345947266, 4.413609981536865, 'Guiscriff'),
(361, 'Enghien Moisselles Airport', 'LFFE', 49.0463981628418, 2.353060007095337, 'Guiscriff'),
(362, 'La Ferté Gaucher Airport', 'LFFG', 48.75579833984375, 3.276669979095459, 'Guiscriff'),
(363, 'Neufchâteau Airport', 'LFFT', 48.36249923706055, 5.7213897705078125, 'Guiscriff'),
(364, 'Étrépagny Airport', 'LFFY', 49.30609893798828, 1.6386100053787231, 'Guiscriff'),
(365, 'Fontenay Le Comte Airport', 'LFFK', 46.44139862060547, -0.7927780151367188, 'Guiscriff'),
(366, 'Montaigu St Georges Airport', 'LFFW', 46.933101654052734, -1.3255599737167358, 'Guiscriff'),
(367, 'La Grand\'combe Airport', 'LFTN', 44.24440002441406, 4.0122199058532715, 'Hyeres'),
(368, 'Serres - La Bâtie-Montsaléon Airport', 'LFTM', 44.45830154418945, 5.728330135345459, 'Hyeres'),
(369, 'Issoire Le Broc Airport', 'LFHA', 45.5149993896, 3.26749992371, 'Issoire'),
(370, 'La Flèche Thorée Les Pins Airport', 'LFAL', 47.6927778, 0.0019444444000044, 'La Flèche'),
(371, 'Le Havre St Romain Airport', 'LFOY', 49.544700622558594, 0.36111098527908325, 'Laval'),
(372, 'Saint-Quentin - Roupy Airport', 'LFOW', 49.816898345947266, 3.206670045852661, 'Laval'),
(373, 'Vauville Airport', 'LFAU', 49.62419891357422, -1.8291699886322021, 'Le Touquet'),
(374, 'Lurcy-Lévis Airport', 'LFJU', 46.713600158691406, 2.9458999633789062, 'Lurcy-Lévis'),
(375, 'Mauléon Airport', 'LFJB', 46.902801513671875, -0.6977779865264893, 'Mauléon'),
(376, 'St Martin De Londres Airport', 'LFNL', 43.80080032348633, 3.7825000286102295, 'Mende'),
(377, 'Florac Ste Enimie Airport', 'LFNO', 44.286399841308594, 3.466670036315918, 'Mende'),
(378, 'Mont Louis La Quillane Airport', 'LFNQ', 42.54359817504883, 2.119999885559082, 'Mende'),
(379, 'Puivert Airport', 'LFNW', 42.911399841308594, 2.05610990524292, 'Mende'),
(380, 'Bédarieux La Tour Airport', 'LFNX', 43.64080047607422, 3.1455600261688232, 'Mende'),
(381, 'Berre La Fare Airport', 'LFNR', 43.53779983520508, 5.178329944610596, 'Mende'),
(382, 'Aérodrome de Sistéron-Vaumeilh', 'LFNS', 44.286331, 5.928993, 'Mende'),
(383, 'St Etienne En Devoluy Airport', 'LFNY', 44.66889953613281, 5.906109809875488, 'Mende'),
(384, 'Le Mazet De Romanin Airport', 'LFNZ', 43.76890182495117, 4.893610000610352, 'Mende'),
(385, 'Oloron Herrere Airport', 'LFCO', 43.16469955444336, -0.5602779984474182, 'Millau'),
(386, 'Montluçon-Domérat Airport', 'LFLT', 46.352501, 2.57049, 'Montluçon/Domérat'),
(387, 'Belvès St Pardoux Airport', 'LFIB', 44.782501220703125, 0.9588890075683594, 'Moulins'),
(388, 'Rion Des Landes Airport', 'LFIL', 43.91579818725586, -0.949167013168335, 'Moulins'),
(389, 'Vendays Montalivet Airport', 'LFIV', 45.38059997558594, -1.1158299446105957, 'Moulins'),
(390, 'Itxassou Airport', 'LFIX', 43.337501525878906, -1.42221999168396, 'Moulins'),
(391, 'Clamecy Airport', 'LFJC', 47.43830108642578, 3.5086100101470947, 'Moulins'),
(392, 'Condom Valence Sur Baise Airport', 'LFID', 43.910301208496094, 0.3872219920158386, 'Moulins'),
(393, 'St Gaudens Montrejeau Airport', 'LFIM', 43.10860061645508, 0.620278000831604, 'Moulins'),
(394, 'Revel Montgey Airport', 'LFIR', 43.48139953613281, 1.9800000190734863, 'Moulins'),
(395, 'Toulouse Bourg St Bernard Airport', 'LFIT', 43.61220169067383, 1.7252800464630127, 'Moulins'),
(396, 'Cazeres Palaminy Airport', 'LFJH', 43.20220184326172, 1.051110029220581, 'Moulins'),
(397, 'Loudun Airport', 'LFDL', 47.037200927734375, 0.10138899832963943, 'Pamiers'),
(398, 'Pamiers-Les Pujols Airport', 'LFDJ', 43.090599060058594, 1.69582998752594, 'Pamiers/Les Pujols'),
(399, 'Dax Seyresse Airport', 'LFBY', 43.68920135498047, -1.0688899755477905, 'Perigueux'),
(400, 'Pontivy Airport', 'LFED', 48.05849838256836, -2.92182993888855, 'Pontivy'),
(401, 'Argenton Sur Creuse Airport', 'LFEG', 46.596900939941406, 1.6024999618530273, 'Pontivy'),
(402, 'Châteauroux Villers Airport', 'LFEJ', 46.84189987182617, 1.621109962463379, 'Pontivy'),
(403, 'Issoudun Le Fay Airport', 'LFEK', 46.88859939575195, 2.0413899421691895, 'Pontivy'),
(404, 'Montargis Vimory Airport', 'LFEM', 47.960601806640625, 2.6858301162719727, 'Pontivy'),
(405, 'Moret Episy Airport', 'LFPU', 48.34189987182617, 2.7994399070739746, 'Pontoise'),
(406, 'Pouilly Maconge Airport', 'LFEP', 47.221401, 4.56111, 'Pouilly'),
(407, 'Ploërmel Loyat Airport', 'LFRP', 48.00279998779297, -2.3772199153900146, 'Rennes'),
(408, 'La Réole Floudes Airport', 'LFDR', 44.56809997558594, -0.05611100047826767, 'Rochefort'),
(409, 'Lesparre St Laurent Medoc Airport', 'LFDU', 45.19779968261719, -0.8822219967842102, 'Rochefort'),
(410, 'Castelnau Magnoac Airport', 'LFDQ', 43.27939987182617, 0.5216670036315918, 'Rochefort'),
(411, 'Villefranche De Rouergue Airport', 'LFCV', 44.369998931884766, 2.028059959411621, 'Rodez'),
(412, 'Castelsarrasin Moissac Airport', 'LFCX', 44.08689880371094, 1.1283299922943115, 'Rodez'),
(413, 'Thouars Airport', 'LFCT', 46.96189880371094, -0.1527779996395111, 'Rodez'),
(414, 'Saint-Affrique-Belmont Airport', 'LFIF', 43.823299407958984, 2.7452800273895264, 'Saint-Affrique/Belmont'),
(415, 'Sézanne St Rémy Airfield', 'LFFZ', 48.710602, 3.76417, 'Sézanne'),
(416, 'Aérodrome privé de Soucelles', 'LF50', 47.580399, -0.412269, 'Soucelles'),
(417, 'Vitry Le François Vauclerc Airport', 'LFSK', 48.70330047607422, 4.6844401359558105, 'St Dizier'),
(418, 'Romorantin Pruniers Airport', 'LFYR', 47.32080078125, 1.688889980316162, 'St Pierre I'),
(419, 'Cambrai Niergnies Airport', 'LFYG', 50.14250183105469, 3.265000104904175, 'St Pierre I'),
(420, 'Langres Rolampont Airport', 'LFSU', 47.965599060058594, 5.295000076293945, 'Strasbourg'),
(421, 'Aérodrome de Tarbes Laloubère', 'LFDT', 43.216099, 0.078611, 'Tarbes'),
(422, 'Arras Roclincourt Airport', 'LFQD', 50.32389831542969, 2.8027799129486084, 'Troyes'),
(423, 'Ussel-Thalamy Airport', 'LFCU', 45.534698486328125, 2.4238901138305664, 'Ussel/Thalamy'),
(424, 'St Dié Remomeix Airport', 'LFGY', 48.2672004699707, 7.008609771728516, 'Verdun'),
(425, 'St Chamond L\'horme Airport', 'LFHG', 45.493099212646484, 4.535560131072998, 'Verdun'),
(426, 'Lyon Corbas Airport', 'LFHJ', 45.65420150756836, 4.913609981536865, 'Verdun'),
(427, 'Langogne - Lespéron Airport', 'LFHL', 44.70640182495117, 3.8883299827575684, 'Verdun'),
(428, 'Lapalisse - Périgny Airport', 'LFHX', 46.2538986206, 3.58860993385, 'Villefranche'),
(429, 'Belleville Villié Morgon Airport', 'LFHW', 46.142799377441406, 4.714719772338867, 'Villefranche'),
(430, 'Aérodrome de Villerupt', 'LFAW', 49.4114, 5.89056, 'Villerupt'),
(431, 'Saint Inglevert', 'LFIS', 50.8826083032, 1.73575687832, 'Saint-Inglevert'),
(432, 'Saint Sulpice des Landes', 'LFSS', 47.7916667, -1.643611, 'Saint-Sulpice-des-Landes');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `birthDate` date NOT NULL,
  `creationDate` datetime NOT NULL,
  `note` smallint(6) NOT NULL,
  `isACertifiedPilot` tinyint(1) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `phoneNumber`, `birthDate`, `creationDate`, `note`, `isACertifiedPilot`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(5, 'Lucas', 'Vancompernolle', '0638395545', '2013-01-01', '2018-04-16 14:47:38', 0, 1, 'Lucas', 'lucas', 'lucas@wildcodeschool.fr', 'lucas@wildcodeschool.fr', 1, NULL, '$2y$13$yzDlRt4Ozuny/OV.nlI2TOc9V8ayA.jlnLe9uPYXccfWbjzoZM2Fy', '2018-04-16 14:47:39', NULL, NULL, 'a:0:{}'),
(6, 'John', 'Smith', '0600000000', '2013-01-01', '2018-04-16 14:49:50', 0, 0, 'John', 'john', 'gaetan.role-dubruille@epitech.eu', 'gaetan.role-dubruille@epitech.eu', 1, NULL, '$2y$13$EnI/uJUCsYvmdTYkJkNuTu6nZIgclnEWrD65ZK17f.WBk2svSnBO2', '2018-04-16 14:49:50', NULL, NULL, 'a:0:{}'),
(8, 'Gaëtan', 'Rolé-Dubruille', '0614492251', '2013-01-01', '2018-04-16 15:08:08', 0, 1, 'gaetanrd', 'gaetanrd', 'gaetan@wildcodeschool.fr', 'gaetan@wildcodeschool.fr', 1, NULL, '$2y$13$RwkWGza.dxi8wZZNjkZiZuujnv9eZxF5dWcUIq71Hy0EhGwzj5JoK', '2018-04-16 15:20:28', NULL, NULL, 'a:0:{}');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C257E60E7704ED06` (`departure_id`),
  ADD KEY `IDX_C257E60E62789708` (`arrival_id`),
  ADD KEY `IDX_C257E60EF53666A8` (`plane_id`),
  ADD KEY `IDX_C257E60ECE55439B` (`pilot_id`);

--
-- Index pour la table `plane_model`
--
ALTER TABLE `plane_model`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_42C849554502E565` (`passenger_id`),
  ADD KEY `IDX_42C8495591F478C5` (`flight_id`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_794381C6AA3E2149` (`user_rated_id`),
  ADD KEY `IDX_794381C66184681A` (`review_author_id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `plane_model`
--
ALTER TABLE `plane_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `FK_C257E60E62789708` FOREIGN KEY (`arrival_id`) REFERENCES `site` (`id`),
  ADD CONSTRAINT `FK_C257E60E7704ED06` FOREIGN KEY (`departure_id`) REFERENCES `site` (`id`),
  ADD CONSTRAINT `FK_C257E60ECE55439B` FOREIGN KEY (`pilot_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_C257E60EF53666A8` FOREIGN KEY (`plane_id`) REFERENCES `plane_model` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C849554502E565` FOREIGN KEY (`passenger_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_42C8495591F478C5` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`);

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_794381C66184681A` FOREIGN KEY (`review_author_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_794381C6AA3E2149` FOREIGN KEY (`user_rated_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;