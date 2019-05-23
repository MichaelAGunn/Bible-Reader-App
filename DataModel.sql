--create all tables and associate the foreign keys
CREATE TABLE bible_instance(id INTEGER PRIMARY KEY NOT NULL);
							name varchar(256) NOT NULL,
							lang varchar(64) NOT NULL,
							publisher varchar(64) NOT NULL,
							pub_year INTEGER NOT NULL);

--CREATE UNIQUE KEY bible_instance_key

CREATE TABLE book(id INTEGER PRIMARY KEY NOT NULL,
				  title varchar(256) NOT NULL,
				  bible_inst_id INTEGER FOREIGN KEY NOT NULL);

ALTER TABLE book ADD FOREIGN KEY (bible_inst_id) REFERENCES bible_instance(id);

CREATE TABLE chapter(id INTEGER PRIMARY KEY NOT NULL,
					 reference INTEGER NOT NULL
					 book_id INTEGER NOT NULL);

ALTER TABLE chapter ADD FOREIGN KEY (book_id) REFERENCES book(id)

CREATE TABLE verse(id INTEGER PRIMARY KEY NOT NULL,
				   vtxt varchar(2048) NOT NULL,
				   reference INTEGER NOT NULL
				   chap_id INTEGER NOT NULL);

ALTER TABLE verse ADD FOREIGN KEY (chap_id) REFERENCES chapter(id)

CREATE TABLE author(id INTEGER PRIMARY KEY NOT NULL,
					given_name varchar(256) NOT NULL,
					surname varchar(256) NULL);

CREATE TABLE book_author(book_id INTEGER PRIMARY KEY NOT NULL,
						 author_id INTEGER PRIMARY KEY NOT NULL);

ALTER TABLE book_author ADD FOREIGN KEY (book_id) REFERENCES book(id);

ALTER TABLE book_author ADD FOREIGN KEY (author_id) REFERENCES author(id);


--insert junk data for now
INSERT INTO bible_instnce(name, lang, publisher)
VALUES
("KING JAMES VERSION", "ENGLISH", "CHURCH OF ENGLAND", 1611),
("AMERICAN STANDARD VERSION", "ENGLISH", "THOMAS NELSON & SONS", 1901);

INSERT INTO book(title, bible_inst_id)
VALUES
("GENESIS", 1),
("EXODUS", 1),
("LEVITICUS", 1),
("NUMBERS", 1),
("DEUTERONOMY", 1);

INSERT INTO chapter(reference, book_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5);

INSERT INTO verse(vtxt, reference, chap_id)
VALUES
("First.", 01001001, 1),
("Second.", 01001002, 1),
("Third.", 01001003, 1),
("Forth.", 01001004, 1),
("Eleventh.", 01002001, 2),
("Twelfth.", 01002002, 2),
("Thirteenth.", 01002003, 2),
("Forteenth.", 01002004, 2),
("1st.", 02001001, 11),
("2nd.", 02001002, 11),
("3rd.", 02001003, 11),
("4th.", 02001004, 11),
("11th.", 02002001, 12),
("12th.", 02002002, 12),
("13th.", 02002003, 12),
("14th.", 02002004, 12),
("First", 03001001, 21),
("Second", 03001002, 21),
("Third", 03001003, 21),
("Forth", 03001004, 21),
("Eleventh", 03002001, 22),
("Twelfth", 03002002, 22),
("Thirteenth", 03002003, 22),
("Forteenth", 03002004, 22),
("1st", 04001001, 31),
("2nd", 04001002, 31),
("3rd", 04001003, 31),
("4th", 04001004, 31),
("11th", 04002001, 32),
("12th", 04002002, 32),
("13th", 04002003, 32),
("14th", 04002004, 32),
("!!", 05001001, 41),
("@@", 05001002, 41),
("##", 05001003, 41),
("$$", 05001004, 41),
("!!!!", 05002001, 42),
("@@@@", 05002002, 42),
("####" 05002003, 42),
("$$$$", 05002004, 42);

/*
INSERT INTO author()
VALUES
();
*/



