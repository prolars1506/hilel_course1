CREATE TABLE `orders`
(
    `id`                  bigint unsigned NOT NULL AUTO_INCREMENT,
    `customer_id`         bigint DEFAULT NULL,
    `driver_id`           bigint DEFAULT NULL,
    `first_address`       varchar(255) NOT NULL,
    `destination_address` varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    KEY                   `customer_id` (`customer_id`),
    KEY                   `driver_id` (`driver_id`),
    CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
    CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE SET NULL
)