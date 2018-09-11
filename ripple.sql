/* CREDITS TO Emily/Sunpy! */;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
CREATE DATABASE IF NOT EXISTS `ripple` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ripple`;

CREATE TABLE IF NOT EXISTS `2fa` (
  `userid` int(11) NOT NULL,
  `ip` int(11) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `2fa_telegram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `2fa_totp` (
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(128) NOT NULL,
  `icon` varchar(32) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `badges` (`name`, `icon`) VALUES
('Beta tester 1.5', 'fa-gift'),
('None', '');


CREATE TABLE IF NOT EXISTS `bancho_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(127) NOT NULL,
  `public_read` tinyint(4) NOT NULL,
  `public_write` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `temp` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


INSERT INTO `bancho_channels` (`id`, `name`, `description`, `public_read`, `public_write`, `status`, `temp`, `hidden`) VALUES
(1, '#osu', 'Main Ripple channel', 1, 1, 1, 0, 0),
(2, '#announce', 'Announce channel', 1, 0, 1, 0, 0),
(3, '#admin', 'Admin only channel', 0, 0, 1, 0, 0),
(4, '#italian', 'Italian community channel', 1, 1, 1, 0, 0),
(5, '#english', 'English speaking channel', 1, 1, 1, 0, 0);


CREATE TABLE IF NOT EXISTS `bancho_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_from_userid` int(11) NOT NULL,
  `msg_from_username` varchar(30) NOT NULL,
  `msg_to` varchar(32) NOT NULL,
  `msg` varchar(127) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `bancho_private_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_from_userid` int(11) NOT NULL,
  `msg_from_username` varchar(30) NOT NULL,
  `msg_to` varchar(32) NOT NULL,
  `msg` varchar(127) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `bancho_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_string` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `bancho_settings` (`name`, `value_int`, `value_string`) VALUES
('bancho_maintenance', 0, ''),
('free_direct', 1, ''),
('menu_icon', 0, 'https://i.imgur.com/L61sxgX.png|http://emily.steffen.sexy'),
('login_messages', 0, ''),
('restricted_joke', 0, ''),
('login_notification', 0, 'Welcome to pep.py'),
('osu_versions', 0, ''),
('osu_md5s', 0, '');


CREATE TABLE IF NOT EXISTS `bancho_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(16) NOT NULL,
  `osu_id` int(11) NOT NULL,
  `latest_message_id` int(11) NOT NULL,
  `latest_private_message_id` int(11) NOT NULL,
  `latest_packet_time` int(11) NOT NULL,
  `latest_heavy_packet_time` int(11) NOT NULL,
  `joined_channels` varchar(512) NOT NULL,
  `game_mode` tinyint(4) NOT NULL,
  `action` int(11) NOT NULL,
  `action_text` varchar(128) NOT NULL,
  `kicked` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `beatmaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beatmap_id` int(11) NOT NULL DEFAULT '0',
  `beatmapset_id` int(11) NOT NULL DEFAULT '0',
  `beatmap_md5` varchar(32) NOT NULL DEFAULT '',
  `song_name` varchar(128) NOT NULL DEFAULT '',
  `ar` float NOT NULL DEFAULT '0',
  `od` float NOT NULL DEFAULT '0',
  `difficulty_std` float NOT NULL DEFAULT '0',
  `difficulty_taiko` float NOT NULL DEFAULT '0',
  `difficulty_ctb` float NOT NULL DEFAULT '0',
  `difficulty_mania` float NOT NULL DEFAULT '0',
  `max_combo` int(11) NOT NULL DEFAULT '0',
  `hit_length` int(11) NOT NULL DEFAULT '0',
  `bpm` int(11) NOT NULL DEFAULT '0',
  `ranked` tinyint(4) NOT NULL DEFAULT '0',
  `latest_update` int(11) NOT NULL DEFAULT '0',
  `ranked_status_freezed` tinyint(1) NOT NULL DEFAULT '0',
  `playcount` int(11) NOT NULL DEFAULT '0',
  `passcount` int(11) NOT NULL DEFAULT '0',
  `pp_100` int(11) NOT NULL DEFAULT '0',
  `pp_99` int(11) NOT NULL DEFAULT '0',
  `pp_98` int(11) NOT NULL DEFAULT '0',
  `pp_95` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `beatmaps_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beatmap_md5` varchar(32) NOT NULL DEFAULT '',
  `beatmap_name` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `beta_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_md5` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(128) NOT NULL DEFAULT '',
  `allowed` tinyint(4) NOT NULL DEFAULT '0',
  `public` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `beta_keys` (`key_md5`, `description`, `allowed`, `public`) VALUES
('110fe4a3830966be01d0b513fcdb4f66', 'betakey', 1, 1);

CREATE TABLE IF NOT EXISTS `cakes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `score_id` int(11) NOT NULL,
  `processes` blob NOT NULL,
  `detected` json NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `discord_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `discordid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `docs` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `doc_name` varchar(255) NOT NULL DEFAULT 'New Documentation File',
  `doc_contents` mediumtext NOT NULL,
  `public` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `old_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `eggs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('hash','path','file','title') NOT NULL DEFAULT 'hash',
  `value` varchar(128) NOT NULL,
  `tag` varchar(128) NOT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT '0',
  `is_regex` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `hw_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `mac` varchar(32) NOT NULL,
  `unique_id` varchar(32) NOT NULL,
  `disk_id` varchar(32) NOT NULL,
  `occurencies` int(11) NOT NULL DEFAULT '0',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `identity_tokens` (
  `userid` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `ip_user` (
  `userid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `occurencies` int(11) NOT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `irc_tokens` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `token` varchar(32) NOT NULL DEFAULT '',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `leaderboard_ctb` (
  `position` int(10) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `v` bigint(20) NOT NULL,
  PRIMARY KEY (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `leaderboard_mania` (
  `position` int(10) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `v` bigint(20) NOT NULL,
  PRIMARY KEY (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `leaderboard_std` (
  `position` int(10) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `v` bigint(20) NOT NULL,
  PRIMARY KEY (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `leaderboard_taiko` (
  `position` int(10) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `v` bigint(20) NOT NULL,
  PRIMARY KEY (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `main_menu_icons` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(128) NOT NULL,
  `is_current` tinyint(1) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `osin_access` (
  `scope` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `client` int(11) NOT NULL DEFAULT '0',
  `extra` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `osin_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secret` varchar(64) NOT NULL DEFAULT '',
  `extra` varchar(127) NOT NULL DEFAULT '',
  `redirect_uri` varchar(127) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `osin_client_user` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `password_recovery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(80) NOT NULL,
  `u` varchar(30) NOT NULL,
  `t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `privileges_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `privileges` int(11) NOT NULL,
  `color` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `privileges_groups` (`name`, `privileges`, `color`) VALUES
('Banned', 0, ''),
('BAT', 267, ''),
('Chat Moderators', 2883911, ''),
('Community Manager ', 978427, ''),
('Developer', 1043995, ''),
('Donor', 7, ''),
('God', 1048575, 'primary'),
('Normal User', 3, ''),
('Pending', 1048576, ''),
('Restricted', 2, '');

CREATE TABLE IF NOT EXISTS `profile_backgrounds` (
  `uid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `rank_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `type` varchar(8) NOT NULL,
  `time` int(11) NOT NULL,
  `blacklisted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bid` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `remember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `series_identifier` int(11) DEFAULT NULL,
  `token_sha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `from_username` varchar(32) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `open_time` varchar(18) NOT NULL,
  `update_time` varchar(18) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `response` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beatmap_md5` varchar(32) NOT NULL DEFAULT '',
  `userid` int(11) NOT NULL,
  `score` bigint(20) DEFAULT NULL,
  `max_combo` int(11) NOT NULL DEFAULT '0',
  `full_combo` tinyint(1) NOT NULL DEFAULT '0',
  `mods` int(11) NOT NULL DEFAULT '0',
  `300_count` int(11) NOT NULL DEFAULT '0',
  `100_count` int(11) NOT NULL DEFAULT '0',
  `50_count` int(11) NOT NULL DEFAULT '0',
  `katus_count` int(11) NOT NULL DEFAULT '0',
  `gekis_count` int(11) NOT NULL DEFAULT '0',
  `misses_count` int(11) NOT NULL DEFAULT '0',
  `time` varchar(18) NOT NULL DEFAULT '',
  `play_mode` tinyint(4) NOT NULL DEFAULT '0',
  `completed` tinyint(11) NOT NULL DEFAULT '0',
  `accuracy` float(15,12) DEFAULT NULL,
  `pp` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_string` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `system_settings` (`id`, `name`, `value_int`, `value_string`) VALUES (NULL, 'registrations_enabled', '1', 'True');

CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(31) NOT NULL,
  `privileges` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `token` varchar(127) NOT NULL,
  `private` tinyint(4) NOT NULL,
  `last_updated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `username_safe` varchar(30) NOT NULL,
  `password_md5` varchar(127) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `register_datetime` int(10) NOT NULL,
  `rank` tinyint(1) NOT NULL DEFAULT '1',
  `achievements_version` int(11) NOT NULL DEFAULT '0',
  `allowed` tinyint(1) NOT NULL DEFAULT '1',
  `latest_activity` int(10) NOT NULL DEFAULT '0',
  `silence_end` int(11) NOT NULL DEFAULT '0',
  `silence_reason` varchar(127) NOT NULL DEFAULT '',
  `notes` varchar(127) NOT NULL DEFAULT '',
  `ban_datetime` int(11) NOT NULL DEFAULT '0',
  `password_version` tinyint(4) NOT NULL DEFAULT '1',
  `privileges` int(11) NOT NULL,
  `donor_expire` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

ALTER TABLE `users` AUTO_INCREMENT=999;

CREATE TABLE IF NOT EXISTS `users_achievements` (
  `user_id` int(11) NOT NULL,
  `achievement_id` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `users_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `users_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `username_aka` varchar(32) NOT NULL DEFAULT '',
  `user_color` varchar(16) NOT NULL DEFAULT 'black',
  `user_style` varchar(128) NOT NULL DEFAULT '',
  `ranked_score_std` bigint(20) DEFAULT NULL,
  `playcount_std` int(11) NOT NULL DEFAULT '0',
  `total_score_std` bigint(20) DEFAULT NULL,
  `replays_watched_std` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ranked_score_taiko` bigint(20) DEFAULT NULL,
  `playcount_taiko` int(11) NOT NULL DEFAULT '0',
  `total_score_taiko` bigint(20) DEFAULT NULL,
  `replays_watched_taiko` int(11) NOT NULL DEFAULT '0',
  `ranked_score_ctb` bigint(20) DEFAULT NULL,
  `playcount_ctb` int(11) NOT NULL DEFAULT '0',
  `total_score_ctb` bigint(20) DEFAULT NULL,
  `replays_watched_ctb` int(11) NOT NULL DEFAULT '0',
  `ranked_score_mania` bigint(20) DEFAULT NULL,
  `playcount_mania` int(11) NOT NULL DEFAULT '0',
  `total_score_mania` bigint(20) DEFAULT NULL,
  `replays_watched_mania` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_hits_std` int(11) NOT NULL DEFAULT '0',
  `total_hits_taiko` int(11) NOT NULL DEFAULT '0',
  `total_hits_ctb` int(11) NOT NULL DEFAULT '0',
  `total_hits_mania` int(11) NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT 'XX',
  `show_country` tinyint(4) NOT NULL DEFAULT '1',
  `level_std` int(11) NOT NULL DEFAULT '1',
  `level_taiko` int(11) NOT NULL DEFAULT '1',
  `level_ctb` int(11) NOT NULL DEFAULT '1',
  `level_mania` int(11) NOT NULL DEFAULT '1',
  `avg_accuracy_std` float(15,12) NOT NULL DEFAULT '0.000000000000',
  `avg_accuracy_taiko` float(15,12) NOT NULL DEFAULT '0.000000000000',
  `avg_accuracy_ctb` float(15,12) NOT NULL DEFAULT '0.000000000000',
  `avg_accuracy_mania` float(15,12) NOT NULL DEFAULT '0.000000000000',
  `pp_std` int(11) NOT NULL DEFAULT '0',
  `pp_taiko` int(11) NOT NULL DEFAULT '0',
  `pp_ctb` int(11) NOT NULL DEFAULT '0',
  `pp_mania` int(11) NOT NULL DEFAULT '0',
  `badges_shown` varchar(24) NOT NULL DEFAULT '1,0,0,0,0,0',
  `safe_title` tinyint(4) NOT NULL DEFAULT '0',
  `userpage_content` mediumtext,
  `play_style` smallint(6) NOT NULL DEFAULT '0',
  `favourite_mode` tinyint(4) NOT NULL DEFAULT '0',
  `custom_badge_icon` varchar(32) NOT NULL DEFAULT '',
  `custom_badge_name` varchar(32) NOT NULL DEFAULT '',
  `can_custom_badge` tinyint(1) NOT NULL DEFAULT '0',
  `show_custom_badge` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

ALTER TABLE `users_stats` AUTO_INCREMENT=999;

CREATE TABLE IF NOT EXISTS `user_badges` (
  `user` int(11) NOT NULL,
  `badge` int(11) NOT NULL,
  UNIQUE INDEX (`user`, `badge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `rap_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `text` varchar(512) NOT NULL,
  `datetime` int(11) NOT NULL,
  `through` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users`(`username`, `username_safe`, `password_md5`, `salt`, `email`, `register_datetime`, `rank`, `allowed`, `latest_activity`, `silence_end`, `silence_reason`, `password_version`, `privileges`, `flags`) VALUES ('FokaBot', 'fokabot', '', '', 'fo@kab.ot', '1452544880', '4', '1', '0', '0', '', 1, 978427, 0);

INSERT INTO `users_stats`(`username`, `username_aka`, `user_color`, `user_style`, `ranked_score_std`, `playcount_std`, `total_score_std`, `replays_watched_std`, `ranked_score_taiko`, `playcount_taiko`, `total_score_taiko`, `replays_watched_taiko`, `ranked_score_ctb`, `playcount_ctb`, `total_score_ctb`, `replays_watched_ctb`, `ranked_score_mania`, `playcount_mania`, `total_score_mania`, `replays_watched_mania`, `total_hits_std`, `total_hits_taiko`, `total_hits_ctb`, `total_hits_mania`, `country`, `show_country`, `level_std`, `level_taiko`, `level_ctb`, `level_mania`, `avg_accuracy_std`, `avg_accuracy_taiko`, `avg_accuracy_ctb`, `avg_accuracy_mania`, `pp_std`, `pp_taiko`, `pp_ctb`, `pp_mania`, `badges_shown`, `safe_title`, `userpage_content`, `play_style`, `favourite_mode`) VALUES ('FokaBot', '', 'black', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'XX', '1', '0', '0', '0', '0', '0.000000000000', '0.000000000000', '0.000000000000', '0.000000000000', '0', '0', '0', '0', '3,4,11,0,0,0', '0', '', 0, 0);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
