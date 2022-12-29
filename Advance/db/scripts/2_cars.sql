CREATE TABLE `cars`
(
    `id`      bigint      NOT NULL AUTO_INCREMENT,
    `park_id` int DEFAULT NULL,
    `model`   varchar(50) NOT NULL,
    `year` year NOT NULL,
    `price`   float(11, 2) unsigned DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `park_id` (`park_id`),
  CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`park_id`) REFERENCES `parks` (`id`) ON DELETE SET NULL
)