# SQL Commands from "PHP and MySQL for Dynamic Web Sites: Visual QuickPro Guide (5th Edition)"
# Written by Larry Ullman, Published September 2017

# This file contains the CREATE, INSERT, and ALTER SQL statements used in the book, listed by chapter.
# The SQL commands here are from the steps where they are entered into the MySQL client.
# SQL commands from the tips and from the PHP scripts are not included.
# You SHOULD NOT attempt to run this file in MySQL as is. Cut and paste the specific commands as needed.
# This file is encoded in UTF8 to support the characters in various languages. For more information, see Chapter 6.


# ---------
# Chapter 5
# ---------

CREATE DATABASE sitename;

USE sitename;

CREATE TABLE users (
user_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
email VARCHAR(60) NOT NULL,
pass CHAR(128) NOT NULL,
registration_date DATETIME NOT NULL,
PRIMARY KEY (user_id)
);

INSERT INTO users
(first_name, last_name, email, pass, registration_date)
VALUES ('Larry', 'Ullman', 'email@example.com', SHA2('mypass', 512), NOW());

INSERT INTO users VALUES
(NULL, 'Zoe', 'Isabella', 'email2@example.com', SHA2('mojito', 512), NOW());

INSERT INTO users (first_name, last_name, email, pass, registration_date) VALUES
('John', 'Lennon', 'john@beatles.com', SHA2('Happin3ss', 512), NOW()),
('Paul', 'McCartney', 'paul@beatles.com', SHA2('letITbe', 512), NOW()),
('George', 'Harrison', 'george@beatles.com ', SHA2('something', 512), NOW()),
('Ringo', 'Starr', 'ringo@beatles.com', SHA2('thisboy', 512), NOW());

INSERT INTO users (first_name, last_name, email, pass, registration_date) VALUES
('David', 'Jones', 'davey@monkees.com', SHA2('fasfd', 512), NOW()),
('Peter', 'Tork', 'peter@monkees.com', SHA2('warw', 512), NOW()),
('Micky', 'Dolenz', 'micky@monkees.com ', SHA2('afsa', 512), NOW()),
('Mike', 'Nesmith', 'mike@monkees.com', SHA2('abdfadf', 512), NOW()),
('David', 'Sedaris', 'david@authors.com', SHA2('adfwrq', 512), NOW()),
('Nick', 'Hornby', 'nick@authors.com', SHA2('jk78', 512), NOW()),
('Melissa', 'Bank', 'melissa@authors.com', SHA2('jhk,h', 512), NOW()),
('Toni', 'Morrison', 'toni@authors.com', SHA2('hdhd', 512), NOW()),
('Jonathan', 'Franzen', 'jonathan@authors.com', SHA2('64654', 512), NOW()),
('Don', 'DeLillo', 'don@authors.com', SHA2('asf8', 512), NOW()),
('Graham', 'Greene', 'graham@authors.com', SHA2('5684eq', 512), NOW()),
('Michael', 'Chabon', 'michael@authors.com', SHA2('srw6', 512), NOW()),
('Richard', 'Brautigan', 'richard@authors.com', SHA2('zfs654', 512), NOW()),
('Russell', 'Banks', 'russell@authors.com', SHA2('wwr321', 512), NOW()),
('Homer', 'Simpson', 'homer@simpson.com', SHA2('5srw651', 512), NOW()),
('Marge', 'Simpson', 'marge@simpson.com', SHA2('ljsa', 512), NOW()),
('Bart', 'Simpson', 'bart@simpson.com', SHA2('pwqojz', 512), NOW()),
('Lisa', 'Simpson', 'lisa@simpson.com', SHA2('uh6', 512), NOW()),
('Maggie', 'Simpson', 'maggie@simpson.com', SHA2('plda664', 512), NOW()),
('Abe', 'Simpson', 'abe@simpson.com', SHA2('qopkrokr65', 512), NOW());

UPDATE users SET email='mike@authors.com' WHERE user_id = 18;

DELETE FROM users WHERE user_id = 8 LIMIT 1;


# ---------
# Chapter 6
# ---------

CREATE DATABASE forum CHARACTER SET utf8 COLLATE utf8_general_ci;
USE forum;

CREATE TABLE forums (
forum_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(60) NOT NULL,
PRIMARY KEY (forum_id),
UNIQUE (name)
) ENGINE = INNODB;

CREATE TABLE messages (
message_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
parent_id INT UNSIGNED NOT NULL DEFAULT 0,
forum_id TINYINT UNSIGNED NOT NULL,
user_id MEDIUMINT UNSIGNED NOT NULL,
subject VARCHAR(100) NOT NULL,
body LONGTEXT NOT NULL,
date_entered DATETIME NOT NULL,
PRIMARY KEY (message_id),
INDEX (parent_id),
INDEX (forum_id),
INDEX (user_id),
INDEX (date_entered)
) ENGINE = INNODB;

CREATE TABLE users (
user_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
pass CHAR(128) NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
email VARCHAR(60) NOT NULL,
PRIMARY KEY (user_id),
UNIQUE (username),
UNIQUE (email),
INDEX login (pass, email)
) ENGINE = INNODB;

CHARSET utf8;

INSERT INTO forums (name) VALUES
('MySQL'), ('PHP'), ('Sports'),
('HTML'), ('CSS'), ('Kindling');
INSERT INTO forums (name) VALUES ('Modern Dance');

INSERT INTO users (username, pass, first_name, last_name, email) VALUES
('troutster', SHA2('mypass', 512), 'Larry', 'Ullman', 'lu@example.com'),
('funny man', SHA2('monkey', 512), 'David', 'Brent', 'db@example.com'),
('Gareth', SHA2('asstmgr', 512), 'Gareth', 'Keenan', 'gk@example.com');
INSERT INTO users (username, pass, first_name, last_name, email) VALUES
('tim', SHA2('psych', 512) , 'Tim', 'Canterbury', 'tc@example.com'),
('finchy', SHA2('jerk', 512), 'Chris', 'Finch', 'cf@example.com');

SELECT * FROM forums;
SELECT user_id, username FROM users;
INSERT INTO messages (parent_id, forum_id, user_id, subject, body, date_entered) VALUES
(0, 1, 1, 'Question about normalization.', 'I''m confused about normalization. For the second normal form (2NF), I read...', UTC_TIMESTAMP()),
(0, 1, 2, 'Database Design', 'I''m creating a new database and am having problems with the structure. How many tables should I have?...', UTC_TIMESTAMP()),
(2, 1, 2, 'Database Design', 'The number of tables your database includes...', UTC_TIMESTAMP()),
(0, 1, 3, 'Database Design', 'Okay, thanks!', UTC_TIMESTAMP()),
(0, 2, 3, 'PHP Errors', 'I''m using the scripts from Chapter 3 and I can''t get the first calculator example to work. When I submit the form...', UTC_TIMESTAMP());
INSERT INTO messages (parent_id, forum_id, user_id, subject, body, date_entered) VALUES
(5, 2, 1, 'PHP Errors', 'What version of PHP are you using?', UTC_TIMESTAMP()),
(6, 2, 3, 'PHP Errors', 'Version 5.2', UTC_TIMESTAMP()),
(7, 2, 1, 'PHP Errors', 'In that case, try the debugging steps outlined in Chapter 7.', UTC_TIMESTAMP()),
(0, 3, 2, 'Chicago Bulls', 'Can the Bulls really win it all this year?', UTC_TIMESTAMP()),
(9, 3, 1, 'Chicago Bulls', 'I don\'t know, but they sure look good!', UTC_TIMESTAMP()),
(0, 5, 3, 'CSS Resources', 'Where can I found out more information about CSS?', UTC_TIMESTAMP()),
(11, 5, 1, 'CSS Resources', 'Read Elizabeth Castro''s excellent book on (X)HTML and CSS. Or search Google on "CSS".', UTC_TIMESTAMP()),
(0, 4, 3, 'HTML vs. XHTML', 'What are the differences between HTML and XHTML?', UTC_TIMESTAMP()),
(13, 4, 1, 'HTML vs. XHTML', 'XHTML is a cross between HTML and XML. The differences are largely syntactic. Blah, blah, blah...', UTC_TIMESTAMP()),
(0, 6, 4, 'Why?', 'Why do you have a forum dedicated to kindling? Don''t you deal mostly with PHP, MySQL, and so forth?', UTC_TIMESTAMP()),
(0, 2, 3, 'Dynamic HTML using PHP', 'Can I use PHP to dynamically generate HTML on the fly? Thanks...', UTC_TIMESTAMP()),
(16, 2, 1, 'Dynamic HTML using PHP', 'You most certainly can.', UTC_TIMESTAMP()),
(17, 2, 3, 'Dynamic HTML using PHP, still not clear', 'Um, how?', UTC_TIMESTAMP()),
(18, 2, 2, 'Dynamic HTML using PHP, clearer?', 'I think what Larry is trying to say is that you should buy and read his book.', UTC_TIMESTAMP()),
(15, 6, 4, 'Why? Why? Why?', 'Really, why?', UTC_TIMESTAMP()),
(20, 6, 1, 'Because', 'Because', UTC_TIMESTAMP());

# Demo foreign constraint
USE test;
CREATE TABLE parent (
parent_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
PRIMARY KEY (parent_id)
);
INSERT INTO parent VALUES (1);

CREATE TABLE child (
child_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
parent_id INT UNSIGNED NOT NULL,
PRIMARY KEY (child_id),
FOREIGN KEY (parent_id) REFERENCES parent (parent_id)
);
INSERT INTO child VALUES (1,1);
DELETE FROM parent WHERE parent_id=1;
INSERT INTO child
(child_id, parent_id)
VALUES (NULL, 12343234);


CREATE DATABASE banking CHARACTER SET utf8 COLLATE utf8_general_ci;
USE banking;

CREATE TABLE customers (
customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
PRIMARY KEY (customer_id),
INDEX full_name (last_name, first_name)
) ENGINE = INNODB;

CREATE TABLE accounts (
account_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
customer_id INT UNSIGNED NOT NULL,
type ENUM('Checking', 'Savings') NOT NULL,
balance DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
PRIMARY KEY (account_id),
INDEX (customer_id),
FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = INNODB;

CREATE TABLE transactions (
transaction_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
to_account_id INT UNSIGNED NOT NULL,
from_account_id INT UNSIGNED NOT NULL,
amount DECIMAL(5,2) UNSIGNED NOT NULL,
date_entered TIMESTAMP NOT NULL,
PRIMARY KEY (transaction_id),
INDEX (to_account_id),
INDEX (from_account_id),
INDEX (date_entered),
FOREIGN KEY (to_account_id) REFERENCES accounts (account_id)
ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (from_account_id) REFERENCES accounts (account_id)
ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = INNODB;

INSERT INTO customers (first_name, last_name)
VALUES ('Sarah', 'Vowell'), ('David', 'Sedaris'), ('Kojo', 'Nnamdi');
INSERT INTO accounts (customer_id, balance)
VALUES (1, 5460.23), (2, 909325.24), (3, 892.00);
INSERT INTO accounts (customer_id, type, balance)
VALUES (2, 'Savings', 13546.97);

# ---------
# Chapter 7
# ---------

CREATE TABLE preferences (
receive_emails TINYINT UNSIGNED NOT NULL
)

ALTER TABLE messages ADD FULLTEXT (body, subject);
ALTER TABLE customers ADD COLUMN pin VARBINARY(16) NOT NULL;
ALTER TABLE customers ADD COLUMN nacl VARBINARY(64) NOT NULL;

UPDATE customers SET nacl = UNHEX(SHA2(RAND(), 512)) WHERE customer_id=1;
UPDATE customers SET pin=AES_ENCRYPT(1234, nacl) WHERE customer_id=1;

# ---------
# Chapter 17
# ---------

SET NAMES utf8;

CREATE DATABASE forum2 CHARACTER SET utf8;

USE forum2;

CREATE TABLE languages (
lang_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
lang VARCHAR(60) NOT NULL,
lang_eng VARCHAR(20) NOT NULL,
PRIMARY KEY (lang_id),
UNIQUE (lang)
);

CREATE TABLE threads (
thread_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
lang_id TINYINT(3) UNSIGNED NOT NULL,
user_id INT UNSIGNED NOT NULL,
subject VARCHAR(150) NOT NULL,
PRIMARY KEY  (thread_id),
INDEX (lang_id),
INDEX (user_id)
);

CREATE TABLE posts (
post_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
thread_id INT UNSIGNED NOT NULL,
user_id INT UNSIGNED NOT NULL,
message TEXT NOT NULL,
posted_on DATETIME NOT NULL,
PRIMARY KEY (post_id),
INDEX (thread_id),
INDEX (user_id)
);

CREATE TABLE users (
user_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
lang_id TINYINT UNSIGNED NOT NULL,
time_zone VARCHAR(30) NOT NULL,
username VARCHAR(30) NOT NULL,
pass VARCHAR(255) NOT NULL,
email VARCHAR(60) NOT NULL,
PRIMARY KEY (user_id),
UNIQUE (username),
UNIQUE (email),
INDEX login (username, pass)
);

CREATE TABLE words (
word_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
lang_id TINYINT UNSIGNED NOT NULL,
title VARCHAR(80) NOT NULL,
intro TINYTEXT NOT NULL,
home VARCHAR(30) NOT NULL,
forum_home VARCHAR(40) NOT NULL,
`language` VARCHAR(40) NOT NULL,
register VARCHAR(30) NOT NULL,
login VARCHAR(30) NOT NULL,
logout VARCHAR(30) NOT NULL,
new_thread VARCHAR(40) NOT NULL,
subject VARCHAR(30) NOT NULL,
body VARCHAR(30) NOT NULL,
submit VARCHAR(30) NOT NULL,
posted_on VARCHAR(30) NOT NULL,
posted_by VARCHAR(30) NOT NULL,
replies VARCHAR(30) NOT NULL,
latest_reply VARCHAR(40) NOT NULL,
post_a_reply VARCHAR(40) NOT NULL,
PRIMARY KEY (word_id),
UNIQUE (lang_id)
);

INSERT INTO languages (lang, lang_eng) VALUES
('English', 'English'),
('Português', 'Portuguese'),
('Français', 'French'),
('Norsk', 'Norwegian'),
('Romanian', 'Romanian'),
('Ελληνικά', 'Greek'),
('Deutsch', 'German'),
('Srpski', 'Serbian'),
('日本語', 'Japanese'),
('Nederlands', 'Dutch');

INSERT INTO users (lang_id, time_zone, username, pass, email) VALUES
(1, 'US/Eastern', 'troutster', '', 'email@example.com'),
(7, 'Europe/Berlin', 'Ute', '', 'email1@example.com'),
(4, 'Europe/Oslo', 'Silje', '', 'email2@example.com'),
(2, 'America/Sao_Paulo', 'João', '', 'email3@example.com'),
(1, 'Pacific/Auckland', 'kiwi', '', 'kiwi@example.org');

INSERT INTO words VALUES
(NULL,1, 'PHP and MySQL for Dynamic Web Sites: The Forum!', '<p>Welcome to our site....please use the links above...blah,  blah,  blah.</p>\r\n<p>Welcome to our site....please use the links above...blah,  blah, blah.</p>', 'Home', 'Forum Home', 'Language', 'Register', 'Login', 'Logout', 'New Thread', 'Subject', 'Body', 'Submit', 'Posted on', 'Posted by', 'Replies', 'Latest Reply', 'Post a Reply'),
(NULL,4, 'PHP og MySQL for Dyaniske Websider: Forumet!', '<p>Velkommen til denne siden. Introduksjonstekst.</p>\r\n<p>Velkommen til denne siden. Introduksjonstekst.</p>', 'Hjem', 'Forumet Hjem', 'Språk', 'Registrer deg', 'Logg inn', 'Logg ut', 'Ny tråd', 'Emne', 'Kropp', 'SUBMIT', 'Lagt til', 'Lagt til av', 'REPLIES', 'LATEST REPLY', 'POST A REPLY'),
(NULL,5, 'Forumul PHP si MySQL pentru site-uri web dinamice', 'Bine ati venit pe acest site. Text introductiv. Bine ati venit pe acest site. Text introductiv. Bine ati venit pe acest site. Text introductiv.', 'Acasa', 'Forumul Acasa', 'Limba', 'Inregistrare', 'Conectare', 'Deconectare', 'Discutie noua', 'Subiect', 'Continut', 'SUBMIT', 'Afisat pe', 'Afisat de', 'REPLIES', 'LATEST REPLY', 'POST A REPLY'),
(NULL,3, 'Sites internet dynamiques avec PHP et MySQL : le forum!', 'Bienvenue sur ce site. Texte d''introduction. Bienvenue sur ce site. Texte d''introduction. Bienvenue sur ce site. Texte d''introduction.', 'Accueil', 'Le Forum Accueil', 'Langue', 'S''enregistrer', 'Se connecter', 'Déconnexion', 'Nouvelle discussion', 'Sujet', 'Contenu', 'Soumettez', 'Posté le', 'Posté par', 'Réponses', 'La Plus défunte Réponse', 'Signalez une réponse'),
(NULL,7, 'PHP en MYSQL voor Dynamische Websites: Het Forum!', 'Welkom op deze site! Inleidingstekst. Hier vind je alles op het gebied van php!', 'Index', 'Forum Index', 'Taal', 'Registreer', 'Uitloggen', 'Inloggen', 'Nieuw onderwerp', 'Onderwerp', 'Body', 'SUBMIT', 'Geplaatst op', 'Geplaatst door', 'REPLIES', 'LATEST REPLY', 'POST A REPLY'),
(NULL,9, 'PHP とMySqlでのだいなみっくなウエブサイト：フォラムです！', 'ようこそこのウエブサイトにおいでくださいました。紹介文。 ようこそこのウエブサイトにおいでくださいました。紹介文。', '話題', '返答を提示', '新しい スレツド ', 'ホーム', 'フォラムのホウムペイジ', '言語', 'レジスター', ' ログイン', 'ログアウト', '本文', 'サブミット', '掲示日', ' 掲示者', '返答数', '最新の返答');

INSERT INTO `threads` (`thread_id`, `lang_id`, `user_id`, `subject`) VALUES
(1, 4, 1, 'Byttet til PHP 7.0 fra PHP 5.0 - variabler utilgjengelige'),
(2, 4, 2, 'Automatisk bildekontroll'),
(3, 3, 5, 'Lancer une Page HTML en PHP'),
(4, 3, 4, 'Ajouter des adresses a PHP List depuis un formulaire'),
(5, 9, 4, '取引をおこなう'),
(7, 1, 1, 'Sample Thread');

INSERT INTO `posts` (`post_id`, `thread_id`, `user_id`, `message`, `posted_on`) VALUES
(1, 1, 3, 'Jeg har nettopp gått over til PHP 5.0 og forsøkte å benytte meg av mine gamle scripts. Dette viste seg å være noe vanskelig ettersom de bare generer feil. Hovedproblemet virker å være at jeg ikke får tilgang til variabler som tidligere var tilgjengelige. Noen som har noen forslag?', '2017-10-29 04:15:52'),
(2, 1, 1, 'Har du sjekket om variablene du prøver å få tilgang på er superglobals? Dette forandret seg fra 4.2 og utover, tror jeg...', '2017-10-29 04:20:52'),
(3, 1, 4, 'Hva er superglobals?', '2017-10-29 04:30:30'),
(4, 1, 1, 'http://no.php.net/variables.predefined', '2017-10-30 06:16:30'),
(5, 1, 5, 'Linken Terje ga er manualsiden, men du kan også ta en titt på http://www.linuxjournal.com/article/6559 for en grundig innføring og forklaring. Lykke til!', '2017-10-29 10:26:57'),
(6, 2, 2, 'Har sett flere sider hvor man må skrive inn noen tall for å kunne laste ned, registrere seg, osv. Er dette PHP? Kan noen hjelpe meg å få til en slik?', '2017-10-29 22:45:57'),
(7, 3, 1, 'Je voudrais afficher simplement une nouvelle page HTML ou PHP dans mon\r\nnavigateur web depuis un bout de programme en PHP.\r\nLancer par exemple http://www.google.fr/ depuis un condition if (a>0)\r\nJe trouve pas de solution sur google ni dans mes bouquins', '2017-10-29 04:42:38'),
(8, 3, 2, 'header("Location: http://www.domaine.com");\r\nAttention, cette fonction doit être utilisé avant toute sortie vers le navigateur... le moindre echo et c''est foutu\r\n', '2017-10-29 05:17:38'),
(9, 4, 3, 'J''utilise PHP List. J''ai un formulaire contact avec une case à cocher\r\npermettant de choisir de s''abonner à une newsletter. Je traite ce\r\nformullaire en PHP.\r\nExiste-t-il un moyen au moment où je traite le formulaire d''ajouter la\r\npersonne dans ma liste de diffusion PHP List ?\r\nJe suppose que le problème n''est pas compliqué mais je n''ai pas encore\r\ntrouvé comment faire...\r\n', '2017-10-29 04:43:28'),
(10, 4, 5, 'Dans ce genre de problématiques le mieux est de :\r\na/ regarder de quelle manière php list gère les abonnés dans la base ( en\r\ngros, regarder la structure de la table ).\r\nb/ créer une fonction qui ajoute manuellement les données de votre\r\nformulaire dans la ou les tables mysql utilisée(s) par php list ( en se\r\nméfiant des doublons : est ce que cette adresse est déjà dans la liste ? )\r\nc/ faire un ou plusieurs tests...\r\n', '2017-10-31 12:06:28'),
(11, 5, 2, 'PHP を使って　MySqlでは、取引を どのようにしたら良いかと　\r\nまよっています。良い方法が、あったらおしえてください。', '2017-10-29 04:57:55'),
(12, 5, 3, '次のようにしたらどうですか？', '2017-10-29 04:57:55'),
(13, 5, 4, '反れとも、このようにも　できます。', '2017-10-29 04:58:10'),
(14, 7, 1, 'This is the body of the sample thread. This is the body of the sample thread. This is the body of the sample thread. ', '2017-10-29 05:12:02'),
(15, 7, 1, 'I like your thread. It''s simple and sweet.', '2017-10-29 05:44:07');


# ----------
# Chapter 18
# ----------

CREATE DATABASE ch18;

USE ch18;

CREATE TABLE users (
user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
email VARCHAR(80) NOT NULL,
pass VARCHAR(255) NOT NULL,
user_level TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
active CHAR(32),
registration_date DATETIME NOT NULL,
PRIMARY KEY (user_id),
UNIQUE KEY (email),
INDEX login (email, pass)
);
