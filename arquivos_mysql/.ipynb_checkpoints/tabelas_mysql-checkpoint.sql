CREATE TABLE IF NOT EXISTS `Curso` (
    `id` bigint(20) AUTO_INCREMENT PRIMARY KEY,
    `curso_id` bigint(20),
    `curso_busca` varchar(100),
    `grau` ENUM ('Bacharelado', 'Licenciatura', 'Tecnológico'),
    `turno` ENUM ('Curso a Distância', 'Integral', 'Matutino', 'Noturno', 'Vespertino'),
    `mensalidade` double,
    `cidade_id` varchar(100),
    `universidade_id` bigint(20),
    `notas_id` bigint(20),
    `bolsas_id` bigint(20)
);
CREATE TABLE IF NOT EXISTS `Cidade` (
    `id` bigint(20) AUTO_INCREMENT PRIMARY KEY,
    `cidade_busca` varchar(100),
    `uf_busca` varchar(2),
    `cidade_filtro` varchar(20)
);
CREATE TABLE IF NOT EXISTS `Universidade` (
    `id` bigint(20) AUTO_INCREMENT PRIMARY KEY,
    `campus_external_id` bigint(20), 
    `universidade_nome` varchar(150),
    `campus_nome` varchar(300),
    `nome` varchar(100)
);
CREATE TABLE IF NOT EXISTS `Notas` (
    `id` bigint(20) AUTO_INCREMENT PRIMARY KEY,
    `nota_integral_ampla` double,
    `nota_integral_cotas` double,
    `nota_parcial_ampla` double,
    `nota_parcial_cotas` double
);
CREATE TABLE IF NOT EXISTS `Bolsas` (
    `id` bigint(20) AUTO_INCREMENT PRIMARY KEY,
    `bolsa_integral_cotas` int,
    `bolsa_integral_ampla` int,
    `bolsa_parcial_cotas` int,
    `bolsa_parcial_ampla` int
);
CREATE INDEX `index_campus_id` on Universidade( `campus_external_id` );
CREATE INDEX `index_cidade_busca` on Cidade( `cidade_busca` );
ALTER TABLE `Curso` ADD CONSTRAINT `fk_cidade` FOREIGN KEY ( `cidade_id` ) REFERENCES `Cidade` ( `cidade_busca` ) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Curso` ADD CONSTRAINT `fk_universidade` FOREIGN KEY ( `universidade_id` ) REFERENCES `Universidade` ( `campus_external_id` ) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Curso` ADD CONSTRAINT `fk_notas` FOREIGN KEY ( `notas_id` ) REFERENCES `Notas` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Curso` ADD CONSTRAINT `fk_bolsas` FOREIGN KEY ( `bolsas_id` ) REFERENCES `Bolsas` ( `id` ) ON DELETE CASCADE ON UPDATE CASCADE;