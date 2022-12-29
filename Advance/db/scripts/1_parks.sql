CREATE TABLE parks (
    id int NOT NULL AUTO_INCREMENT,
    serial_number varchar(16) NOT NULL,
    address varchar(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY serial_number (serial_number)
)