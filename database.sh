#!/bin/bash

sudo docker exec -it mysql bash -l -c $'
mysql -u root -ppass << EOF

SET SQL_MODE = \'NO_AUTO_VALUE_ON_ZERO\';
CREATE DATABASE IF NOT EXISTS \`ripple\` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE \`ripple\`;

CREATE TABLE \`2fa\` (
  \`userid\` int(11) NOT NULL,
  \`ip\` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`2fa_telegram\` (
  \`userid\` int(11) NOT NULL,
  \`id\` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`2fa_totp\` (
  \`enabled\` tinyint(1) NOT NULL DEFAULT \'0\',
  \`userid\` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`achievements\` (
  \`id\` int(11) NOT NULL,
  \`name\` varchar(32) NOT NULL,
  \`description\` TEXT,
  \`icon\` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`badges\` (
  \`id\` int(11) NOT NULL,
  \`name\` varchar(32) NOT NULL,
  \`icon\` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO \`badges\` (\`id\`, \`name\`, \`icon\`) VALUES
(1, \'Beta tester 1.5\', \'fa-gift\'),
(2, \'None\', \'\');

CREATE TABLE \`bancho_channels\` (
  \`id\` int(11) NOT NULL,
  \`name\` varchar(32) NOT NULL,
  \`description\` varchar(127) NOT NULL,
  \`public_read\` tinyint(4) NOT NULL,
  \`public_write\` tinyint(4) NOT NULL,
  \`status\` tinyint(4) NOT NULL,
  \`temp\` tinyint(1) NOT NULL DEFAULT \'0\',
  \`hidden\` tinyint(1) NOT NULL DEFAULT \'0\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO \`bancho_channels\` (\`id\`, \`name\`, \`description\`, \`public_read\`, \`public_write\`, \`status\`, \`temp\`, \`hidden\`) VALUES
(1, \'#osu\', \'Main Ripple channel\', 1, 1, 1, 0, 0),
(2, \'#announce\', \'Announce channel\', 1, 0, 1, 0, 0),
(3, \'#admin\', \'Admin only channel\', 0, 0, 1, 0, 0),
(4, \'#italian\', \'Italian community channel\', 1, 1, 1, 0, 0),
(5, \'#english\', \'English speaking channel\', 1, 1, 1, 0, 0);

CREATE TABLE \`bancho_messages\` (
  \`id\` int(11) NOT NULL,
  \`msg_from_userid\` int(11) NOT NULL,
  \`msg_from_username\` varchar(30) NOT NULL,
  \`msg_to\` varchar(32) NOT NULL,
  \`msg\` varchar(127) NOT NULL,
  \`time\` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`bancho_private_messages\` (
  \`id\` int(11) NOT NULL,
  \`msg_from_userid\` int(11) NOT NULL,
  \`msg_from_username\` varchar(30) NOT NULL,
  \`msg_to\` varchar(32) NOT NULL,
  \`msg\` varchar(127) NOT NULL,
  \`time\` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`bancho_settings\` (
  \`id\` int(11) NOT NULL,
  \`name\` varchar(32) NOT NULL,
  \`value_int\` int(11) NOT NULL DEFAULT \'0\',
  \`value_string\` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO \`bancho_settings\` (\`id\`, \`name\`, \`value_int\`, \`value_string\`) VALUES
(1, \'bancho_maintenance\', 0, \'\'),
(2, \'free_direct\', 1, \'\'),
(3, \'menu_icon\', 0, \'https://i.imgur.com/L61sxgX.png|http://emily.steffen.sexy\'),
(4, \'login_messages\', 0, \'\'),
(5, \'restricted_joke\', 0, \'\'),
(6, \'login_notification\', 0, \'Welcome to pep.py\'),
(7, \'osu_versions\', 0, \'\'),
(8, \'osu_md5s\', 0, \'\');

CREATE TABLE \`bancho_tokens\` (
  \`id\` int(11) NOT NULL,
  \`token\` varchar(16) NOT NULL,
  \`osu_id\` int(11) NOT NULL,
  \`latest_message_id\` int(11) NOT NULL,
  \`latest_private_message_id\` int(11) NOT NULL,
  \`latest_packet_time\` int(11) NOT NULL,
  \`latest_heavy_packet_time\` int(11) NOT NULL,
  \`joined_channels\` varchar(512) NOT NULL,
  \`game_mode\` tinyint(4) NOT NULL,
  \`action\` int(11) NOT NULL,
  \`action_text\` varchar(128) NOT NULL,
  \`kicked\` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`beatmaps\` (
  \`id\` int(11) NOT NULL,
  \`beatmap_id\` int(11) NOT NULL DEFAULT \'0\',
  \`beatmapset_id\` int(11) NOT NULL DEFAULT \'0\',
  \`beatmap_md5\` varchar(32) NOT NULL DEFAULT \'\',
  \`song_name\` varchar(128) NOT NULL DEFAULT \'\',
  \`ar\` float NOT NULL DEFAULT \'0\',
  \`od\` float NOT NULL DEFAULT \'0\',
  \`difficulty_std\` float NOT NULL DEFAULT \'0\',
  \`difficulty_taiko\` float NOT NULL DEFAULT \'0\',
  \`difficulty_ctb\` float NOT NULL DEFAULT \'0\',
  \`difficulty_mania\` float NOT NULL DEFAULT \'0\',
  \`max_combo\` int(11) NOT NULL DEFAULT \'0\',
  \`hit_length\` int(11) NOT NULL DEFAULT \'0\',
  \`bpm\` int(11) NOT NULL DEFAULT \'0\',
  \`ranked\` tinyint(4) NOT NULL DEFAULT \'0\',
  \`latest_update\` int(11) NOT NULL DEFAULT \'0\',
  \`ranked_status_freezed\` tinyint(1) NOT NULL DEFAULT \'0\',
  \`playcount\` int(11) NOT NULL DEFAULT \'0\',
  \`passcount\` int(11) NOT NULL DEFAULT \'0\',
  \`pp_100\` int(11) NOT NULL DEFAULT \'0\',
  \`pp_99\` int(11) NOT NULL DEFAULT \'0\',
  \`pp_98\` int(11) NOT NULL DEFAULT \'0\',
  \`pp_95\` int(11) NOT NULL DEFAULT \'0\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`beatmaps_names\` (
  \`id\` int(11) NOT NULL,
  \`beatmap_md5\` varchar(32) NOT NULL DEFAULT \'\',
  \`beatmap_name\` varchar(256) NOT NULL DEFAULT \'\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`beta_keys\` (
  \`id\` int(11) NOT NULL,
  \`key_md5\` varchar(32) NOT NULL DEFAULT \'\',
  \`description\` varchar(128) NOT NULL DEFAULT \'\',
  \`allowed\` tinyint(4) NOT NULL DEFAULT \'0\',
  \`public\` tinyint(4) NOT NULL DEFAULT \'0\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO \`beta_keys\` (\`id\`, \`key_md5\`, \`description\`, \`allowed\`, \`public\`) VALUES
(1, \'110fe4a3830966be01d0b513fcdb4f66\', \'betakey\', 1, 1);

CREATE TABLE \`discord_roles\` (
  \`id\` int(11) NOT NULL,
  \`userid\` int(11) NOT NULL,
  \`discordid\` int(11) NOT NULL,
  \`roleid\` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`docs\` (
  \`id\` int(11) UNSIGNED NOT NULL,
  \`doc_name\` varchar(255) NOT NULL DEFAULT \'New Documentation File\',
  \`doc_contents\` mediumtext NOT NULL,
  \`public\` tinyint(1) UNSIGNED NOT NULL DEFAULT \'0\',
  \`old_name\` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE \`hw_user\` (
  \`id\` int(11) NOT NULL,
  \`userid\` int(11) NOT NULL,
  \`mac\` varchar(32) NOT NULL,
  \`unique_id\` varchar(32) NOT NULL,
  \`disk_id\` varchar(32) NOT NULL,
  \`occurencies\` int(11) NOT NULL DEFAULT \'0\',
  \`activated\` tinyint(1) NOT NULL DEFAULT \'0\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`identity_tokens\` (
  \`userid\` int(11) NOT NULL,
  \`token\` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`ip_user\` (
  \`userid\` int(11) NOT NULL,
  \`ip\` text NOT NULL,
  \`occurencies\` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`leaderboard_ctb\` (
  \`position\` int(10) UNSIGNED NOT NULL,
  \`user\` int(11) NOT NULL,
  \`v\` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`leaderboard_mania\` (
  \`position\` int(10) UNSIGNED NOT NULL,
  \`user\` int(11) NOT NULL,
  \`v\` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`leaderboard_std\` (
  \`position\` int(10) UNSIGNED NOT NULL,
  \`user\` int(11) NOT NULL,
  \`v\` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`leaderboard_taiko\` (
  \`position\` int(10) UNSIGNED NOT NULL,
  \`user\` int(11) NOT NULL,
  \`v\` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`osin_access\` (
  \`scope\` int(11) NOT NULL DEFAULT \'0\',
  \`created_at\` int(11) NOT NULL DEFAULT \'0\',
  \`client\` int(11) NOT NULL DEFAULT \'0\',
  \`extra\` int(11) NOT NULL DEFAULT \'0\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`osin_client\` (
  \`id\` int(11) NOT NULL,
  \`secret\` varchar(64) NOT NULL DEFAULT \'\',
  \`extra\` varchar(127) NOT NULL DEFAULT \'\',
  \`redirect_uri\` varchar(127) NOT NULL DEFAULT \'\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`osin_client_user\` (
  \`client_id\` int(11) NOT NULL DEFAULT \'0\',
  \`user\` int(11) NOT NULL DEFAULT \'0\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`password_recovery\` (
  \`id\` int(11) NOT NULL,
  \`k\` varchar(80) NOT NULL,
  \`u\` varchar(30) NOT NULL,
  \`t\` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE \`privileges_groups\` (
  \`id\` int(11) NOT NULL,
  \`name\` varchar(32) NOT NULL,
  \`privileges\` int(11) NOT NULL,
  \`color\` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO \`privileges_groups\` (\`id\`, \`name\`, \`privileges\`, \`color\`) VALUES
(1, \'Banned\', 0, \'\'),
(2, \'BAT\', 267, \'\'),
(3, \'Chat Moderators\', 2883911, \'\'),
(4, \'Community Manager \', 978427, \'\'),
(5, \'Developer\', 1043995, \'\'),
(6, \'Donor\', 7, \'\'),
(7, \'God\', 1048575, \'primary\'),
(8, \'Normal User\', 3, \'\'),
(9, \'Pending\', 1048576, \'\'),
(10, \'Restricted\', 2, \'\');

CREATE TABLE \`profile_backgrounds\` (
  \`uid\` int(11) NOT NULL,
  \`time\` int(11) NOT NULL,
  \`type\` int(11) NOT NULL,
  \`value\` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`rank_requests\` (
  \`id\` int(11) NOT NULL,
  \`userid\` int(11) NOT NULL,
  \`bid\` int(11) NOT NULL,
  \`type\` varchar(8) NOT NULL,
  \`time\` int(11) NOT NULL,
  \`blacklisted\` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`remember\` (
  \`id\` int(11) NOT NULL,
  \`userid\` int(11) NOT NULL,
  \`series_identifier\` int(11) DEFAULT NULL,
  \`token_sha\` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`reports\` (
  \`id\` int(11) NOT NULL,
  \`name\` varchar(128) NOT NULL,
  \`from_username\` varchar(32) NOT NULL,
  \`content\` varchar(1024) NOT NULL,
  \`type\` tinyint(4) NOT NULL,
  \`open_time\` varchar(18) NOT NULL,
  \`update_time\` varchar(18) NOT NULL,
  \`status\` tinyint(4) NOT NULL,
  \`response\` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`scores\` (
  \`id\` int(11) NOT NULL,
  \`beatmap_md5\` varchar(32) NOT NULL DEFAULT \'\',
  \`userid\` int(11) NOT NULL,
  \`score\` bigint(20) DEFAULT NULL,
  \`max_combo\` int(11) NOT NULL DEFAULT \'0\',
  \`full_combo\` tinyint(1) NOT NULL DEFAULT \'0\',
  \`mods\` int(11) NOT NULL DEFAULT \'0\',
  \`300_count\` int(11) NOT NULL DEFAULT \'0\',
  \`100_count\` int(11) NOT NULL DEFAULT \'0\',
  \`50_count\` int(11) NOT NULL DEFAULT \'0\',
  \`katus_count\` int(11) NOT NULL DEFAULT \'0\',
  \`gekis_count\` int(11) NOT NULL DEFAULT \'0\',
  \`misses_count\` int(11) NOT NULL DEFAULT \'0\',
  \`time\` varchar(18) NOT NULL DEFAULT \'\',
  \`play_mode\` tinyint(4) NOT NULL DEFAULT \'0\',
  \`completed\` tinyint(11) NOT NULL DEFAULT \'0\',
  \`accuracy\` float(15,12) DEFAULT NULL,
  \`pp\` float DEFAULT \'0\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`system_settings\` (
  \`id\` int(11) NOT NULL,
  \`name\` varchar(32) NOT NULL,
  \`value_int\` int(11) NOT NULL DEFAULT \'0\',
  \`value_string\` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO \`system_settings\` (\`id\`, \`name\`, \`value_int\`, \`value_string\`) VALUES
(1, \'website_maintenance\', 0, \'\'),
(2, \'game_maintenance\', 0, \'\'),
(3, \'website_global_alert\', 0, \'\'),
(4, \'website_home_alert\', 0, \'\'),
(5, \'registrations_enabled\', 1, \'\');

CREATE TABLE \`tokens\` (
  \`id\` int(11) NOT NULL,
  \`user\` varchar(31) NOT NULL,
  \`privileges\` int(11) NOT NULL,
  \`description\` varchar(255) NOT NULL,
  \`token\` varchar(127) NOT NULL,
  \`private\` tinyint(4) NOT NULL,
  \`last_updated\` int(11) NOT NULL DEFAULT \'0\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`users\` (
  \`id\` int(11) NOT NULL,
  \`username\` varchar(30) NOT NULL,
  \`username_safe\` varchar(30) NOT NULL,
  \`password_md5\` varchar(127) NOT NULL,
  \`salt\` varchar(32) NOT NULL,
  \`email\` varchar(254) NOT NULL,
  \`register_datetime\` int(10) NOT NULL,
  \`rank\` tinyint(1) NOT NULL DEFAULT \'1\',
  \`allowed\` tinyint(1) NOT NULL DEFAULT \'1\',
  \`latest_activity\` int(10) NOT NULL DEFAULT \'0\',
  \`silence_end\` int(11) NOT NULL DEFAULT \'0\',
  \`silence_reason\` varchar(127) NOT NULL DEFAULT \'\',
  \`ban_datetime\` int(11) NOT NULL DEFAULT \'0\',
  \`password_version\` tinyint(4) NOT NULL DEFAULT \'1\',
  \`privileges\` int(11) NOT NULL,
  \`donor_expire\` int(11) NOT NULL DEFAULT \'0\',
  \`flags\` int(11) NOT NULL DEFAULT \'0\',
  \`achievements_version\` int(11) NOT NULL DEFAULT \'0\',
  \`notes\` TEXT NOT NULL DEFAULT \'\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`users_achievements\` (
  \`user_id\` int(11) NOT NULL,
  \`achievement_id\` int(11) NOT NULL,
  \`time\` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`users_relationships\` (
  \`id\` int(11) NOT NULL,
  \`user1\` int(11) NOT NULL,
  \`user2\` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`users_stats\` (
  \`id\` int(11) NOT NULL,
  \`username\` varchar(30) NOT NULL,
  \`username_aka\` varchar(32) NOT NULL DEFAULT \'\',
  \`user_color\` varchar(16) NOT NULL DEFAULT \'black\',
  \`user_style\` varchar(128) NOT NULL DEFAULT \'\',
  \`ranked_score_std\` bigint(20) DEFAULT NULL,
  \`playcount_std\` int(11) NOT NULL DEFAULT \'0\',
  \`total_score_std\` bigint(20) DEFAULT NULL,
  \`replays_watched_std\` int(11) UNSIGNED NOT NULL DEFAULT \'0\',
  \`ranked_score_taiko\` bigint(20) DEFAULT NULL,
  \`playcount_taiko\` int(11) NOT NULL DEFAULT \'0\',
  \`total_score_taiko\` bigint(20) DEFAULT NULL,
  \`replays_watched_taiko\` int(11) NOT NULL DEFAULT \'0\',
  \`ranked_score_ctb\` bigint(20) DEFAULT NULL,
  \`playcount_ctb\` int(11) NOT NULL DEFAULT \'0\',
  \`total_score_ctb\` bigint(20) DEFAULT NULL,
  \`replays_watched_ctb\` int(11) NOT NULL DEFAULT \'0\',
  \`ranked_score_mania\` bigint(20) DEFAULT NULL,
  \`playcount_mania\` int(11) NOT NULL DEFAULT \'0\',
  \`total_score_mania\` bigint(20) DEFAULT NULL,
  \`replays_watched_mania\` int(10) UNSIGNED NOT NULL DEFAULT \'0\',
  \`total_hits_std\` int(11) NOT NULL DEFAULT \'0\',
  \`total_hits_taiko\` int(11) NOT NULL DEFAULT \'0\',
  \`total_hits_ctb\` int(11) NOT NULL DEFAULT \'0\',
  \`total_hits_mania\` int(11) NOT NULL DEFAULT \'0\',
  \`country\` char(2) NOT NULL DEFAULT \'XX\',
  \`show_country\` tinyint(4) NOT NULL DEFAULT \'1\',
  \`level_std\` int(11) NOT NULL DEFAULT \'1\',
  \`level_taiko\` int(11) NOT NULL DEFAULT \'1\',
  \`level_ctb\` int(11) NOT NULL DEFAULT \'1\',
  \`level_mania\` int(11) NOT NULL DEFAULT \'1\',
  \`avg_accuracy_std\` float(15,12) NOT NULL DEFAULT \'0.000000000000\',
  \`avg_accuracy_taiko\` float(15,12) NOT NULL DEFAULT \'0.000000000000\',
  \`avg_accuracy_ctb\` float(15,12) NOT NULL DEFAULT \'0.000000000000\',
  \`avg_accuracy_mania\` float(15,12) NOT NULL DEFAULT \'0.000000000000\',
  \`pp_std\` int(11) NOT NULL DEFAULT \'0\',
  \`pp_taiko\` int(11) NOT NULL DEFAULT \'0\',
  \`pp_ctb\` int(11) NOT NULL DEFAULT \'0\',
  \`pp_mania\` int(11) NOT NULL DEFAULT \'0\',
  \`badges_shown\` varchar(24) NOT NULL DEFAULT \'1,0,0,0,0,0\',
  \`safe_title\` tinyint(4) NOT NULL DEFAULT \'0\',
  \`userpage_content\` mediumtext,
  \`play_style\` smallint(6) NOT NULL DEFAULT \'0\',
  \`favourite_mode\` tinyint(4) NOT NULL DEFAULT \'0\',
  \`custom_badge_icon\` varchar(32) NOT NULL DEFAULT \'\',
  \`custom_badge_name\` varchar(32) NOT NULL DEFAULT \'\',
  \`can_custom_badge\` tinyint(1) NOT NULL DEFAULT \'0\',
  \`show_custom_badge\` tinyint(1) NOT NULL DEFAULT \'0\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE \`user_badges\` (
  \`user\` int(11) NOT NULL,
  \`badge\` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE UNIQUE INDEX \`user_badge\` ON \`user_badges\` (user, badge);

CREATE TABLE \`irc_tokens\` (
  \`userid\` int(11) NOT NULL DEFAULT \'0\',
  \`token\` varchar(32) NOT NULL DEFAULT \'\'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE \`2fa\`
  ADD PRIMARY KEY (\`userid\`);

ALTER TABLE \`2fa_telegram\`
  ADD PRIMARY KEY (\`userid\`);

ALTER TABLE \`2fa_totp\`
  ADD PRIMARY KEY (\`userid\`);

ALTER TABLE \`badges\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`bancho_channels\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`bancho_messages\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`bancho_private_messages\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`bancho_settings\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`bancho_tokens\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`beatmaps\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`beatmaps_names\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`beta_keys\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`discord_roles\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`docs\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`hw_user\`
  ADD PRIMARY KEY (\`id\`),
  ADD UNIQUE KEY \`userid\` (\`userid\`);

ALTER TABLE \`identity_tokens\`
  ADD UNIQUE KEY \`userid\` (\`userid\`);

ALTER TABLE \`ip_user\`
  ADD UNIQUE KEY \`userid\` (\`userid\`);

ALTER TABLE \`leaderboard_ctb\`
  ADD PRIMARY KEY (\`position\`);

ALTER TABLE \`leaderboard_mania\`
  ADD PRIMARY KEY (\`position\`);

ALTER TABLE \`leaderboard_std\`
  ADD PRIMARY KEY (\`position\`);

ALTER TABLE \`leaderboard_taiko\`
  ADD PRIMARY KEY (\`position\`);

ALTER TABLE \`osin_client\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`password_recovery\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`privileges_groups\`
  ADD PRIMARY KEY (\`id\`),
  ADD UNIQUE KEY \`name\` (\`name\`);

ALTER TABLE \`profile_backgrounds\`
  ADD PRIMARY KEY (\`uid\`);

ALTER TABLE \`rank_requests\`
  ADD PRIMARY KEY (\`id\`),
  ADD UNIQUE KEY \`bid\` (\`bid\`);

ALTER TABLE \`remember\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`reports\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`scores\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`system_settings\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`tokens\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`users\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`users_relationships\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`users_stats\`
  ADD PRIMARY KEY (\`id\`);

ALTER TABLE \`user_badges\`
  ADD PRIMARY KEY (\`user\`);

ALTER TABLE \`irc_tokens\`
  ADD UNIQUE KEY \`userid\` (\`userid\`);

ALTER TABLE \`badges\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE \`bancho_channels\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
ALTER TABLE \`bancho_messages\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE \`bancho_private_messages\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE \`bancho_settings\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
ALTER TABLE \`bancho_tokens\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE \`beatmaps\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE \`beatmaps_names\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE \`beta_keys\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE \`discord_roles\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE \`docs\`
  MODIFY \`id\` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE \`hw_user\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE \`osin_client\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE \`password_recovery\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE \`privileges_groups\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
ALTER TABLE \`rank_requests\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE \`remember\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE \`reports\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE \`scores\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE \`system_settings\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
ALTER TABLE \`tokens\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE \`users\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=999;
ALTER TABLE \`users_relationships\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE \`users_stats\`
  MODIFY \`id\` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=999;


INSERT INTO \`users\`(\`id\`, \`username\`, \`username_safe\`, \`password_md5\`, \`salt\`, \`email\`, \`register_datetime\`, \`rank\`, \`allowed\`, \`latest_activity\`, \`silence_end\`, \`silence_reason\`, \`password_version\`, \`privileges\`, \`flags\`) VALUES (\'999\', \'FokaBot\', \'fokabot\', \'\', \'\', \'fo@kab.ot\', \'1452544880\', \'4\', \'1\', \'0\', \'0\', \'\', 1, 978427, 0);

INSERT INTO \`users_stats\`(\`id\`, \`username\`, \`username_aka\`, \`user_color\`, \`user_style\`, \`ranked_score_std\`, \`playcount_std\`, \`total_score_std\`, \`replays_watched_std\`, \`ranked_score_taiko\`, \`playcount_taiko\`, \`total_score_taiko\`, \`replays_watched_taiko\`, \`ranked_score_ctb\`, \`playcount_ctb\`, \`total_score_ctb\`, \`replays_watched_ctb\`, \`ranked_score_mania\`, \`playcount_mania\`, \`total_score_mania\`, \`replays_watched_mania\`, \`total_hits_std\`, \`total_hits_taiko\`, \`total_hits_ctb\`, \`total_hits_mania\`, \`country\`, \`show_country\`, \`level_std\`, \`level_taiko\`, \`level_ctb\`, \`level_mania\`, \`avg_accuracy_std\`, \`avg_accuracy_taiko\`, \`avg_accuracy_ctb\`, \`avg_accuracy_mania\`, \`pp_std\`, \`pp_taiko\`, \`pp_ctb\`, \`pp_mania\`, \`badges_shown\`, \`safe_title\`, \`userpage_content\`, \`play_style\`, \`favourite_mode\`) VALUES (\'999\', \'FokaBot\', \'\', \'black\', \'\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'0\', \'XX\', \'1\', \'0\', \'0\', \'0\', \'0\', \'0.000000000000\', \'0.000000000000\', \'0.000000000000\', \'0.000000000000\', \'0\', \'0\', \'0\', \'0\', \'3,4,11,0,0,0\', \'0\', \'\', 0, 0);


EOF
'
