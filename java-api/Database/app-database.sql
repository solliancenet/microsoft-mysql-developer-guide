-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` bigint unsigned NOT NULL,
  `item_id` bigint unsigned NOT NULL,
  `qty` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_item_id_foreign` (`item_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `status` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `url` varchar(32) NOT NULL,
  `img` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Breakfast','breakfast','potatoes-g792cf4128_1920.jpg'),(2,'Steak','steak','tomahawk-ge5ea2413d_1920.jpg'),(3,'Pizza','pizza','pizza-g204a8b3d6_1920.jpg'),(4,'Burgers','burgers','hamburger-g685f013b8_1920.jpg'),(5,'Sushi','sushi','food-g3eb975adc_1920.jpg'),(6,'Salads','salads','salad-g3f02f56a0_1920.jpg');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `img` varchar(128) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `cooktime` smallint unsigned NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `items_category_id_foreign` (`category_id`),
  CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,'Cinnamon Roll','cinnamon-rolls-gb12ce8577_1920.jpg',1.19,13,'Cupcake ipsum dolor sit amet dragée topping topping. Powder cheesecake cake shortbread gummies lollipop jelly carrot cake. Pudding sugar plum carrot cake I love muffin. Dessert topping croissant I love tart soufflé cheesecake sweet sweet. Liquorice pie marshmallow icing topping muffin. Topping brownie oat cake carrot cake donut chocolate bar cake. Bear claw jelly-o ice cream lollipop shortbread dessert jujubes macaroon. I love danish tootsie roll powder candy canes marzipan icing gingerbread chocolate bar.'),(2,1,'Toast & Eggs','breakfast-g7a2675ee6_1920.jpg',2.19,7,'Tiramisu muffin sweet roll cotton candy icing bonbon jelly. Tiramisu oat cake shortbread toffee bonbon shortbread candy canes toffee. Sweet roll biscuit I love oat cake gummies bonbon biscuit danish lemon drops. Toffee ice cream jelly beans caramels muffin. Tart jujubes chocolate bar marshmallow gingerbread I love pie. Chocolate I love chocolate cake cake liquorice lollipop. Tiramisu chocolate jelly-o muffin halvah. Shortbread soufflé ice cream oat cake cotton candy sesame snaps liquorice. Danish marzipan I love jelly brownie muffin halvah candy canes.'),(3,1,'Croissant','croissant-ga61b1fb0e_1920.jpg',3.19,2,'I love chocolate cake I love I love jelly beans cotton candy jelly-o ice cream. Icing cotton candy sweet roll fruitcake biscuit apple pie. Gummies chocolate caramels biscuit I love I love I love cookie croissant. Topping apple pie wafer sesame snaps tootsie roll gummies. Apple pie I love wafer sweet roll tootsie roll. Cheesecake I love apple pie muffin tiramisu lemon drops cake. Macaroon caramels chocolate cotton candy soufflé tart. Chupa chups lemon drops cupcake topping pastry.'),(4,1,'Bacon & Eggs','eggs-g9c07e92b1_1920.jpg',4.19,14,'Toffee sesame snaps chupa chups pie pastry marshmallow I love tootsie roll soufflé. Marshmallow fruitcake cheesecake I love icing cake. Liquorice toffee chocolate bar marzipan cotton candy croissant powder. Bonbon I love danish bear claw tootsie roll. Candy canes wafer fruitcake caramels lollipop tart. Oat cake croissant tart gummi bears cookie muffin. Icing sweet roll chupa chups chupa chups jelly-o brownie. Jelly-o cotton candy liquorice tiramisu halvah jujubes.'),(5,1,'Pancakes','pancakes-g9d341228a_1920.jpg',5.19,12,'Chocolate caramels gingerbread dragée gingerbread brownie powder gummi bears pastry. Sugar plum sugar plum tootsie roll shortbread I love cotton candy. Chocolate cake chocolate bonbon cake biscuit. Toffee cheesecake I love cookie cake marzipan I love chocolate cake liquorice. Biscuit biscuit caramels macaroon lollipop powder tootsie roll. Shortbread jelly-o jujubes jelly-o chocolate carrot cake danish croissant. Biscuit jelly-o donut bonbon muffin carrot cake sesame snaps wafer chupa chups. Chupa chups chocolate bar bonbon I love jelly beans lemon drops macaroon muffin. Chocolate cake cookie jelly-o cake cake croissant muffin halvah candy. Apple pie icing pudding chupa chups macaroon I love biscuit fruitcake I love.'),(6,1,'Biscuits & Gravy','biscuits-g07bd069f8_1920.jpg',6.19,6,'Soufflé marshmallow I love candy canes I love apple pie. Icing wafer I love toffee carrot cake cookie candy canes bear claw pastry. Lollipop topping pudding dessert powder jujubes sesame snaps bonbon apple pie. Macaroon tootsie roll dessert cake I love wafer macaroon sweet roll sesame snaps. Wafer cupcake bear claw sweet brownie I love. Pastry I love muffin marzipan I love topping. Pie candy muffin jelly-o croissant cake sweet. Wafer chocolate lemon drops jujubes lollipop dragée I love jelly. I love macaroon I love powder tootsie roll jelly muffin wafer.'),(7,2,'Tomahawk','steak-4342500_1920.jpg',1.29,27,'Bacon ipsum dolor amet shank picanha landjaeger kevin, ham hock spare ribs sausage capicola buffalo alcatra. Short loin spare ribs alcatra bresaola. Salami tongue drumstick tenderloin flank alcatra shank sirloin biltong landjaeger short ribs jerky. Porchetta meatloaf fatback frankfurter bacon tail, ham biltong kielbasa short ribs pork capicola leberkas jowl. Chicken tenderloin kielbasa pork belly, ham hock jowl bacon salami chuck burgdoggen hamburger tongue short loin biltong. Frankfurter sirloin meatloaf ribeye.'),(8,2,'Sirloin','steak-1076665_1920.jpg',2.29,22,'Meatball fatback pastrami, porchetta doner chicken burgdoggen pancetta jerky beef ribs salami. Buffalo ball tip tenderloin chuck, frankfurter alcatra ribeye t-bone spare ribs. Hamburger pork chop swine, picanha flank corned beef burgdoggen shoulder frankfurter ham ball tip. Chicken biltong short ribs short loin spare ribs. Pork loin jerky pork chop, fatback frankfurter filet mignon turducken kevin swine. Prosciutto kielbasa short ribs shoulder frankfurter hamburger. Swine leberkas alcatra jerky, ball tip pastrami meatloaf pork belly doner venison turkey buffalo ham hock pig.'),(9,2,'T-Bone','steak-978654_1920.jpg',3.29,23,'Swine doner leberkas tri-tip pork loin hamburger cupim alcatra spare ribs kielbasa bacon. Shoulder tail alcatra meatloaf beef hamburger, short loin tri-tip cupim ham pork chop. Corned beef kevin strip steak tri-tip. Landjaeger meatball chuck biltong salami fatback jerky pastrami shank beef. Frankfurter ground round strip steak pork chop shoulder, picanha pig doner prosciutto chislic ham. Ham hock alcatra shankle chislic rump landjaeger brisket pork leberkas t-bone meatloaf pancetta pork loin.'),(10,3,'Pepperoni','pizza-1344720_1920.jpg',1.39,12,'Gouda mozzarella babybel. Jarlsberg emmental who moved my cheese cauliflower cheese brie cheesy feet airedale swiss. Port-salut bocconcini monterey jack squirty cheese cut the cheese say cheese cauliflower cheese lancashire. Who moved my cheese who moved my cheese taleggio cheesy feet cheeseburger hard cheese emmental.'),(11,3,'Margherita','pizza-3000274_1920.jpg',2.39,6,'I love cheese, especially who moved my cheese fondue. Parmesan cheese slices the big cheese cheese strings jarlsberg fromage ricotta red leicester. Queso everyone loves cheesecake everyone loves who moved my cheese red leicester fondue smelly cheese. Mozzarella goat blue castello swiss cheese slices hard cheese swiss cow. Cream cheese swiss.'),(12,4,'Sliders','hamburger-494706_1920.jpg',1.49,9,'Ribeye ball tip kevin tri-tip beef biltong. Pastrami pork belly burgdoggen, sirloin bresaola andouille flank fatback short ribs chuck shoulder tongue boudin strip steak. Bacon pancetta biltong kielbasa, cow shank sausage rump chuck spare ribs alcatra ground round meatball chicken strip steak. Sirloin andouille pig ham hock swine kielbasa salami tongue meatball cupim jowl. Cow fatback drumstick picanha ball tip. Meatloaf venison shankle rump, tail tenderloin short ribs.'),(13,4,'Charbroiled','hamburger-1238246_1920.jpg',2.49,17,'Kielbasa boudin alcatra, beef ribs spare ribs rump pork belly pork chop salami ribeye pancetta. Alcatra picanha ground round, frankfurter short loin porchetta leberkas venison cow fatback landjaeger rump boudin. Flank t-bone kielbasa burgdoggen short ribs landjaeger tenderloin ham hock pastrami. Burgdoggen turducken landjaeger, short ribs frankfurter tail brisket chuck shoulder buffalo sausage doner rump. Swine ground round ribeye ham hock tongue turducken sirloin, burgdoggen sausage shank t-bone cupim.'),(14,4,'Diner Burger','burger-3442227_1920.jpg',3.49,12,'Fatback drumstick filet mignon, frankfurter chicken pork meatloaf pork belly venison jerky beef pork loin ham hock biltong. Pork chop ham andouille ground round hamburger. Beef ribs ground round cow pig biltong short ribs sirloin spare ribs. Fatback pork chop cow filet mignon burgdoggen doner picanha swine tongue, tail corned beef meatball pancetta pork.'),(15,5,'Sashimi Fresh Roll','sushi-354628_1920.jpg',1.59,3,'Barbelless catfish eel-goby spiny eel yellowtail snapper mullet minnow white marlin northern pike bigeye? Sauger sandroller; hoki sixgill ray squawfish sailfin silverside. Olive flounder giant danio herring smelt tailor Australasian salmon barbeled houndshark southern grayling porbeagle shark roundhead.'),(16,5,'Power Fish','sushi-2853382_1920.jpg',2.59,5,'Atlantic silverside jewfish shovelnose sturgeon huchen temperate ocean-bass mullet menhaden stargazer yellowtail orangestriped triggerfish bluefin tuna. Arapaima plunderfish arapaima, mudskipper, earthworm eel snubnose eel Pacific viperfish tripletail.'),(17,5,'Spicy Tuna','sushi-599721_1920.jpg',3.59,7,'Elephantnose fish bango longjaw mudsucker; sand stargazer? Dragonet: kissing gourami tench demoiselle; bullhead shark lookdown catfish halibut tubeblenny southern flounder, hairtail gray reef shark. Long-whiskered catfish lake whitefish, worm eel Ratfish European minnow! Javelin temperate perch sandroller waryfish pikehead gouramie longnose dace starry flounder medusafish cusk-eel.'),(18,5,'Avocado Roll','maki-716432_1920.jpg',4.59,2,'Wormfish, glowlight danio Atlantic cod ide flagblenny, ribbon sawtail fish Kafue pike southern grayling. Speckled trout grayling ling nurseryfish threadfin. Snake eel char sturgeon scissor-tail rasbora blue eye worm eel southern smelt. Salmon jellynose fish, buffalofish lanternfish kaluga duckbill eel. Swampfish halosaur flashlight fish wahoo popeye catafula pirarucu; torpedo; rock beauty longnose chimaera elver thornfish, rough scad! Pipefish tompot blenny Kafue pike large-eye bream elasmobranch northern lampfish soapfish rocket danio mudskipper smalltooth sawfish.'),(19,5,'Sampler Plate','sushi-2856545_1920.jpg',5.59,4,'Poolfish waryfish frilled shark louvar, wasp fish blue catfish Molly Miller Black scalyfin gizzard shad, platyfish, common carp. Tiger shark roanoke bass milkfish yellowhead jawfish, round stingray sea bass surfperch treefish Asiatic glassfish. Silver carp scissor-tail rasbora pompano dolphinfish: frogmouth catfish mackerel shark. Perch hardhead catfish sand stargazer: goosefish wolf-herring.'),(20,5,'Veggie Roll','sushi-2020287_1920.jpg',6.59,2,'Stingray, tarpon; clown triggerfish plaice pleco wrasse Pacific herring kuhli loach rough scad, burma danio. River stingray weasel shark popeye catafula Australian grayling remora flying gurnard smalltooth sawfish, dwarf loach pike conger. Thornyhead megamouth shark pencilfish blacktip reef shark Atlantic silverside Black pickerel, electric eel spiderfish bass electric catfish? Peamouth tetra lightfish midshipman monkfish spearfish burrowing goby trahira, collared dogfish yellow weaver driftfish, dorab roosterfish, sea bream.'),(21,5,'Maki','sushi-748139_1920.jpg',7.59,5,'Angler, swampfish orangestriped triggerfish oceanic flyingfish northern anchovy smooth dogfish. Bigscale pomfret stonefish pollyfish warmouth; round herring banded killifish. Walking catfish, weever cod: Antarctic icefish slimy sculpin.'),(22,6,'Bowl of Lettuce','food-1834645_1920.jpg',1.69,1,'Carrot grape soko wakame plantain pea broccoli rabe desert raisin. Chard cabbage cress gumbo spinach mung bean turnip greens rock melon chicory collard greens bok choy. Wattle seed wakame eggplant soybean quandong garlic prairie turnip swiss chard radish okra.'),(23,6,'Plate of Lettuce','salad-2150548_1920.jpg',2.69,1,'Nori grape silver beet broccoli kombu beet greens fava bean potato quandong celery. Bunya nuts black-eyed pea prairie turnip leek lentil turnip greens parsnip. Sea lettuce lettuce water chestnut eggplant winter purslane fennel azuki bean earthnut pea sierra leone bologi leek soko chicory celtuce parsley jícama salsify.');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `cart_id` bigint unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `address` varchar(256) NOT NULL,
  `special_instructions` text,
  `cooktime` smallint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_cart_id_foreign` (`cart_id`),
  CONSTRAINT `orders_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `address` varchar(256) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jon Yang','3761 N. 14th St','jon24@adventure-works.com','$2y$10$75kHE2ub7YQeexODQ6BB0.IIa.cAHddscmoxGZkhXCT/kpfpwyyDO'),(2,'Eugene Huang','2243 W St.','eugene10@adventure-works.com','$2y$10$bRPD3srQxnlkHWFsO5kNiOOjRSfvkKf.livaX26VBWkjtBlrkcV72'),(3,'Ruben Torres','5844 Linden Land','ruben35@adventure-works.com','$2y$10$rlj4zl70uOUmJltM0pRVi.6Z4ypXkBV37gaAV3Z/XsvjMLxxMfAfG'),(4,'Christy Zhu','1825 Village Pl.','christy12@adventure-works.com','$2y$10$tkw2g98dAl2NJPf8JP5AReoi8xUWc/5DFXUV1v8PmDgILvTkCGaD6'),(5,'Elizabeth Johnson','7553 Harness Circle','elizabeth5@adventure-works.com','$2y$10$nBIA.Vswr2HInKzjml.ENeCmbhUPgLlESTj77mo9vxGX5dr25/FS6'),(6,'Julio Ruiz','7305 Humphrey Drive','julio1@adventure-works.com','$2y$10$ogab8nSG9zViqmGTIAgU4udlaWLyUTI.51ykiZ1MSGjszGMml2F1e'),(7,'Janet Alvarez','2612 Berry Dr','janet9@adventure-works.com','$2y$10$nrEYfa/HlDcwAwSBzYFOl.6VyCJNUNZu5VH8Wp9l2iW2vKgc4fSB6'),(8,'Marco Mehta','942 Brook Street','marco14@adventure-works.com','$2y$10$cArkKbSYE5BrnOdDo2CiUeEfPjw1EHwxma01nn5TOqm/RtYSl1Qum'),(9,'Rob Verhoff','624 Peabody Road','rob4@adventure-works.com','$2y$10$VOQI2DcsZRPZadS.ofWvLOMcWnHQLXVSdWo/Bgt/UjfnT0X8b4RzW'),(10,'Shannon Carlson','3839 Northgate Road','shannon38@adventure-works.com','$2y$10$fQDl4bnOihcBY0Qa/wSCWedMQVkSa6pNiwyc7gwFXRxezWk3e5zF.'),(11,'Jacquelyn Suarez','7800 Corrinne Court','jacquelyn20@adventure-works.com','$2y$10$2QBbvBiqAqfZ.NNFcP5Jse21RkDr6I3A6q8xJJsmGESKiJhyD6f8e'),(12,'Curtis Lu','1224 Shoenic','curtis9@adventure-works.com','$2y$10$MfVT68vOdP2d97fDM0Tsu.it92/DDFnk/CUkgwyfpoQ2R0DM1mzxK'),(13,'Lauren Walker','4785 Scott Street','lauren41@adventure-works.com','$2y$10$LDXGBh706JQx86TXULycs.YcdIzq/hSkjQtTxQ.bTQMlXd8R4nvni'),(14,'Ian Jenkins','7902 Hudson Ave.','ian47@adventure-works.com','$2y$10$604amo56KGfAb6LPI0mr9OKU4eMJSphZjNKClGDvgYz2Mri55tLem'),(15,'Sydney Bennett','9011 Tank Drive','sydney23@adventure-works.com','$2y$10$i7Y3ML7Q.S7F4Z/FABIFDugQPOi5w9ZwX7heTjy.3/sIlZ0ztrk5m'),(16,'Chloe Young','244 Willow Pass Road','chloe23@adventure-works.com','$2y$10$kJ2Woq7JL9K86ouDffNkV.TYXtEwLcO.XXrAq1OFodUKpNTWrTkfK'),(17,'Wyatt Hill','9666 Northridge Ct.','wyatt32@adventure-works.com','$2y$10$m080IpRBEnTfzAZDACFEy.aNigBn9agHOu0RWYLE.xJbVXkfD41/G'),(18,'Shannon Wang','7330 Saddlehill Lane','shannon1@adventure-works.com','$2y$10$NILsNFKIh2r3MNE1cd.MaOqfrZQKP3MgtKsMz/4f5mV94Q0NZrEGq'),(19,'Clarence Rai','244 Rivewview','clarence32@adventure-works.com','$2y$10$eaoVaGSDNwrxByG/0f1WBOPjtSJGKZOca8WLUcgOjKzNJ8RPCMjEG'),(20,'Luke Lal','7832 Landing Dr','luke18@adventure-works.com','$2y$10$8u0zYr/9eUNnSRo6u9ysauWbQ3k5Pu6bmbg9OP2lKmc/.dWFSPa3i'),(21,'Jordan King','7156 Rose Dr.','jordan73@adventure-works.com','$2y$10$zD4dzhPBEJpblryUH3PVSO.9w8kK2DAFhUiK7ZKarw/tJWV4uNTSa'),(22,'Destiny Wilson','8148 W. Lake Dr.','destiny7@adventure-works.com','$2y$10$qijSUuH6pkuVi5t15EKnMeILu3oFZrgcJ7eICTKxv54hLo0q45dcq'),(23,'Ethan Zhang','1769 Nicholas Drive','ethan20@adventure-works.com','$2y$10$qb5t2BMmSJdLzcrVYRZtuukHFYL/XU6bxDKhgF6dh6b.ptyy3Uv5K'),(24,'Seth Edwards','4499 Valley Crest','seth46@adventure-works.com','$2y$10$ygBMnDmxvfcF07s5xp5kcuRCU673chMxEBOrZGfVN7FZSoal8L0U.'),(25,'Russell Xie','8734 Oxford Place','russell7@adventure-works.com','$2y$10$XWk4sjBZ1f4zl39sNW6Ef.DAO46cblaUixL1I253mhHm00bpQ3Y4W'),(26,'Alejandro Beck','2596 Franklin Canyon Road','alejandro45@adventure-works.com','$2y$10$vSwtdlCI8NeJzQ9LaChJ3ujvBKz.eGdIncl8svVMabZHYo.EEoOXS'),(27,'Harold Sai','8211 Leeds Ct.','harold3@adventure-works.com','$2y$10$.9L.aBK4x0/dkS7MbRs2u.JxZkT1GjSJNYsZxaidHWfGbFeRWImre'),(28,'Jessie Zhao','213 Valencia Place','jessie16@adventure-works.com','$2y$10$tMHwEBuGYcnySN0jIF4zwuWuC/gctwSlDbGEHzXgzlUDQzUT5UfYe'),(29,'Jill Jimenez','9111 Rose Ann Ave','jill13@adventure-works.com','$2y$10$4Vy4EKp1/AWPG8ui960Q4eELgmialEnabjDiZUBvbOYMqdklq0mv.'),(30,'Jimmy Moreno','6385 Mark Twain','jimmy9@adventure-works.com','$2y$10$4O6Hdf7H.TmGi8hWOZr5/.ZaVRKFs7axP.UV9ip9EY0WhcLC27A/G'),(31,'Bethany Yuan','636 Vine Hill Way','bethany10@adventure-works.com','$2y$10$uSl1v8Ur17J1/SP.OxDzSeXfPRVQJOlgcsOuvZwHxn6V.Et.x5/Ci'),(32,'Theresa Ramos','6465 Detroit Ave.','theresa13@adventure-works.com','$2y$10$LoYCLAZvR68TDkehcrxRmuy48en8ibWyrlCccPmX1kCrShx/qvzrW'),(33,'Denise Stone','626 Bentley Street','denise10@adventure-works.com','$2y$10$E45wDcgVemOQvWOpoTj6deJSi6jh0c5w.JKm6WGWxguSTv9VDUdQe'),(34,'Jaime Nath','5927 Rainbow Dr','jaime41@adventure-works.com','$2y$10$E202WjC7Cq3ir.8EQO01bOuqu.PPlx3HLBqRkTiQC.PhgUcTmZsrG'),(35,'Ebony Gonzalez','5167 Condor Place','ebony19@adventure-works.com','$2y$10$QFWygJ5thpLzL.CVNzAs1e4eAjuoEhF2wzL8EjYJ1WRiGknyyod6G'),(36,'Wendy Dominguez','1873 Mt. Whitney Dr','wendy12@adventure-works.com','$2y$10$TYFA4GJ.mVa9YBRhE6hlxeeysUAS6w33ketfWEkBYh2FbqpJ7cEPq'),(37,'Jennifer Russell','3981 Augustine Drive','jennifer93@adventure-works.com','$2y$10$KFHsXqalcaduXE/GjBh3o.dGFZbHHXOP3NXoYAEvNN33DksfM8uWG'),(38,'Chloe Garcia','8915 Woodside Way','chloe27@adventure-works.com','$2y$10$6Whafoe7yn6EiVG7RayspOXj839euQ3hx31jilETlpO1.K.WXR9L6'),(39,'Diana Hernandez','8357 Sandy Cove Lane','diana2@adventure-works.com','$2y$10$QRtgPSkcEW.FX.2V0acdJuA6bItquRW/lj7VPe7juqV0okSmsZZNy'),(40,'Marc Martin','9353 Creekside Dr.','marc3@adventure-works.com','$2y$10$XtkR99yjahwjfkUDNjwaT.fp15l27gobOtKYlPk2jfna7uV/kQJhm'),(41,'Jesse Murphy','3350 Kingswood Circle','jesse15@adventure-works.com','$2y$10$TY1wqgqzwPawqRFfdbaQO.PFYifHlCdFth1JaU.qxUKRCSE0Ji/42'),(42,'Amanda Carter','5826 Escobar','amanda53@adventure-works.com','$2y$10$M/KYaOwqpVRK4Uo7pXCp8uMsyMH3fNzP0A6MlDIeUKUnKudcRt6AG'),(43,'Megan Sanchez','1397 Paraiso Ct.','megan28@adventure-works.com','$2y$10$g4UwWj9gJaW2UgX.ue2ldeCl0LLAMoF1skGAvNIzPq.9iR18L2vUK'),(44,'Nathan Simmons','1170 Shaw Rd','nathan11@adventure-works.com','$2y$10$5A/sCW4bI1n.3thmre5A8uZDnwUtGwbqfHAEWNZbdvCh4JtfVS3TO'),(45,'Adam Flores','6935 Candle Dr','adam10@adventure-works.com','$2y$10$5X.eQOTt4tXd3819HPlP1.yzNa7TR1DSGkmWy01YP3p1gO41s3rNC'),(46,'Leonard Nara','7466 La Vista Ave.','leonard18@adventure-works.com','$2y$10$zA7WmUbqQl.tU3cjc6U9QeKUS7oVTbfOIm0SmaePUJgu7Th7eBN/W'),(47,'Christine Yuan','2356 Orange St','christine4@adventure-works.com','$2y$10$/sBJliciYMFhXfAUbcdiCe0adqT0anoPpHJPnzHW939WgQTWqoLTu'),(48,'Jaclyn Lu','2812 Mazatlan','jaclyn12@adventure-works.com','$2y$10$6JmhCi8ILTY.vlZvZulub.QBYF/lfIUwuDebTQgGcpnUF2EOcZZRi'),(49,'Jeremy Powell','1803 Potomac Dr.','jeremy26@adventure-works.com','$2y$10$KqW1D8caw8DgFm9yQj.QE.KdO7i4C7CFMhDYI/CqwC7SMDjGSKKG2'),(50,'Carol Rai','6064 Madrid','carol8@adventure-works.com','$2y$10$WgIj6X68mIs2X9VEIwEBaeZEE3i8eYBUSukLym8YFnLKxmYZjwR72'),(51,'Alan Zheng','2741 Gainborough Dr.','alan23@adventure-works.com','$2y$10$VZk7WmOC3staupVMyW.BM.rtMndApv08oEKfpsXllkSTt4ZWTU046'),(52,'Daniel Johnson','8085 Sunnyvale Avenue','daniel18@adventure-works.com','$2y$10$4J1gFPKa/d.RbVi758Lh6OdvSicp7uCONdBCuhrp7bWRypu1DyXjK'),(53,'Heidi Lopez','2514 Via Cordona','heidi19@adventure-works.com','$2y$10$w2Bbn6G4V7aUlqb3UKxHP.0vRs/IQlZOR4BXC/DBz8Vvx7BcedmQK'),(54,'Ana Price','1660 Stonyhill Circle','ana0@adventure-works.com','$2y$10$/1DYFzpFaXed7ruIyS6/7uuOC11wYblDtf0.9pr0RXRQM6cB2TV1.'),(55,'Deanna Munoz','5825 B Way','deanna33@adventure-works.com','$2y$10$2JgLwhlx0pJEHw7f1S2YL.cPMvGZrBfmG0hqRc6CEUnjM.8vQdCSu'),(56,'Gilbert Raje','8811 The Trees Dr.','gilbert35@adventure-works.com','$2y$10$kHyAsbcf6TdcdtslwuOUFurHNUlyPkPq/bmB2/W79D7mI3651kNUG'),(57,'Michele Nath','5464 Janin Pl.','michele19@adventure-works.com','$2y$10$w6uJQ/AekxzagzyDDK5LmOjW5K9jesgVLcaBNSkMKn/pV53invZ8K'),(58,'Carl Andersen','6930 Lake Nadine Place','carl12@adventure-works.com','$2y$10$MBoxc2dnmhqPipgQbRTDReisaHSfXYFHcNTs5VdwEgcSENTkzVx/q'),(59,'Marc Diaz','6645 Sinaloa','marc6@adventure-works.com','$2y$10$0egVq2lrb.Y4w/7flvs7KusOkHNZ/ME.EkA.WM9TYaxbU1v.pPXYW'),(60,'Ashlee Andersen','8255 Highland Road','ashlee19@adventure-works.com','$2y$10$eMvmJDDZlyke3aKd72zqtugWhhuqV/HrxnMIDuULZSl9hOBnuwghO'),(61,'Jon Zhou','6574 Hemlock Ave.','jon28@adventure-works.com','$2y$10$dZ1VeDjyd3moqmegxYL4Te19mwgPhfJNfnOpwnbmAZheR6y6sUYeK'),(62,'Todd Gao','8808 Geneva Ave','todd14@adventure-works.com','$2y$10$7.BS7C0yifPshpN/Sd7KDudMMOVrAD9vS5BTgx/anHkYZ4Bo3j//i'),(63,'Noah Powell','9794 Marion Ct','noah5@adventure-works.com','$2y$10$MpAcqNRHmMwFNw56l/CwW.H2sk9d0JnMJRMAspIx0mMgAN3IVnT4C'),(64,'Angela Murphy','4927 Virgil Street','angela41@adventure-works.com','$2y$10$ZGwAUj1AhoKZoQPgSu5nVuSHW3vb3NnZ73V4Q9iWkEczzw/txrkcu'),(65,'Chase Reed','2721 Alexander Pl.','chase21@adventure-works.com','$2y$10$v3.dXfNfuF5LBUgXtDnZdeO5baphmmULH1apA1txCrr33VHCyJ25i'),(66,'Jessica Henderson','9343 Ironwood Way','jessica29@adventure-works.com','$2y$10$odtekv/DJ8mIwAuXvq4cg.fBkEbIUZLzODbOqokJw0iUUnX1HFeFm'),(67,'Grace Butler','4739 Garden Ave.','grace62@adventure-works.com','$2y$10$yJ4rjeIskG23MzarSiweguUNnjQOKL1mtYsBIJclsbjamWsELWZ1a'),(68,'Caleb Carter','9563 Pennsylvania Blvd.','caleb40@adventure-works.com','$2y$10$77YLVhxk2eqzuRGf.YrKweUlpDGhTEgA7RfOT5eSzulgdq6uHurHS'),(69,'Tiffany Liang','3608 Sinclair Avenue','tiffany17@adventure-works.com','$2y$10$CWKZQSpb1D2580Xw7hQnXOqthmmHaiRym4H/xR8ASwns6LhH5llPO'),(70,'Carolyn Navarro','4606 Springwood Court','carolyn30@adventure-works.com','$2y$10$e3Y0jCsxxpGskkJIl9i1iuavq/t7npxMjytrqXl8GDFBpZ8I6bnvW'),(71,'Willie Raji','6260 Vernal Drive','willie40@adventure-works.com','$2y$10$ZXKM0zKsalSbZKiKJ5YcLejgPZkhQT30MY60tYfNS3gRPel4rvM1u'),(72,'Linda Serrano','9808 Shaw Rd.','linda31@adventure-works.com','$2y$10$P.hSMIBvcuPBTV4n4f0TYOnQ7w6E9naZoT6G6J/ASdx8lY8l/OeY2'),(73,'Casey Luo','9513 Roslyn Drive','casey6@adventure-works.com','$2y$10$kXCBgR3pMWXCVtozENc9Reeon1gp0omcAk6MVsK8kJ0usq8iEzksm'),(74,'Amy Ye','2262 Kirkwood Ct.','amy16@adventure-works.com','$2y$10$IqgrCH2PNZIPRcehdvl2yeX7bt4JqrUqZfo88HqGfbTAjYvKhaeFe'),(75,'Levi Arun','4661 Bluetail','levi6@adventure-works.com','$2y$10$bgcNyK1Z7aSaB0Oin9BCkO7Zeo7UCTzeWBWNDzkHmPU5UeZxBBlPC'),(76,'Felicia Jimenez','786 Eastgate Ave','felicia4@adventure-works.com','$2y$10$OmEYo5KxM6aRHIcb069oqu8zAwFz84OXV5X35GZACBH16GH8o2a4m'),(77,'Blake Anderson','5436 Clear','blake9@adventure-works.com','$2y$10$qNzmQXOeeIAs.qhP1yxt1OKu7wqrVtPnwQcjS00Y8US5JaJqhC5/e'),(78,'Leah Ye','1291 Arguello Blvd.','leah7@adventure-works.com','$2y$10$bd39I1Unwj3bzMop1ELByeyDah1dg5iNj/ALuVlLkRJaytL.zszmm'),(79,'Gina Martin','1349 Sol St.','gina1@adventure-works.com','$2y$10$dLm6RxQ7ns0.5Vrzp8GddeN8CluO2MMfBLcyYLmvjR97K9BYtW9yO'),(80,'Donald Gonzalez','4236 Malibu Place','donald20@adventure-works.com','$2y$10$uP9WUQhHyZeL0sEPw8i2OuhoTaWUeU.sGqsk8o3XTGBv8CDxvV0bC'),(81,'Damien Chander','9941 Stonehedge Dr.','damien32@adventure-works.com','$2y$10$J51ISSe4A8m16NDOU5SvJ.iBA3lz8Sl0sbJiT1Avz6s1ujgHhktTm'),(82,'Savannah Baker','1210 Trafalgar Circle','savannah39@adventure-works.com','$2y$10$HEsN8QVOpY7TsMLiaz8Vq.KIy5iOeFFGlg.526c8b8Xb/1UlZaVSy'),(83,'Angela Butler','6040 Listing Ct','angela17@adventure-works.com','$2y$10$xtZVXRn6ImNo6vgkWaTmFuUZdLimj2JcyQbkA7rGiEYrIQIe9izcG'),(84,'Alyssa Cox','867 La Orinda Place','alyssa37@adventure-works.com','$2y$10$u3KMrqMOYa86I3yXdbp3aeBC4xX8F7pKaD3XpH250o.Z3d77D4kVe'),(85,'Lucas Phillips','8668 St. Celestine Court','lucas7@adventure-works.com','$2y$10$vS8wmH4PfFWqKZYOqBJUZeUpwpBeiIwj9SbhAVKJS1NC9bUt.QqI.'),(86,'Emily Johnson','7926 Stephanie Way','emily1@adventure-works.com','$2y$10$5puew5RnmuvO5qV4qxP3EOkTh3L7EciMWK.vxNQfe237Zf.GM9WNi'),(87,'Ryan Brown','2939 Wesley Ct.','ryan43@adventure-works.com','$2y$10$kzb7JVQUAH3czJIpAwr7Z.b32.NOfSHTyJ2LyUg.0ez8Z/BipfBU2'),(88,'Tamara Liang','3791 Rossmor Parkway','tamara6@adventure-works.com','$2y$10$l4Tqn5kDZJI/bjuQuVWazOQIzl/t41DhPjy57JB/Yq8gZB3gG.S9K'),(89,'Hunter Davis','4308 Sand Pointe Lane','hunter64@adventure-works.com','$2y$10$t4SH57qxKUacFp5R0MWT6uixIe3I0IeksC321NHyCl12fDDzKEqAK'),(90,'Abigail Price','2685 Blackburn Ct','abigail25@adventure-works.com','$2y$10$DjDxTXbqTyap0NWdUUp6TeprOsV/R1YoJbBQa.9heB6lxr/KaREz2'),(91,'Trevor Bryant','5781 Sharon Dr.','trevor18@adventure-works.com','$2y$10$UVQX4AaMOAeqSH4G4XyhxO3e9SkQqpdaDQHeVTHWeEGKHC3WD.hrC'),(92,'Dalton Perez','6083 San Jose','dalton37@adventure-works.com','$2y$10$864EBn9ow8uPEYRusPxAGOe01ZFkM/B2IrwofOZKEAymyT/fh8cIy'),(93,'Cheryl Diaz','7297 Kaywood Drive','cheryl4@adventure-works.com','$2y$10$Vk./VgWUnGF6e02ugcsJ9ur6bdcxExn0dd3jwVcQ1vRs1fcowZOze'),(94,'Aimee He','1833 Olympic Drive','aimee13@adventure-works.com','$2y$10$2q3xP6s4FzpL0bEEvQZ5ZOR0tCRlMvLfdld2zs6KxhIpiOOIKDHjO'),(95,'Cedric Ma','3407 Oak Brook Place','cedric15@adventure-works.com','$2y$10$tZPwyvKnOy.MN62leprMBOzcOKPMC/RHruRgW8GoEDfh.nIdzpvf6'),(96,'Chad Kumar','1681 Lighthouse Way','chad9@adventure-works.com','$2y$10$zG4Ti5ygvvMDFrvN4JJCUeFyAALN/e/sKQF6RqORoN1/fdYvNbFNm'),(97,'Andrés Anand','5423 Los Gatos Ct.','andrés18@adventure-works.com','$2y$10$X9Hkrpl5R2xEdhdfmaoRP.0Ajc89Vv2MK053FARvGBmEQzi.bobZ2'),(98,'Edwin Nara','719 William Way','edwin39@adventure-works.com','$2y$10$cjE5c9aiKe9xGv0KrJ81ZuSwDQmigT0bzlW1HziSNonS6N6ga36Ou'),(99,'Mallory Rubio','6452 Harris Circle','mallory7@adventure-works.com','$2y$10$NDQrmbLpKeccv4ZnYtHY/OlAZQPTBWXhuZTdSUCk4HyeDE9pCjOfO'),(100,'Adam Ross','4378 Westminster Place','adam2@adventure-works.com','$2y$10$.VkgnnATmh7hgdEQYFI5oO224WWTvD/xQ74LIbw9laDLiXXrMmpyW');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-13 21:11:46
