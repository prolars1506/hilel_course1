CREATE TABLE `drivers`
(
    `id`         bigint       NOT NULL AUTO_INCREMENT,
    `cars_id`    bigint DEFAULT NULL,
    `LICENSE_ID` varchar(16)  NOT NULL,
    `full_name`  varchar(150) NOT NULL,
    `birthdate`  date         NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `LICENSE_ID` (`LICENSE_ID`),
    KEY          `cars_id` (`cars_id`),
    CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`cars_id`) REFERENCES `cars` (`id`) ON DELETE SET NULL
)