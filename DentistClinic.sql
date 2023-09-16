-- Tabla de Usuarios
CREATE TABLE Usuarios (
    ID serial PRIMARY KEY,
    NombreUsuario VARCHAR(255) NOT NULL,
    Contrasena VARCHAR(255) NOT NULL,
    Rol VARCHAR(50) NOT NULL
);

-- Tabla de Doctores
CREATE TABLE Doctores (
    ID serial PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(255)
);

-- Tabla de Pacientes
CREATE TABLE Pacientes (
    ID serial PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    FechaNacimiento DATE,
    Genero VARCHAR(20),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(255)
);

-- Tabla de Citas
CREATE TABLE Citas (
    ID serial PRIMARY KEY,
    IDPaciente INT REFERENCES Pacientes(ID),
    IDDoctor INT REFERENCES Doctores(ID),
    FechaHora TIMESTAMP,
    Estado VARCHAR(50)
);

-- Tabla de Historiales Clinicos
CREATE TABLE HistorialesClinicos (
    ID serial PRIMARY KEY,
    IDPaciente INT REFERENCES Pacientes(ID),
    IDDoctor INT REFERENCES Doctores(ID),
    Duracion_Tratamiento VARCHAR(255) NOT NULL,
    Tratamiento_Previo VARCHAR(255),
    Lineas_Medias VARCHAR(255),
    Diastemas VARCHAR(255),
    Tipo_Mordida VARCHAR(255) CHECK (Tipo_Mordida IN ('Tipo1', 'Tipo2', 'Tipo3', 'Tipo4')),
    Tipo_Apiñamiento VARCHAR(255),
    Habitos VARCHAR(255),
    Perfil VARCHAR(255),
    Motivo_Consulta VARCHAR(255) NOT NULL,
    Hospitalizaciones VARCHAR(255),
    Tratamiento_Medico_Actual VARCHAR(255),
    Problemas_Coagulacion VARCHAR(255),
    Problemas_Respiratorios VARCHAR(255),
    Traumatismos VARCHAR(255),
    Alergias VARCHAR(255),
    Enfermedades_Sistemicas VARCHAR(255),
    Antecedentes_Odontologicos VARCHAR(255),
    Fuma BOOLEAN,
    Bebidas_Alcoholicas BOOLEAN,
    Diagnostico VARCHAR(255) NOT NULL,
    Extracciones VARCHAR(255),
    Cordales VARCHAR(255) NOT NULL,
    Prostodoncia VARCHAR(255),
    Rx_Panoramica VARCHAR(255),
    Rx_Cefalometrica VARCHAR(255),
    Rx_Periapical VARCHAR(255),
    Tipo_Limpieza_Dental VARCHAR(255) NOT NULL,
    Descripcion TEXT
);

-- Tabla de Dientes
CREATE TABLE Dientes (
    ID serial PRIMARY KEY,
    IDPaciente INT REFERENCES Pacientes(ID),
    NumeroDiente INT,
    EstadoDiente VARCHAR(50)
);

-- Tabla de Horarios de Disponibilidad de los Doctores
CREATE TABLE HorariosDisponibilidad (
    ID serial PRIMARY KEY,
    IDDoctor INT REFERENCES Doctores(ID),
    DiaSemana VARCHAR(15),
    HoraInicio TIME,
    HoraFin TIME
);