CREATE TABLE `customers`
(
    `id`       bigint       NOT NULL AUTO_INCREMENT,
    `email`    varchar(150) NOT NULL,
    `name`     varchar(50)  NOT NULL,
    `surnname` varchar(75)  NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `email` (`email`)
)