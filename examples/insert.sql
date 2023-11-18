use db;

Drop table if exists AuthorArticle;
Drop table if exists Articles;
Drop table if exists Authors;
Drop table if exists Books;

CREATE TABLE Articles (
   ArticleID SMALLINT NOT NULL PRIMARY KEY,
   ArticleTitle VARCHAR(60) NOT NULL,
   Copyright YEAR NOT NULL
)
ENGINE=INNODB;


INSERT INTO Articles VALUES (12786, 'How write a paper', 1934),
                            (13331, 'Publish a paper', 1919),
                            (14356, 'Sell a paper', 1966),
                            (15729, 'Buy a paper', 1932),
                            (16284, 'Conferences', 1996),
                            (17695, 'Journal', 1980),
                            (19264, 'Information', 1992),
                            (19354, 'AI', 1993);


CREATE TABLE Authors (
   AuthID SMALLINT NOT NULL PRIMARY KEY,
   AuthorFirstName VARCHAR(20),
   AuthorMiddleName VARCHAR(20),
   AuthorLastName VARCHAR(20)
)
ENGINE=INNODB;

INSERT INTO Authors VALUES (1006, 'Henry', 'S.', 'Thompson'),
                           (1007, 'Jason', 'Carol', 'Oak'),
                           (1008, 'James', NULL, 'Elk'),
                           (1009, 'Tom', 'M', 'Ride'),
                           (1010, 'Jack', 'K', 'Ken'),
                           (1011, 'Mary', 'G.', 'Lee'),
                           (1012, 'Annie', NULL, 'Peng'),
                           (1013, 'Alan', NULL, 'Wang'),
                           (1014, 'Nelson', NULL, 'Yin');


CREATE TABLE AuthorArticle (
   AuthID SMALLINT NOT NULL,
   ArticleID SMALLINT NOT NULL,
   PRIMARY KEY (AuthID, ArticleID),
   FOREIGN KEY (AuthID) REFERENCES Authors (AuthID),
   FOREIGN KEY (ArticleID) REFERENCES Articles (ArticleID)
)
ENGINE=INNODB;

INSERT INTO AuthorArticle VALUES (1006, 14356), 
                              (1008, 15729), 
                              (1009, 12786), 
                              (1010, 17695),
                              (1011, 15729), 
                              (1012, 19264), 
                              (1012, 19354), 
                              (1014, 16284);



CREATE TABLE Books (
   ArticleTitle VARCHAR(60) NOT NULL,
   Author VARCHAR(60) NOT NULL,
   Copyright YEAR NOT NULL
)
ENGINE=INNODB;


---- insert with select
INSERT INTO Books
SELECT ArticleTitle, CONCAT_WS(' ', AuthorFirstName, AuthorMiddleName, AuthorLastName) AS Author, Copyright
FROM Articles AS b STRAIGHT_JOIN AuthorArticle AS ab STRAIGHT_JOIN Authors AS a
WHERE b.ArticleID=ab.ArticleID AND ab.AuthID=a.AuthID AND Copyright<1980
ORDER BY ArticleTitle;


