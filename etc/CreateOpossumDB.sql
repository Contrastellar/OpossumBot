/* 
I made the OpossumPictures db /w this command via MySQL Workbench 8.0.27 
*/
CREATE TABLE `OpossumPictures` (
  `pictureID` int NOT NULL AUTO_INCREMENT,
  `Picture` longblob NOT NULL,
  `alttext` longtext COMMENT 'This is where the Alt Text for pictures gets stored',
  PRIMARY KEY (`pictureID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
