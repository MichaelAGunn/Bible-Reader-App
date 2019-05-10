/*
	This is the database that the Bible Reader App will use.
	Stellar pattern that is centred on the Bible table.
	Data for the Bible table will be populated via python and using csv files from GitHub
	All other tables will be populated within this app.
*/

CREATE TABLE Bible						--represents every translation of the Bible and the original languages
(
	m_id	TEXT	PRIMARY KEY,
	b_id	INTEGER	PRIMARY KEY,
	book	INTEGER	NOT NULL,
	chapter	INTEGER	NOT NULL,
	verse	INTEGER	NOT NULL,
	v_text	TEXT	NOT NULL
);										--data will be imported by python with csv files



CREATE TABLE Metadata					--represents the information about each translation and where it comes from
(
	m_id 			TEXT	NOT NULL	PRIMARY KEY	FOREIGN KEY,
	name 			TEXT 	NOT NULL,
	pub_year		INTEGER	NOT NULL,
	t_language 		TEXT 	NOT NULL,
	copyright		TEXT	NOT NULL
);

INSERT INTO Bible
VALUES
	('ASV', 'American Standard Version',		'English',	'Public Domain'),
	('BBE', 'Bible in Basic English',			'English',	'Public Domain'),
	('DBY', 'Darby English Bible',				'English',	'Public Domain'),
	('KJV', 'Authorized King James Version',	'English',	'Public Domain'),
	('WBT', 'Webster\'s Bible',					'English',	'Public Domain'),
	('WEB', 'World English Bible',				'English',	'Public Domain'),
	('YLT', 'Young\'s Literal Translation',		'English',	'Public Domain')
;



CREATE TABLE Book						--represents each book of the Bible and their metadata
(
	b_id		INTEGER		AUTO INCREMENT	PRIMARY KEY	FOREIGN KEY,
	b_query		TEXT		NOT NULL,
	b_code		TEXT		NOT NULL,	--three-character search code to make queries easier to write
	b_display	TEXT,					--will become NOT NULL once I figure out what fancy names to use...
	genre		TEXT,					--will become NOT NULL once I figure out what all the genres are...
	old_test	BOOLEAN		NOT NULL,	--is this book in the old testament or new testament?
	apocrypha	BOOLEAN		NOT NULL,	--is this book official scripture or apocrypha?
	author		TEXT					--will become NOT NULL once I figure out who wrote what...
	summary		TEXT					--will become NOT NULL once I figure out whose summaries are the best...
);

INSERT INTO Book(b_query, b_short, genre, old_test, apocrypha)
VALUES									--apocrypha is commented out because I still need to work out how to include them...
	('Genesis',				'GNS', 'Law',		TRUE, FALSE),
	('Exodus',				'EXD', 'Law',		TRUE, FALSE),
	('Leviticus',			'LVT', 'Law',		TRUE, FALSE),
	('Numbers',				'NMB', 'Law',		TRUE, FALSE),
	('Deuteronomy',			'DTR', 'Law',		TRUE, FALSE),
	('Joshua',				'JSH', 'Prophets', 	TRUE, FALSE),
	('Judges',				'JDG', 'Prophets', 	TRUE, FALSE),
	('Ruth',				'RTH', 'Prophets',	TRUE, FALSE),
	('1 Samuel',			'1SM', 'Prophets',	TRUE, FALSE),
	('2 Samuel',			'2SM', 'Prophets',	TRUE, FALSE),
	('1 Kings', 			'1KN', 'Prophets',	TRUE, FALSE),
	('2 Kings',				'2KN', 'Prophets',	TRUE, FALSE),
	('1 Chronicles',		'1CH', 'Prophets',	TRUE, FALSE),
	('2 Chronicles',		'2CH', 'Prophets',	TRUE, FALSE),
	('Ezra', 				'EZR', 'Writings',	TRUE, FALSE),
	('Nehemiah',			'NHM', 'Writings',	TRUE, FALSE),
--	('Tobit', 				'TBT', 'Apocrypha',	TRUE, TRUE),
--	('Judith', 				'JDT', 'Apocrypha',	TRUE, TRUE),
	('Esther', 				'EST', 'Writings',	TRUE, FALSE),
--	('1 Maccabees', 		'1MC', 'Apocrypha',	TRUE, TRUE),
--	('2 Maccabees', 		'2MC', 'Apocrypha',	TRUE, TRUE),
	('Job', 				'JOB', 'Writings',	TRUE, FALSE),
	('Psalms', 				'PSA', 'Writings',	TRUE, FALSE),
	('Proverbs', 			'PRV', 'Writings',	TRUE, FALSE),
	('Ecclesiastes', 		'ECC', 'Writings',	TRUE, FALSE),
	('Song of Solomon'		'SOS', 'Writings',	TRUE, FALSE),
--	('Canticles',			'CNT', 'Apocrypha',	TRUE, TRUE),
--	('Wisdom',				'WSD', 'Apocrypha',	TRUE, TRUE),
--	('Sirach',				'SRC', 'Apocrypha',	TRUE, TRUE),
	('Isaiah',				'ISA', 'Prophets',	TRUE, FALSE),
	('Jeremiah',			'JER', 'Prophets',	TRUE, FALSE),
	('Lamentations',		'LMN', 'Prophets',	TRUE, FALSE),
--	('Baruch',				'BRC', 'Prophets',	TRUE, TRUE),
	('Ezekiel',				'EZK', 'Prophets',	TRUE, FALSE),
	('Daniel',				'DAN', 'Prophets',	TRUE, FALSE),
	('Hosea',				'HOS', 'Prophets',	TRUE, FALSE),
	('Joel',				'JOL', 'Prophets',	TRUE, FALSE),
	('Amos',				'AMS', 'Prophets',	TRUE, FALSE),
	('Jonah',				'JNH', 'Prophets',	TRUE, FALSE),
	('Micah',				'MCH', 'Prophets',	TRUE, FALSE),
	('Nahum',				'NHM', 'Prophets',	TRUE, FALSE),
	('Habakkuk',			'HBK', 'Prophets',	TRUE, FALSE),
	('Zephaniah',			'ZPH', 'Prophets',	TRUE, FALSE),
	('Haggai',				'HGG', 'Prophets',	TRUE, FALSE),
	('Zechariah',			'ZCH', 'Prophets',	TRUE, FALSE),
	('Malachi',				'MLC', 'Prophets',	TRUE, FALSE),
	('Matthew',				'MTT', 'Gospels',	FALSE, FALSE),
	('Mark',				'MRK', 'Gospels',	FALSE, FALSE),
	('Luke',				'LKE', 'Gospels',	FALSE, FALSE),
	('John',				'JHN', 'Gospels',	FALSE, FALSE),
	('Acts',				'ACT', 'Gospels',	FALSE, FALSE),
	('Romans',				'RMN', 'Letters',	FALSE, FALSE),
	('1 Corinthians',		'1CN', 'Letters',	FALSE, FALSE),
	('2 Corinthians',		'2CN', 'Letters',	FALSE, FALSE),
	('Galatians',			'GLT', 'Letters',	FALSE, FALSE),
	('Ephesians',			'EPH', 'Letters',	FALSE, FALSE),
	('Philippians',			'PHI', 'Letters',	FALSE, FALSE),
	('Colosians',			'COL', 'Letters',	FALSE, FALSE),
	('1 Thessalonians',		'1TH', 'Letters',	FALSE, FALSE),
	('2 Thessalonians',		'2TH', 'Letters',	FALSE, FALSE),
	('1 Timothy',			'1TM', 'Letters',	FALSE, FALSE),
	('2 Timothy',			'2TM', 'Letters',	FALSE, FALSE),
	('Titus',				'TTS', 'Letters',	FALSE, FALSE),
	('Philemon',			'PHL', 'Letters',	FALSE, FALSE),
	('Hebrews',				'HBR', 'Letters',	FALSE, FALSE),
	('James',				'JMS', 'Letters',	FALSE, FALSE),
	('1 Peter',				'1PT', 'Letters',	FALSE, FALSE),
	('2 Peter',				'2PT', 'Letters',	FALSE, FALSE),
	('1 John',				'1JH', 'Letters',	FALSE, FALSE),
	('2 John',				'2JH', 'Letters',	FALSE, FALSE),
	('John',				'3JH', 'Letters',	FALSE, FALSE),
	('Jude',				'JDE', 'Letters',	FALSE, FALSE),
	('Revelation',			'REV', 'Hidden',	FALSE, FALSE)--,
--	('Apocalypse',			'APC', 'Hidden',	FALSE, TRUE)
;


CREATE TABLE Verse						--represents the values which are common to all translations of the text
(
	v_id		TEXT	PRIMARY KEY FOREIGN KEY,
	break		TEXT,					--this will be where I store what the app will display between each verse, e.g. space, line break, three line breaks
	poetry		BOOLEAN,				--will become NOT NULL once I figure out which is which...
	red_text	BOOLEAN,				--will become NOT NULL once I figure out which is which...
	o_language	TEXT
);
/*
INSERT INTO Verse
VALUES
	();
	()
;	*/



/* To be added later, this table with data about the authors.
CREATE TABLE Author						--represents the primary authors of these books, or their anonymity as the case might be
(
	a_id	INTEGER		AUTO INCREMENT	PRIMARY KEY,
	name	TEXT		NOT NULL,
	b_year	INTEGER 	NOT NULL,
	d_year	INTEGER 	NOT NULL,
	trade	TEXT		NOT NULL		--what was the primary profession or job of the author?
);

INSERT INTO Author						--all dates are based on estimates found online
VALUES									--if both dates are zeros, then they will be considered null values in the python script
	('Moses bar Amram',				-1712,	-1592,	'shepherd'),
	('Joshua bar Nun',				-1672,	-1552,	'general'),
	('Samuel bar Elkanah',			-1070,	-1012,	'prophet'),
	('David bar Jesse',				-1000,	-1000,	'shephard'),
	('Solomon Jedidiah',			-1000,	-1000,	'king'),
	('Asaph', 						-1000,	-1000,	'musician'),
	('Nathan bar Attai',			-1000,	-1000, 	'prophet'),
	('Ezra the Scribe',				-480,	-440,	'priest'),
	('Isaiah bar Amoz',				-1000,	-1000,	'prophet'),
	('Jeremiah',					-1000,	-1000,	'prophet'),
	('Baruch',						-1000,	-1000,	'scribe'),
	('Paul the Apostle',			-1000,	-1000,	'lawyer'),
	('Luke of Antioch',				-1000,	-1000,	'physician'),
	('John Mark Golobadactylos',	-1000,	-1000,	''),
	('the Sons of Korah',			0,		0,		'priest'),
	('anonymous',					0,		0,		'unknown')
;*/



COMMIT;