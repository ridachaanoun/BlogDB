BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Role" (
	"ID_role"	integer,
	"role_name"	VARCHAR(50),
	PRIMARY KEY("ID_role" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "User" (
	"ID_user"	integer,
	"username"	VARCHAR(50) NOT NULL,
	"Email"	varchar(255) NOT NULL,
	"pass_word"	varchar(50) NOT NULL,
	"ID_role"	INTEGER,
	PRIMARY KEY("ID_user" AUTOINCREMENT),
	FOREIGN KEY("ID_role") REFERENCES "Role"("ID_role")
);
CREATE TABLE IF NOT EXISTS "Category" (
	"ID_Category"	integer,
	"Categoryname"	VARCHAR(50),
	"ID_sapCategory"	INTEGER,
	PRIMARY KEY("ID_Category" AUTOINCREMENT),
	FOREIGN KEY("ID_sapCategory") REFERENCES "Category"("ID_Category")
);
CREATE TABLE IF NOT EXISTS "Articles" (
	"ID_arti"	INTEGER,
	"Titre"	varchar(255),
	"Contenu_arti"	TEXT,
	"Date_created"	DATE,
	"ID_user"	INTEGER,
	"ID_Category"	INTEGER,
	PRIMARY KEY("ID_arti" AUTOINCREMENT),
	FOREIGN KEY("ID_user") REFERENCES "User"("ID_user"),
	FOREIGN KEY("ID_Category") REFERENCES "Category"("ID_Category")
);
CREATE TABLE IF NOT EXISTS "Comment" (
	"ID_comment"	INTEGER,
	"Contenu_com"	TEXT NOT NULL,
	"Date_created_com"	DATE,
	"ID_user"	INTEGER NOT NULL,
	"ID_arti"	INTEGER NOT NULL,
	FOREIGN KEY("ID_arti") REFERENCES "Articles"("ID_arti"),
	FOREIGN KEY("ID_user") REFERENCES "User"("ID_user"),
	PRIMARY KEY("ID_comment" AUTOINCREMENT)
);
INSERT INTO "Role" VALUES (1,'admin');
INSERT INTO "Role" VALUES (2,'user');
INSERT INTO "User" VALUES (1,'admin','admin@example.com','admin123',1);
INSERT INTO "User" VALUES (2,'User1','user1@example.com','password1',2);
INSERT INTO "User" VALUES (3,'User2','user2@example.com','password2',2);
INSERT INTO "User" VALUES (4,'User3','user3@example.com','password3',2);
INSERT INTO "User" VALUES (5,'User4','user4@example.com','password4',2);
INSERT INTO "Category" VALUES (1,'Technologie',NULL);
INSERT INTO "Category" VALUES (2,'Science',NULL);
INSERT INTO "Category" VALUES (3,'Art',NULL);
INSERT INTO "Category" VALUES (4,'Voyages',NULL);
INSERT INTO "Category" VALUES (5,'Cuisine',NULL);
INSERT INTO "Category" VALUES (6,'art children',3);
INSERT INTO "Articles" VALUES (1,'Premier article','Contenu du premier article','2024-04-30',1,1);
INSERT INTO "Articles" VALUES (2,'Deuxième article','Contenu du deuxième article','2024-04-29',2,2);
INSERT INTO "Articles" VALUES (3,'Troisième article','Contenu du troisième article','2024-04-28',3,3);
INSERT INTO "Articles" VALUES (4,'Quatrième article','Contenu du quatrième article','2024-04-27',4,4);
INSERT INTO "Articles" VALUES (5,'Cinquième article','Contenu du cinquième article','2024-04-26',5,5);
INSERT INTO "Comment" VALUES (1,'Great job on the blog design! Looking forward to reading more articles','2024-04-30',2,1);
INSERT INTO "Comment" VALUES (2,'I found the content very informative. Keep up the good work','2024-04-29',3,2);
INSERT INTO "Comment" VALUES (3,'I appreciate the variety of topics covered in your blog. It is refreshing!','2024-04-28',4,3);
INSERT INTO "Comment" VALUES (4,'The writing style is engaging and easy to follow. Thumbs up!','2024-04-27',5,4);
INSERT INTO "Comment" VALUES (5,'As a newcomer to your blog, I am impressed by the quality of your articles. Well done!','2024-04-26',1,5);
COMMIT;
