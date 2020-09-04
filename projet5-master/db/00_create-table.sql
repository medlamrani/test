CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_RoleUser FOREIGN KEY (role_id) REFERENCES role(id),
  CONSTRAINT username_unique UNIQUE  (`username`),
  CONSTRAINT email_unique UNIQUE  (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `editor_id` int(11) NOT NULL,
  `release_date` date NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_PlatformGame FOREIGN KEY (platform_id) REFERENCES platform(id),
  CONSTRAINT FK_EditorGame FOREIGN KEY (editor_id) REFERENCES editor(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `editor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `editor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_GameRating FOREIGN KEY (game_id) REFERENCES game(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `addDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_UserNews FOREIGN KEY (user_id) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `comment_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `report` int(11) NOT NULL,
  `commentDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_GameComment FOREIGN KEY (game_id) REFERENCES game(id) ON DELETE CASCADE,
  CONSTRAINT FK_UserGComment FOREIGN KEY (user_id) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `comment_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `report` int(11) NOT NULL,
  `commentDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_NewsComment FOREIGN KEY (news_id) REFERENCES news(id) ON DELETE CASCADE,
  CONSTRAINT FK_UserComment FOREIGN KEY (user_id) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;




