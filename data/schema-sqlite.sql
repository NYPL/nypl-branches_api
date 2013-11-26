CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL PRIMARY KEY,
  `loc_id` int(11) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `name` mediumtext,
  `address` varchar(255) DEFAULT NULL,
  `xstreet` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `created` DATETIME NOT NULL,
  `modified` DATETIME DEFAULT NULL
);

CREATE UNIQUE INDEX branches_bl ON branches (branch_id, loc_id);
CREATE INDEX branches_locs ON branches (loc_id);

CREATE TABLE `floors` (
  `floor_id` int(11) NOT NULL PRIMARY KEY,
  `loc_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created` DATETIME NOT NULL,
  `modified` DATETIME DEFAULT NULL,
  `order` tinyint(4) DEFAULT '0'
);

CREATE UNIQUE INDEX floors_bid ON floors (`floor_id`, `branch_id`);

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL PRIMARY KEY,
  `loc_id` int(11) DEFAULT NULL,
  `floor_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created` DATETIME NOT NULL,
  `modified` DATETIME DEFAULT NULL,
  `order` tinyint(4) DEFAULT '0'
);

CREATE TABLE `locations` (
  `loc_id` int(11) NOT NULL PRIMARY KEY,
  `name` mediumtext,
  `description` mediumtext,
  `phone` varchar(10) DEFAULT NULL,
  `fax` varchar(10) DEFAULT NULL,
  `tty` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `handicapped_access` tinyint(1) DEFAULT NULL,
  `activities` varchar(255) DEFAULT NULL,
  `created` DATETIME NOT NULL,
  `modified` DATETIME DEFAULT NULL,
  `amenities` varchar(2000) DEFAULT NULL,
  `socialmedia` varchar(2000) DEFAULT NULL,
  `floorplan` varchar(2000) DEFAULT NULL,
  `division_referral` varchar(500) DEFAULT NULL
);

