/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(70) NOT NULL,
  `salt` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `users` VALUES (1,'Lasse','9C4496A31F8F1E062A41A1CA3F726E3854938382F5467806C443F2685234930C','cfaab1ff8c463570e5da7ee9','Lasse K');
INSERT INTO `users` VALUES (2,'Mads','58F14517F9A05C38689DDAA7EA556B4F37EA2976DD5D12CB09E1559C6302260F','ac3d13f0c513ec6748fa4edd','Mads N');
INSERT INTO `users` VALUES (8,'amoeller','6A382D26D7B3AE5E50F8E0F60A015B48B3812C778AE34A6348A1DC2E0639C86E','5b31e14a474f4b0a05d813ac','Andreas Møller');
INSERT INTO `users` VALUES (9,'afisker','F96E28248D88855C6171EE6D60D7DF6568F4A7F157B66285740DF62F0B6E1A69','bb7f73c8350a91f944cd0761','Ane Fisker');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `permission` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `user_permissions` VALUES (1,1,'create_new_user');
INSERT INTO `user_permissions` VALUES (2,1,'delete_user');
INSERT INTO `user_permissions` VALUES (3,1,'update_user');
INSERT INTO `user_permissions` VALUES (4,1,'view_all_user_accounts');
INSERT INTO `user_permissions` VALUES (5,1,'read_database');
INSERT INTO `user_permissions` VALUES (6,2,'create_new_user');
INSERT INTO `user_permissions` VALUES (7,2,'delete_user');
INSERT INTO `user_permissions` VALUES (8,2,'update_user');
INSERT INTO `user_permissions` VALUES (9,2,'view_all_user_accounts');
INSERT INTO `user_permissions` VALUES (10,2,'read_database');
INSERT INTO `user_permissions` VALUES (11,NULL,'view_table_content');
INSERT INTO `user_permissions` VALUES (12,NULL,'view_database_structure');
INSERT INTO `user_permissions` VALUES (26,NULL,'create_new_user');
INSERT INTO `user_permissions` VALUES (27,NULL,'update_user');
INSERT INTO `user_permissions` VALUES (28,NULL,'read_database');
INSERT INTO `user_permissions` VALUES (30,8,'create_new_user');
INSERT INTO `user_permissions` VALUES (31,8,'update_user');
INSERT INTO `user_permissions` VALUES (32,8,'read_database');
INSERT INTO `user_permissions` VALUES (33,8,'write_views');
INSERT INTO `user_permissions` VALUES (34,8,'view_all_user_accounts');
INSERT INTO `user_permissions` VALUES (35,8,'delete_user');
INSERT INTO `user_permissions` VALUES (36,9,'create_new_user');
INSERT INTO `user_permissions` VALUES (37,9,'update_user');
INSERT INTO `user_permissions` VALUES (38,9,'read_database');
INSERT INTO `user_permissions` VALUES (39,9,'write_views');
INSERT INTO `user_permissions` VALUES (40,9,'view_all_user_accounts');
INSERT INTO `user_permissions` VALUES (41,9,'delete_user');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `questions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `surveys` VALUES (32,'Eksempel survey','[{\"id\": \"d2ec5cf-1f0a-4680-2773-3db1a32fecbc\", \"header\": \"Name\", \"questionText\": \"What is your name?\", \"type\": \"txt\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"0d7bb0-25e5-ec87-dc30-e083d78aea\", \"header\": \"Age\", \"questionText\": \"How old are you?\", \"type\": \"number\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"hard\", \"operation\": \"greater_than\", \"value\": \"0\", \"on_fail_message\": \"That doesn\'t appear to be a valid age?\"}, {\"type\": \"hard\", \"operation\": \"less_than\", \"value\": \"120\", \"on_fail_message\": \"That doesn\'t appear to be a valid age?\"}]}, {\"id\": \"01fc2e-78b3-57b1-66a-87650d43d0b1\", \"header\": \"Birthday\", \"questionText\": \"When is your birthday?\", \"type\": \"date\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [{\"message\": \"If they seem uncertain when answering, make them check their birth certificate.\", \"type\": \"before\"}], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"33be45-a6f4-cdb-c611-68145ce3e6fa\", \"header\": \"Fav. animal\", \"questionText\": \"Which of these 4 is your favourite animal?\", \"type\": \"mc\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [\"Dog\", \"Cat\", \"Bird\", \"Snake\"], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"35f74aa-8fb5-314e-871d-ccec47dd83b\", \"header\": \"Current animal\", \"questionText\": \"Which animals are you currently taking care of?\", \"type\": \"ma\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [\"Dog\", \"Cat\", \"Bird\", \"Snake\", \"Whale\", \"Octopus\", \"Snail\", \"Ape\", \"Porcupine\", \"Tortoise\"], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"5b325d-a4cd-4c0f-2c5-301e5bfd0d52\", \"header\": \"Christmas\", \"questionText\": \"Do you celebrate Christmas?\", \"type\": \"bool\", \"path\": \"\", \"skip\": {\"condition\": false, \"skip_questions\": [\"6f0ca8-af6-bee6-532-7acf2f3ff702\"]}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"6f0ca8-af6-bee6-532-7acf2f3ff702\", \"header\": \"Fav. Christmas\", \"questionText\": \"What\'s the best thing about Christmas?\", \"type\": \"mc\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [\"The food\", \"Being with family\", \"Gifts\", \"It snows\", \"The celebration of capitalism\"], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"4d247ae-bca4-aaa1-776d-548c0e45d08\", \"header\": \"Sleepquality\", \"questionText\": \"On a scale from 1-10, how did you sleep last night?\", \"type\": \"mc\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [\"1  Almost no sleep\", \"2 Slept\", \"8 Hurray I\'m relaxed \", \"9 Ready to take on the world\", \"10 Still sleeping\"], \"prompts\": [{\"message\": \"Do you mean this?\", \"type\": \"after\"}], \"validation\": [{\"type\": \"soft\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"Are you sure?\"}, {\"type\": \"soft\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"Are you sure?\"}]}]');
INSERT INTO `surveys` VALUES (34,'Pregnancy Registration','[{\"id\": \"66bc014-21f2-bc85-f541-72263804c515\", \"header\": \"Date\", \"questionText\": \"Data\", \"type\": \"date\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [{\"message\": \"\", \"type\": \"after\"}], \"validation\": [{\"type\": \"soft\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"soft\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"c7cae0-bfe-eb10-160d-df8b53a8c1bb\", \"header\": \"Status\", \"questionText\": \"Estado\", \"type\": \"mc\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [\"Present\", \"Absent\", \"Travelling\"], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"db614af-2541-d15e-ef4a-171b2164bb0\", \"header\": \"Gest\", \"questionText\": \"Gestational age\", \"type\": \"txt\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"1402367-67f0-04-703d-dd67fc704d\", \"header\": \"LMP\", \"questionText\": \"Date of last menstruation\", \"type\": \"date\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [{\"message\": \"Register the first day of last menstruation before pregancy\", \"type\": \"\"}], \"validation\": [{\"type\": \"hard\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"LMP<date&LMP>(date+270)\"}, {\"type\": \"hard\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"LMP<date&LMP>(date+270)\"}]}, {\"id\": \"3bac0ab-df6-e34d-0ebe-3ed77ed064da\", \"header\": \"CPNcard\", \"questionText\": \"Has a CPN card\", \"type\": \"bool\", \"path\": \"\", \"skip\": {\"condition\": true, \"skip_questions\": []}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"5f05767-5b4-20c4-bd2f-c74f27bcc2bb\", \"header\": \"LMPcard\", \"questionText\": \"Last menstruation according to card\", \"type\": \"txt\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}]');
INSERT INTO `surveys` VALUES (35,'Andreas\' test','[{\"id\": \"c0b6b3-6c5b-deeb-8d64-22e4764bc4\", \"header\": \"Name\", \"questionText\": \"What is your name?\", \"type\": \"txt\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"ab2ecad-1537-bf48-2251-475f6bdd85a4\", \"header\": \"Siblings\", \"questionText\": \"How many siblings do you have?\", \"type\": \"number\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"hard\", \"operation\": \"greater_or_equal\", \"value\": \"0\", \"on_fail_message\": \"Should be between 0 and 20\"}, {\"type\": \"hard\", \"operation\": \"lesser_or_equal\", \"value\": \"20\", \"on_fail_message\": \"Should be between 0 and 20\"}]}, {\"id\": \"6ed748f-2e7e-0e21-6c7a-32aa23e156\", \"header\": \"Younger sibling\", \"questionText\": \"Do you have a younger sibling?\", \"type\": \"bool\", \"path\": \"\", \"skip\": {\"condition\": false, \"skip_questions\": [\"246b22-a02c-3be1-7ecc-5e833b8765d1\"]}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"246b22-a02c-3be1-7ecc-5e833b8765d1\", \"header\": \"Sibling age\", \"questionText\": \"What is the age of your youngest sibling\", \"type\": \"number\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"hard\", \"operation\": \"greater_or_equal\", \"value\": \"0\", \"on_fail_message\": \"Should be between 0 and 100\"}, {\"type\": \"hard\", \"operation\": \"lesser_or_equal\", \"value\": \"100\", \"on_fail_message\": \"Should be between 0 and 100\"}]}, {\"id\": \"6c26521-050b-be6f-4543-8cbc48f5b06a\", \"header\": \"Age\", \"questionText\": \"How old are you?\", \"type\": \"number\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [{\"message\": \"What happens if we have prompts and validation?\", \"type\": \"after\"}], \"validation\": [{\"type\": \"hard\", \"operation\": \"greater_than\", \"value\": \"0\", \"on_fail_message\": \"Must be greater than 0\"}, {\"type\": \"hard\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"Must be greater than 0\"}]}, {\"id\": \"aab88-37b0-bfbe-0a63-c054a84b852\", \"header\": \"Prompt\", \"questionText\": \"This is test\", \"type\": \"txt\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [{\"message\": \"\", \"type\": \"before\"}], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}]');
INSERT INTO `surveys` VALUES (36,'Visit - Women','[{\"id\": \"fafb124-1f36-703d-285f-ffab4a2b6f15\", \"header\": \"Visit date\", \"questionText\": \"Date of visit\", \"type\": \"date\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"d40c675-41c1-4d3b-2df3-a047ab78504a\", \"header\": \"Pregnant\", \"questionText\": \"Is the woman pregnant?\", \"type\": \"mc\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [\"Yes\", \"No\", \"Don\'t know\"], \"prompts\": [{\"message\": \"Remember to register the pregnancy if the woman is pregnangt\", \"type\": \"after\"}], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"6f40e8a-c73-7ee2-356-ec0f88c35761\", \"header\": \"Parou parir \", \"questionText\": \"Is the woman still able to give birth?\", \"type\": \"mc\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [\"Yes\", \"No\", \"Don\'t now\"], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"cc3d3-4472-423b-256a-7edf0d38e54b\", \"header\": \"Estado\", \"questionText\": \"Status\", \"type\": \"mc\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [\"Present\", \"Absent\", \"Travelling\", \"Moved\", \"Dead\"], \"prompts\": [{\"message\": \"Remember to do the VA survey if the woman died\", \"type\": \"after\"}], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}, {\"id\": \"682b2bb-5f23-34d6-1ed-4ceceec86c2b\", \"header\": \"Vaccination card\", \"questionText\": \"Vaccination card\", \"type\": \"mc\", \"path\": \"\", \"skip\": {\"condition\": \"\", \"skip_questions\": []}, \"options\": [\"Card seen\", \"Card not seen\", \"Card lost\"], \"prompts\": [], \"validation\": [{\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}, {\"type\": \"\", \"operation\": \"\", \"value\": \"\", \"on_fail_message\": \"\"}]}]');