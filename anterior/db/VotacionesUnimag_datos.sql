
USE `VotacionesUnimag`;

INSERT INTO `Facultad`(`nombre`) VALUES
('Ingeniería'),('Ciencias de la Educación'),('Ciencias de la Salud'),
('Ciencias Empresariales y Económicas'),('Ciencias Básicas'),('Humanidades');

INSERT INTO `Programa`(`nombre`, `Facultad_idFacultad`) VALUES
('Ingeniería de Sistemas',1),('Ingeniería Electronica',1),
('Ingeniería Ambiental y Sanitaria',1),('Ingeniería Industrial',1),
('Ingeniería Civil',1),('Ingeniería Pesquera',1);

INSERT INTO `Estado`(`nombre`, `descripcion`) VALUES
('Estado 1', 'descripcion estado 1'),('Estado 2', 'descripcion estado 2');

INSERT INTO `Rol`(`nombre`, `descripcion`) VALUES
('Administrador','Quien administra la pagina'),('Votante','Este ademas de votar puede ser Jurado o Delegado');
