/*
    Sample file to load actual files into the table. This is the general form of *loading*
    files into the table that could (in theory) be supported from the Discord-side
*/
USE OpossumBot;
DESC OpossumPictures;
INSERT INTO OpossumPictures VALUES(1, LOAD_FILE('/possums/1.png'), "empty alt text");
