CREATE TABLE `wizating_stancer` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`plate` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`model` VARCHAR(55) NOT NULL COLLATE 'utf8mb4_general_ci',
	`owned` INT(11) NOT NULL DEFAULT '0',
	`wheels` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`wheelWidth` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`rideHeight` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`wheelSize` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `plate` (`plate`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=24
;
