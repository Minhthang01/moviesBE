drop database if exists movie_app;
create database movie_app;
use movie_app;


drop table if exists `movies_slider`;
create table `movies_slider` (
	`id` bigint not null auto_increment,
    `name` varchar(255) default null,
    `overview` varchar(500) default null,
    `backdrop_path` varchar(555) default null,
    `video_url` varchar(555) default null,
    primary key(`id`)
);

DROP TABLE IF EXISTS 	`User`;
CREATE TABLE IF NOT EXISTS `User` ( 	
	id 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`username`	 	VARCHAR(50) NOT NULL UNIQUE CHECK (LENGTH(`username`) >= 6 AND LENGTH(`username`) <= 50),
	`email` 		VARCHAR(50) NOT NULL UNIQUE CHECK (LENGTH(`email`) >= 6 AND LENGTH(`email`) <= 50),
	`password` 		VARCHAR(800) NOT NULL,
	`firstName` 	NVARCHAR(50) NOT NULL,
	`lastName` 		NVARCHAR(50) NOT NULL,
	`role` 			ENUM('Admin','Employee','Manager') NOT NULL DEFAULT 'Employee',
    is_deleted		BOOLEAN
);

insert into `movies_slider` (`name`,`overview`, `backdrop_path`, `video_url`) values ('Avatar 2', 'Jake Sully lives with his newfound family formed on the planet of Pandora. Once a familiar threat returns to finish what was previously started, Jake must work with Neytiri and the army of the Navi race to protect their planet.', 'https://wallpaperaccess.com/full/6360552.jpg', 'https://youtu.be/a8Gx8wiNbs8');
insert into `movies_slider` (`name`,`overview`, `backdrop_path`, `video_url`) values ('The Lord of the Rings: The Fellowship of the Ring', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 'https://wallpapercave.com/wp/wp2770636.png', 'https://youtu.be/w-Ulf__1HZc');
insert into `movies_slider` (`name`,`overview`, `backdrop_path`, `video_url`) values('Transformers: Age of Extinction', 'When humanity allies with a bounty hunter in pursuit of Optimus Prime, the Autobots turn to a mechanic and his family for help.', 'https://i.pinimg.com/originals/cd/42/a0/cd42a0ab82572559d52365c594a1a18c.jpg', 'https://youtu.be/02EWdhM69IE');
insert into `movies_slider` (`name`,`overview`, `backdrop_path`, `video_url`) values('Godzilla vs. Kong', 'The epic next chapter in the cinematic Monsterverse pits two of the greatest icons in motion picture history against each other--the fearsome Godzilla and the mighty Kong--with humanity caught in the balance.', 'https://images.hdqwalls.com/wallpapers/godzilla-vs-kong-fight-5k-e3.jpg', 'https://youtu.be/odM92ap8_c0');
insert into `movies_slider` (`name`,`overview`, `backdrop_path`, `video_url`) values('The Conjuring 2', 'Ed and Lorraine Warren travel to North London to help a single mother raising four children alone in a house plagued by a supernatural spirit.', 'https://wallpaperaccess.com/full/802735.jpg', 'https://youtu.be/VFsmuRPClr4');


create table type_movie(
	`type_id` bigint not null auto_increment,
    `type_name` enum('popular', 'top_rated', 'trending', 'comedy'),
    primary key(`type_id`));
    
insert into type_movie(`type_name`) values('popular');
insert into type_movie(`type_name`) values('top_rated');
insert into type_movie(`type_name`) values('trending');
insert into type_movie(`type_name`) values('comedy');

drop table if exists `movies`;
create table `movies` (
	`movie_id` bigint not null auto_increment,
    `name` varchar(255) default null,
    `overview` varchar(500) default null,
    `poster_path` varchar(555) default null,
    `backdrop_path` varchar(555) default null,
    `video_url` varchar(555) default null,
    `type_id` bigint,
    primary key(`movie_id`),
    foreign key	(`type_id`) references type_movie(`type_id`) on delete set null
);

DROP TABLE IF EXISTS 	`Registration_User_Token`;
CREATE TABLE IF NOT EXISTS `Registration_User_Token` ( 	
	id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`token`	 		CHAR(36) NOT NULL UNIQUE,
	`user_id` 		SMALLINT UNSIGNED NOT NULL,
	`expiryDate` 	DATETIME NOT NULL
);

DROP TABLE IF EXISTS 	`Reset_Password_Token`;
CREATE TABLE IF NOT EXISTS `Reset_Password_Token` ( 	
	id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`token`	 		CHAR(36) NOT NULL UNIQUE,
	`user_id` 		SMALLINT UNSIGNED NOT NULL,
	`expiryDate` 	DATETIME NOT NULL
);

DROP TABLE IF EXISTS 	`Xep_Hang`;
CREATE TABLE IF NOT EXISTS `Xep_Hang` ( 	
	id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`xep_hang`	 	TINYINT,
	`danh_gia` 		VARCHAR(800),
	`like`			BOOLEAN
);

/*Popular*/
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Avatar', 'A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.', 'https://m.media-amazon.com/images/M/MV5BZDA0OGQxNTItMDZkMC00N2UyLTg3MzMtYTJmNjg3Nzk5MzRiXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_FMjpg_UX1000_.jpg', 'https://images.wallpapersden.com/image/download/original-avatar-movie-poster_bGdoaWaUmZqaraWkpJRnZWltrWZqamg.jpg', 'https://youtu.be/cN0kUKNBfxE', 1);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Avengers: Endgame', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos actions and restore balance to the universe.', 'https://m.media-amazon.com/images/I/71A9WUijFOL.jpg', 'https://2.bp.blogspot.com/-3dZHwWyteoM/XKpNr-qOOjI/AAAAAAAABUw/fXMZ0SC12dIyeWqQjrNTLwQ71upVGOHJgCKgBGAs/w3840-h2400-c/avengers-endgame-uhdpaper.com-8K-94.jpg', 'https://youtu.be/dmFwB0WEEDY', 1);
insert into `movies`(`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Star Wars: The Force Awakens', 'As a new threat to the galaxy rises, Rey, a desert scavenger, and Finn, an ex-stormtrooper, must join Han Solo and Chewbacca to search for the one hope of restoring peace.', 'https://image.tmdb.org/t/p/original/97FvEYBZaclReIVgN17wH4YnLLO.jpg', 'https://wallpaperaccess.com/full/1603213.jpg', 'https://www.imdb.com/video/vi2762323481/?playlistId=tt2488496&ref_=tt_pr_ov_vi', 1);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Avengers 3: Infinity War', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', 'https://image.winudf.com/v2/image/Y29tLndBdmVuZ2Vyc0luZmluaXR5V2FySGRXYWxscGFwZXJzXzc5NDA2NjRfc2NyZWVuXzBfMTUzODY1MTY0M18wOTI/screen-0.jpg?fakeurl=1&type=.webp', 'https://cdn.wallpapersafari.com/91/82/KE5BlQ.jpg', 'https://youtu.be/CXZJywjPkpI', 1);
insert into `movies`(`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Jurassic World', 'A new theme park, built on the original site of Jurassic Park, creates a genetically modified hybrid dinosaur, the Indominus Rex, which escapes containment and goes on a killing spree.', 'https://m.media-amazon.com/images/M/MV5BNzQ3OTY4NjAtNzM5OS00N2ZhLWJlOWUtYzYwZjNmOWRiMzcyXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg', 'https://images.alphacoders.com/615/615287.jpg', 'https://youtu.be/RFinNxS5KN4', 1);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('The Avengers', 'Earths mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.', 'https://i.pinimg.com/originals/cd/19/a0/cd19a0a7d5f828dde3de3c6a2fc415be.jpg', 'https://wallpaperaccess.com/full/311206.jpg', 'https://youtu.be/udKE1ksKWDE', 1);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Fast & Furious 7','Deckard Shaw seeks revenge against Dominic Toretto and his family for his comatose brother.', 'https://i.pinimg.com/originals/8c/85/bd/8c85bd16e8f280991b86f3ee7a852cae.jpg', 'https://ultimateactionmovies.com/wp-content/uploads/2020/05/Furious-7.jpg', 'https://youtu.be/JVg5X7dUlLM', 1);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Frozen II','When the newly crowned Queen Elsa accidentally uses her power to turn things into ice to curse her home in infinite winter, her sister Anna teams up with a mountain man, his playful reindeer, and a snowman to change the weather condition.', 'https://i.pinimg.com/originals/aa/64/55/aa64557b9aac8bc35b654117c42ef17f.jpg', 'https://wallpaperaccess.com/full/1891284.jpg', 'https://youtu.be/Zi4LMpSDccc', 1);
insert into `movies`(`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Black Panther','T Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his countrys past.' , 'https://wallpaper.dog/large/20357208.jpg', 'https://mewallpaper.com/thumbnail/movies/6249-black-panther-background-hq-image-free-wallpaper.jpg', 'https://youtu.be/xjDjIWPwcPU', 1);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Harry Potter 7: Harry Potter And The Deathly Hallows', 'Harry, Ron, and Hermione search for Voldemorts remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.', 'https://cdn.europosters.eu/image/1300/posters/harry-potter-deathly-hallows-i104624.jpg', 'https://wallpaperaccess.com/full/2821146.jpg', 'https://youtu.be/MxqsmsA8y5k', 1);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Transformers', 'An ancient struggle between two Cybertronian races, the heroic Autobots and the evil Decepticons, comes to Earth, with a clue to the ultimate power held by a teenager.', 'https://m.media-amazon.com/images/M/MV5BNDg1NTU2OWEtM2UzYi00ZWRmLWEwMTktZWNjYWQ1NWM1OThjXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg', 'https://images2.alphacoders.com/424/thumb-1920-42470.jpg', 'https://youtu.be/v8ItGrI-Ou0', 1);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Kung Fu Panda', 'To everyones surprise, including his own, Po, an overweight, clumsy panda, is chosen as protector of the Valley of Peace. His suitability will soon be tested as the valleys arch-enemy is on his way.', 'https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg', 'https://cdn.wallpapersafari.com/99/30/cJRiLS.jpg', 'https://youtu.be/PXi3Mv6KMzY', 1);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Logan', 'In a future where mutants are nearly extinct, an elderly and weary Logan leads a quiet life. But when Laura, a mutant child pursued by scientists, comes to him for help, he must get her to safety.', 'https://i.pinimg.com/564x/c0/63/97/c063976d615b196f1dc97a86800db97b--hd-movies-movies-online.jpg', 'https://m.media-amazon.com/images/M/MV5BYTM1ZmFhMTAtOWQzMi00NTg3LWJiNjYtNTBhMGY5YzVkNGYwXkEyXkFqcGdeQXVyNzI1NzMxNzM@._V1_.jpg', 'https://youtu.be/Div0iP65aZo', 1);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('The Amazing Spider-Man', 'After Peter Parker is bitten by a genetically altered spider, he gains newfound, spider-like powers and ventures out to save the city from the machinations of a mysterious reptilian foe.', 'https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_.jpg', 'https://i.pinimg.com/originals/b0/f6/a6/b0f6a6a8e9b83662e1ef621bb892e2f0.jpg', 'https://youtu.be/ta7aBk9pDzk', 1);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('John Wick: Chapter 3 - Parabellum', 'John Wick is on the run after killing a member of the international assassins guild, and with a $14 million price tag on his head, he is the target of hit men and women everywhere.', 'https://www.themoviedb.org/t/p/original/jeNTqOnux7KSulznSh4UdiDlfmV.jpg' , 'https://images3.alphacoders.com/103/thumb-1920-1033561.jpg', 'https://youtu.be/v00zKyXbfD4', 1);

/*top rates*/
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('The Incredible Hulk', 'Bruce Banner, a scientist on the run from the U.S. Government, must find a cure for the monster he turns into whenever he loses his temper.', 'https://m.media-amazon.com/images/M/MV5BMTUyNzk3MjA1OF5BMl5BanBnXkFtZTcwMTE1Njg2MQ@@._V1_.jpg', 'https://images7.alphacoders.com/322/322052.jpg', 'https://youtu.be/g_WVSozgbVM', 2);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Iron Man', 'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.', 'https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_FMjpg_UX1000_.jpg', 'https://wallpaperaccess.com/full/1925945.jpg', 'https://youtu.be/PjJofEuSA78', 2);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Thor', 'The powerful but arrogant god Thor is cast out of Asgard to live amongst humans in Midgard (Earth), where he soon becomes one of their finest defenders.', 'https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_FMjpg_UX1000_.jpg', 'https://wallpaperaccess.com/full/1771517.jpg', 'https://youtu.be/TmLcJ6UO5_Y', 2);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Captain America: The First Avenger', 'Steve Rogers, a rejected military soldier, transforms into Captain America after taking a dose of a "Super-Soldier serum". But being Captain America comes at a price as he attempts to take down a warmonger and a terrorist organization.', 'https://m.media-amazon.com/images/M/MV5BMTYzOTc2NzU3N15BMl5BanBnXkFtZTcwNjY3MDE3NQ@@._V1_FMjpg_UX1000_.jpg', 'https://wallpaperaccess.com/full/1826375.jpg', 'https://youtu.be/CEfbnrwva-8', 2);
insert into `movies` (`name`,`overview`, `poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Iron Man 2', 'With the world now aware of his identity as Iron Man, Tony Stark must contend with both his declining health and a vengeful mad man with ties to his fathers legacy.', 'https://m.media-amazon.com/images/M/MV5BNWFlMjllMmItODk4NS00YTE1LTg1YzktMDMyYmQzNzc5NzdlXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg', 'https://images.alphacoders.com/689/689262.jpg', 'https://youtu.be/fFBYy8PFxHg', 2);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Avengers: Age of Ultron', 'When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and its up to Earths mightiest heroes to stop the villainous Ultron from enacting his terrible plan.', 'https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_.jpg', 'https://wallpapergets.com/wallpaper/full/7/7/e/1567055.jpg', 'https://youtu.be/BSG5iHK9Scw', 2);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Iron Man 3', 'When Tony Starks world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution.', 'https://m.media-amazon.com/images/M/MV5BMjE5MzcyNjk1M15BMl5BanBnXkFtZTcwMjQ4MjcxOQ@@._V1_.jpg', 'https://images8.alphacoders.com/378/thumb-1920-378546.jpg', 'https://youtu.be/4ENfIYFnni0', 2);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Thor: The Dark World', 'When the Dark Elves attempt to plunge the universe into darkness, Thor must embark on a perilous and personal journey that will reunite him with doctor Jane Foster.', 'https://m.media-amazon.com/images/M/MV5BMTQyNzAwOTUxOF5BMl5BanBnXkFtZTcwMTE0OTc5OQ@@._V1_FMjpg_UX1000_.jpg', 'https://wallpaperaccess.com/full/1653473.jpg', 'https://youtu.be/uPNK0C9oMHQ', 2);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Captain America: The Winter Soldier', 'As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat from history: an assassin known as the Winter Soldier.', 'https://m.media-amazon.com/images/M/MV5BMzA2NDkwODAwM15BMl5BanBnXkFtZTgwODk5MTgzMTE@._V1_FMjpg_UX1000_.jpg', 'https://wallpaperaccess.com/full/153821.jpg', 'https://youtu.be/bp6hhq8DdgU', 2);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Guardians of the Galaxy', 'A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.', 'https://pbs.twimg.com/media/BvMILmNCYAAOY6U.jpg', 'https://wallpaperaccess.com/full/96390.jpg', 'https://youtu.be/noP9HY8nXvY', 2);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Ant-Man', 'Armed with a super-suit with the astonishing ability to shrink in scale but increase in strength, cat burglar Scott Lang must embrace his inner hero and help his mentor, Dr. Hank Pym, pull off a plan that will save the world.', 'https://www.joblo.com/wp-content/uploads/2015/06/ant-man-international-2-1.jpg', 'https://wallpaperaccess.com/full/2475894.jpg', 'https://youtu.be/OFqRej80iIY', 2);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Captain America: Civil War', 'Political involvement in the Avengers'' affairs causes a rift between Captain America and Iron Man.', 'https://m.media-amazon.com/images/M/MV5BMjQ0MTgyNjAxMV5BMl5BanBnXkFtZTgwNjUzMDkyODE@._V1_.jpg', 'https://images5.alphacoders.com/689/thumb-1920-689398.jpg', 'https://youtu.be/cfVY9wLKltA', 2);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Doctor Strange', 'While on a journey of physical and spiritual healing, a brilliant neurosurgeon is drawn into the world of the mystic arts.', 'https://image.tmdb.org/t/p/original/shs4kJZKqDImuMI8kdfyl6v6PPR.jpg', 'https://wallpaperaccess.com/full/621125.jpg', 'https://youtu.be/LrHTR22pIhw', 2);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Spider-Man: Homecoming', 'Peter Parker balances his life as an ordinary high school student in Queens with his superhero alter-ego Spider-Man, and finds himself on the trail of a new menace prowling the skies of New York City.', 'https://c8.alamy.com/comp/2A7JF01/spider-man-homecoming-2017-directed-by-jon-watts-and-starring-tom-holland-michael-keaton-and-robert-downey-jr-peter-parker-takes-on-the-vulture-and-his-alien-technology-2A7JF01.jpg', 'https://images.hdqwalls.com/wallpapers/spider-man-homecoming-2020-gi.jpg', 'https://youtu.be/ORrQKFliVLM', 2);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Thor: Ragnarok', 'Imprisoned on the planet Sakaar, Thor must race against time to return to Asgard and stop Ragnarök, the destruction of his world, at the hands of the powerful and ruthless villain Hela.', 'https://i.pinimg.com/originals/87/34/87/8734877766b7a8e07c6ab0d98406cde2.jpg', 'https://wallpaperaccess.com/full/222191.jpg', 'https://youtu.be/g8XMrJdBxeQ', 2);


/*trending*/
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Captain Marvel', 'Carol Danvers becomes one of the universe''s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.', 'https://wallpaperaccess.com/full/2705935.jpg', 'https://i.pinimg.com/originals/2d/cf/c0/2dcfc0a37cde9590f1d91c81e99777ca.jpg', 'https://youtu.be/ATxnB3hdh5A', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Guardians of the Galaxy Vol. 2', 'The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord''s encounter with his father the ambitious celestial being Ego.', 'https://www.vintagemovieposters.co.uk/wp-content/uploads/2020/11/IMG_0771-482x711.jpeg', 'https://cdn.wallpapersafari.com/46/7/9SthWo.png', 'https://youtu.be/mhc3CinJHYY', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Ant-Man and the Wasp', 'As Scott Lang balances being both a superhero and a father, Hope van Dyne and Dr. Hank Pym present an urgent new mission that finds the Ant-Man fighting alongside The Wasp to uncover secrets from their past.', 'https://m.media-amazon.com/images/M/MV5BYjcyYTk0N2YtMzc4ZC00Y2E0LWFkNDgtNjE1MzZmMGE1YjY1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'https://images2.alphacoders.com/923/thumb-1920-923110.jpg', 'https://youtu.be/mIYQ3bpxcws', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Spider-Man: Far from Home', 'Following the events of Avengers: Endgame (2019), Spider-Man must step up to take on new threats in a world that has changed forever.', 'https://image.tmdb.org/t/p/original/4q2NNj4S5dG2RLF9CpXsej7yXl.jpg', 'https://images7.alphacoders.com/100/thumb-1920-1005138.jpg', 'https://youtu.be/u4ydvYH4L18', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values(' Black Widow ', 'Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.', 'https://m.media-amazon.com/images/M/MV5BNjRmNDI5MjMtMmFhZi00YzcwLWI4ZGItMGI2MjI0N2Q3YmIwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg', 'https://images.alphacoders.com/107/1074451.jpg', 'https://youtu.be/Fp9pNPdNwjI', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Shang-Chi and the Legend of the Ten Rings', 'Shang-Chi, the master of weaponry-based Kung Fu, is forced to confront his past after being drawn into the Ten Rings organization.', 'https://cdn.wallpapersafari.com/58/73/wd3ZS0.jpg', 'https://images8.alphacoders.com/116/1167021.jpg','https://youtu.be/M2KBBogWniI', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Eternals', 'The saga of the Eternals, a race of immortal beings who lived on Earth and shaped its history and civilizations.', 'https://image.tmdb.org/t/p/original/5L7bclqxXtsqsitP83KpkZbgTQ3.jpg', 'https://images2.alphacoders.com/123/1233091.jpg', 'https://youtu.be/1th0YYirLH0', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Spider-Man: No Way Home', 'With Spider-Man''s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.', 'https://terrigen-cdn-dev.marvel.com/content/prod/1x/snh_online_6072x9000_posed_01.jpg', 'https://images2.alphacoders.com/117/1170277.jpg', 'https://youtu.be/yknvwyHiz4Q', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Doctor Strange in the Multiverse of Madness','Doctor Strange teams up with a mysterious teenage girl from his dreams who can travel across multiverses, to battle multiple threats, including other-universe versions of himself, which threaten to wipe out millions across the multiverse. They seek help from Wanda the Scarlet Witch, Wong and others.', 'https://metropolisjapan.com/wp-content/uploads/2022/05/Doctor-Strange-and-the-Multiverse-of-Madness.jpg', 'https://unlimited-tech.com/wp-content/uploads/2022/04/marvel-doctor-strange-in-the-multiverse-of-madness.png', 'https://youtu.be/aWzlQ2N6qqg', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Thor: Love and Thunder', 'Thor enlists the help of Valkyrie, Korg and ex-girlfriend Jane Foster to fight Gorr the God Butcher, who intends to make the gods extinct.', 'https://pbs.twimg.com/media/FTe6Z_MVEAArAVK?format=jpg&name=medium', 'https://images3.alphacoders.com/124/thumb-1920-1241167.png','https://youtu.be/tgB1wUcmbbw', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Spider-Man', 'When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family.', 'https://i.pinimg.com/originals/e5/68/56/e568565863fa74fba1bc617c9513de8a.jpg', 'https://wallpaperaccess.com/full/2136304.jpg', 'https://youtu.be/q2DMDQWMpWs', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Transformers: Revenge of the Fallen', 'Sam Witwicky leaves the Autobots behind for a normal life. But when his mind is filled with cryptic symbols, the Decepticons target him and he is dragged back into the Transformers'' war.', 'https://m.media-amazon.com/images/M/MV5BNjk4OTczOTk0NF5BMl5BanBnXkFtZTcwNjQ0NzMzMw@@._V1_FMjpg_UX1000_.jpg', 'https://wallpapercave.com/wp/wp4242482.jpg', 'https://youtu.be/DgQHgy7Nmkk', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('The Dark Knight', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg', 'https://wallpaper.dog/large/17108253.jpg', 'https://youtu.be/1BmLvIjyMd4', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('X-Men Origins: Wolverine', 'The early years of James Logan, featuring his rivalry with his brother Victor Creed, his service in the special forces team Weapon X, and his experimentation into the metal-lined mutant Wolverine.', 'https://m.media-amazon.com/images/M/MV5BZWRhMzdhMzEtZTViNy00YWYyLTgxZmUtMTMwMWM0NTEyMjk3XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_FMjpg_UX1000_.jpg', 'https://images6.alphacoders.com/795/thumb-1920-795212.jpg', 'https://youtu.be/gSsRYVLAly4', 3);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('John Wick: Chapter 2', 'After returning to the criminal underworld to repay a debt, John Wick discovers that a large bounty has been put on his life.', 'https://m.media-amazon.com/images/M/MV5BMjE2NDkxNTY2M15BMl5BanBnXkFtZTgwMDc2NzE0MTI@._V1_.jpg', 'https://images3.alphacoders.com/746/746551.jpg', 'https://www.youtube.com/watch?v=rsuNowyCF0c', 3);


/*comedy*/
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Deadpool', 'A wisecracking mercenary gets experimented on and becomes immortal but ugly, and sets out to track down the man who ruined his looks.', 'https://m.media-amazon.com/images/M/MV5BMDNjYjExMjgtY2U0OS00YzA4LWEzNzQtNzc0YWNkZDIwZDdmXkEyXkFqcGdeQXVyMTYzMDM0NTU@._V1_.jpg', 'https://images3.alphacoders.com/678/thumb-1920-678085.jpg','https://youtu.be/gun_MpxNw_E', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Spider-Man 2', 'Peter Parker is beset with troubles in his failing personal life as he battles a brilliant scientist named Doctor Otto Octavius.', 'https://m.media-amazon.com/images/M/MV5BMzY2ODk4NmUtOTVmNi00ZTdkLTlmOWYtMmE2OWVhNTU2OTVkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg', 'https://wallpaperaccess.com/full/496545.jpg','https://youtu.be/r_W6mXqzJNU',  4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Blade II', 'Blade forms an uneasy alliance with the vampire council in order to combat the Reapers, who are feeding on vampires.', 'https://m.media-amazon.com/images/M/MV5BOWVjZTIzNDYtNTBlNC00NTJjLTkzOTEtOTE0MjlhYzI2YTcyXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_FMjpg_UX1000_.jpg', 'https://images6.alphacoders.com/799/799268.jpg','https://youtu.be/vrEN5Bl2ncI', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Transformers: Dark of the Moon', 'The Autobots learn of a Cybertronian spacecraft hidden on the moon, and race against the Decepticons to reach it and to learn its secrets.', 'https://m.media-amazon.com/images/M/MV5BMTkwOTY0MTc1NV5BMl5BanBnXkFtZTcwMDQwNjA2NQ@@._V1_.jpg', 'https://i.pinimg.com/originals/6c/21/44/6c21445a38262d59ee5efc8c64b611d0.jpg','https://youtu.be/ET9SHYzMz_4', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Venom', 'A failed reporter is bonded to an alien entity, one of many symbiotes who have invaded Earth. But the being takes a liking to Earth and decides to protect it.', 'https://m.media-amazon.com/images/M/MV5BMTU3MTQyNjQwM15BMl5BanBnXkFtZTgwNDgxNDczNTM@._V1_.jpg', 'https://i.pinimg.com/originals/bf/95/b8/bf95b814a772a0010e02b03202fff28e.jpg', 'https://youtu.be/t2nal1gPXNY', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('The Amazing Spider-Man', 'After Peter Parker is bitten by a genetically altered spider, he gains newfound, spider-like powers and ventures out to save the city from the machinations of a mysterious reptilian foe.', 'https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_.jpg', 'https://images2.alphacoders.com/280/thumb-1920-280472.jpg', 'https://youtu.be/miFDbqnZKBo', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Fast & Furious 6', 'Hobbs has Dominic and Brian reassemble their crew to take down a team of mercenaries: Dominic unexpectedly gets sidetracked with facing his presumed deceased girlfriend, Letty.', 'https://m.media-amazon.com/images/M/MV5BMTM3NTg2NDQzOF5BMl5BanBnXkFtZTcwNjc2NzQzOQ@@._V1_FMjpg_UX1000_.jpg', 'https://images6.alphacoders.com/617/617105.jpg', 'https://youtu.be/NGeFA2fWzX8', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Batman v Superman: Dawn of Justice ', 'Batman is manipulated by Lex Luthor to fear Superman. Superman´s existence is meanwhile dividing the world and he is framed for murder during an international crisis. The heroes clash and force the neutral Wonder Woman to reemerge.', 'https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg', 'https://wallpaperaccess.com/full/3401090.png', 'https://youtu.be/X7SiuQxhAjg', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Spider-Man 3', 'A strange black entity from another world bonds with Peter Parker and causes inner turmoil as he contends with new villains, temptations, and revenge.', 'https://m.media-amazon.com/images/M/MV5BYTk3MDljOWQtNGI2My00OTEzLTlhYjQtOTQ4ODM2MzUwY2IwXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_FMjpg_UX1000_.jpg', 'https://wallpaperaccess.com/full/1122373.jpg', 'https://youtu.be/95Pm1E1hMQU', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Transformers: Age of Extinction', 'When humanity allies with a bounty hunter in pursuit of Optimus Prime, the Autobots turn to a mechanic and his family for help.', 'https://m.media-amazon.com/images/M/MV5BMjEwNTg1MTA5Nl5BMl5BanBnXkFtZTgwOTg2OTM4MTE@._V1_.jpg', 'https://images8.alphacoders.com/526/thumb-1920-526085.jpg', 'https://youtu.be/02EWdhM69IE', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Aquaman', 'Arthur Curry, the human-born heir to the underwater kingdom of Atlantis, goes on a quest to prevent a war between the worlds of ocean and land.', 'https://m.media-amazon.com/images/M/MV5BOTk5ODg0OTU5M15BMl5BanBnXkFtZTgwMDQ3MDY3NjM@._V1_UY1200_CR90,0,630,1200_AL_.jpg', 'https://images.wallpapersden.com/image/download/aquaman-2018-movie-poster_a2duaWWUmZqaraWkpJRmbmdlrWZmZ2Y.jpg', 'https://youtu.be/Zp5EqO6gPII', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Venom: Let There Be Carnage', 'Eddie Brock attempts to reignite his career by interviewing serial killer Cletus Kasady, who becomes the host of the symbiote Carnage and escapes prison after a failed execution.', 'https://m.media-amazon.com/images/M/MV5BNzI2Mjg3YjgtOGRlNy00YWMzLWFkMTQtYzcyYjU5ZjRjNmM1XkEyXkFqcGdeQXVyMTQyMTMwOTk0._V1_.jpg', 'https://images6.alphacoders.com/120/thumb-1920-1209905.jpg', 'https://youtu.be/5cPFmJwY-1o', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Godzilla: King of the Monsters', 'The crypto-zoological agency Monarch faces off against a battery of god-sized monsters, including the mighty Godzilla, who collides with Mothra, Rodan, and his ultimate nemesis, the three-headed King Ghidorah.', 'https://m.media-amazon.com/images/M/MV5BOGFjYWNkMTMtMTg1ZC00Y2I4LTg0ZTYtN2ZlMzI4MGQwNzg4XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 'https://images2.alphacoders.com/101/thumb-1920-1017257.jpg', 'https://youtu.be/5BxqahE0fu8', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Kong: Skull Island', 'After the Vietnam war, a team of scientists explores an uncharted island in the Pacific, venturing into the domain of the mighty Kong, and must fight to escape a primal Eden.', 'https://m.media-amazon.com/images/M/MV5BMWUxNjZiNTAtZmMwMi00MmYxLTkxZGEtZWE1MzU0OWFjOTNhXkEyXkFqcGdeQXVyNzk1MzI3MTI@._V1_.jpg', 'https://wallpaperaccess.com/full/1776778.jpg','https://youtu.be/bL9MQZQPefo', 4);
insert into `movies` (`name`,`overview`,`poster_path`, `backdrop_path`, `video_url`, `type_id`) values('Jurassic World: Fallen Kingdom', 'When the island''s dormant volcano begins roaring to life, Owen and Claire mount a campaign to rescue the remaining dinosaurs from this extinction-level event.', 'https://m.media-amazon.com/images/M/MV5BMDkzOTJjNGItZWU3Ni00ZjY5LWIyNWEtM2Q5ODRmMTkwNmUxXkEyXkFqcGdeQXVyNDg2MjUxNjM@._V1_.jpg','https://wallpaperaccess.com/full/2735769.jpg', 'https://youtu.be/FFyCuzQID-M', 4);

select * from `movies`;

INSERT INTO `User`	(`username`,			`email`,						`password`							,			`firstName`,	`lastName`, 	`role`)
values				('hanh.havan@vti',		'hanhhanoi1999@gmail.com',		'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Hà',			'Văn Hanh',			'Manager'), 
					('thanhhung12@vti',		'hung122112@gmail.com',			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn ',		'Thanh Hưng',		'Manager'), 
					('can.tuananh@vti',		'cananh.tuan12@vti.com',		'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Cấn',			'Tuấn Anh',			'Manager'), 
					('toananh123@vti',		'toananh123@vti.com',			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Anh Toàn',			'Manager'), 
					('duynn123@vti',		'duynguyen123@vti.com',			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Duy',				'Manager'), 
					('manhhung123@vti',		'manhhung123@vti.com',			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Mạnh Hùng',		'Manager'),
					('maianhvti123',		'maianhng@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Mai Anh',			'Employee'),
					('tuanvti12344',		'tuan1234@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Văn Tuấn',			'Employee'),
					('ngthuy123',			'thuyhanoi@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Thị Thủy',			'Employee'),
					('quanganhvti',			'quanganh@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Quang Anh',		'Manager'),
					('hoanghungvti',	    'hunghoang@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',   'Vũ',			'Hoàng Hưng',		'Employee'),
					('quocanhvti',			'quocanh12@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Quốc Anh',			'Admin'	),
					('vananhvti',			'vananhb1@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Vân Anh',			'Employee'),
					('nguyentrinhvti',		'trinh123@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Thị Trinh',		'Manager'),
					('tuanhungvti',			'tuanhung@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Vũ',			'Tuấn Hưng',		'Employee'),
					('xuanmaivti',			'xuanmai12@gmail.com', 			'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyễn',		'Xuân Mai',			'Employee'),
					('quanghungvti',		'hungnguyen@gmail.com', 		'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Phạm',			'Quang Hưng',		'Employee');