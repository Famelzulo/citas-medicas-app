   USE citasmedicas;

   DROP TABLE IF EXISTS Horario;
   DROP TABLE IF EXISTS CitaMedica;
   DROP TABLE IF EXISTS Medico;
   DROP TABLE IF EXISTS Paciente;

   CREATE TABLE Paciente(
       cedula VARCHAR(10) PRIMARY KEY,
       apellido VARCHAR(20),
       nombre VARCHAR(20),
       fechaNacimiento DATE,
       telefono VARCHAR(10)
   );

   CREATE TABLE Medico(
       id INT AUTO_INCREMENT PRIMARY KEY,
       apellido VARCHAR(20),
       nombre VARCHAR(20),
       especialidad VARCHAR(40),
       consultorio INT,
       telefono VARCHAR(10)
   );

   CREATE TABLE CitaMedica(
       id INT AUTO_INCREMENT PRIMARY KEY,
       idPaciente VARCHAR(10),
       idMedico INT,
       fechaCita DATE,
       hora TIME,
       CONSTRAINT fk_NumCedulaP
           FOREIGN KEY (idPaciente) REFERENCES Paciente(cedula)
           ON DELETE RESTRICT ON UPDATE CASCADE,
       CONSTRAINT FK_IDMedico
           FOREIGN KEY (idMedico) REFERENCES Medico(id)
           ON DELETE RESTRICT ON UPDATE CASCADE
   );

   CREATE TABLE Horario(
       id INT AUTO_INCREMENT PRIMARY KEY,
       idMedico INT,
       dia INT,
       hora TIME,
       CONSTRAINT fk_IDMedico2
           FOREIGN KEY (idMedico) REFERENCES Medico(id)
           ON DELETE CASCADE
   );
   
   
   INSERT INTO Medico (apellido, nombre, especialidad, consultorio, telefono)
VALUES ('Rodríguez', 'Carlos', 'Dermatología', 103, '0977777777'),
('Martínez', 'Elena', 'Ginecología', 104, '0966666666'),
('González', 'Roberto', 'Traumatología', 105, '0955555555'),
('López', 'Sofía', 'Oftalmología', 106, '0944444444'),
('Hernández', 'Miguel', 'Neurología', 107, '0933333333'),
('Díaz', 'Carmen', 'Psiquiatría', 108, '0922222222'),
('Torres', 'Javier', 'Oncología', 109, '0911111111');


INSERT INTO Paciente (cedula, apellido, nombre, fechaNacimiento, telefono)
VALUES ('0102030405', 'Lopez', 'María', '1995-03-10', '0987654321'),
       ('1102030405', 'Ramos', 'José',  '1990-07-21', '0976543210'),
       ('1202030405', 'Rodríguez', 'Mario',  '1990-07-21', '0976543210'),
       ('2102030405', 'Quispe', 'Julio',  '1980-07-21', '0976543210'),
       ('1402030405', 'López', 'Angel',  '1997-07-21', '0976543210'),
       ('5102030405', 'Pérez', 'Guadalupe',  '1989-07-21', '0976543210'),
       ('6102030405', 'Andtade', 'Martina',  '1991-07-21', '0976543210');
       
          
            INSERT INTO Horario (idMedico, dia, hora)
  VALUES (1,1,'09:00:00'), (1,1,'09:30:00');
