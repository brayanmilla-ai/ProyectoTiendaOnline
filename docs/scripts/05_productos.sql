CREATE TABLE `productos`
(
    `productocod` BIGINT
(18) NOT NULL AUTO_INCREMENT,
    `productodescripcion` VARCHAR
(70) NOT NULL,
    `productodescripcorta` VARCHAR
(255) NOT NULL,
    `productodescriplarga` TEXT NULL,
    `productosku` VARCHAR
(128) NOT NULL,
    `productocodigobarra` VARCHAR
(128) NOT NULL,
    `productostock` INT NOT NULL,
    `productotipo` CHAR
(3) NOT NULL,
    `productoprecio` DECIMAL
(12 , 2 ) NOT NULL,
    `productourl` VARCHAR
(255) NULL,
    `productourlimgpeque` VARCHAR
(255) NULL,
    `productoestado` CHAR
(3) NOT NULL,
    `ctgcod` int
(10),
    PRIMARY KEY
(`productocod`),
    UNIQUE INDEX `productosku_UNIQUE`
(`productosku` ASC),
    UNIQUE INDEX `productocodigobarra_UNIQUE`
(`productocodigobarra` ASC)
);