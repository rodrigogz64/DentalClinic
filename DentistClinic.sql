-- tipo ENUM para representar el TipoUsuario
CREATE TYPE TipoUsuario AS ENUM ('Admin', 'Doctor', 'Secretaria', 'Paciente');

-- tipo ENUM para representar el estado dental
CREATE TYPE EstadoDental AS ENUM ('Ausente', 'Caries', 'Puente', 'Endodoncia', 'Saludable');

-- Tabla Usuarios
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    TipoUsuario TipoUsuario, -- Usar el tipo ENUM definido
    CorreoElectronico VARCHAR(255),
    Contraseña VARCHAR(255)
);

-- Tabla Doctores
CREATE TABLE Doctores (
    ID INT PRIMARY KEY,
    UsuarioID INT,
    Especializacion VARCHAR(255),
    HorarioTrabajo VARCHAR(255),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla Pacientes
CREATE TABLE Pacientes (
    ID INT PRIMARY KEY,
    UsuarioID INT,
    Contacto VARCHAR(255),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabla AgendaDoctores
CREATE TABLE AgendaDoctores (
    ID INT PRIMARY KEY,
    DoctorID INT,
    FechaCita DATE,
    HoraInicio TIME,
    HoraFin TIME,
    FOREIGN KEY (DoctorID) REFERENCES Doctores(ID)
);

-- Tabla HistorialesClinicos
CREATE TABLE Historiales_Clinicos (
    Id serial PRIMARY KEY,
    Id_Paciente integer REFERENCES Pacientes(Id),
    Id_Doctor integer REFERENCES Doctores(Id),
    Duracion_Tratamiento varchar(255) NOT NULL,
    Tratamiento_Previo varchar(255),
    Lineas_Medias varchar(255),
    Diastemas varchar(255),
    Tipo_Mordida varchar(255) CHECK (Tipo_Mordida IN ('Tipo1', 'Tipo2', 'Tipo3', 'Tipo4')),
    Tipo_Apiñamiento varchar(255),
    Habitos varchar(255),
    Perfil varchar(255),
    Motivo_Consulta varchar(255) NOT NULL,
    Hospitalizaciones varchar(255),
    Tratamiento_Medico_Actual varchar(255),
    Problemas_Coagulacion varchar(255),
    Problemas_Respiratorios varchar(255),
    Traumatismos varchar(255),
    Alergias varchar(255),
    Enfermedades_Sistemicas varchar(255),
    Antecedentes_Odontologicos varchar(255),
    Fuma boolean,
    Bebidas_Alcoholicas boolean,
    Diagnostico varchar(255) NOT NULL,
    Extracciones varchar(255),
    Cordales varchar(255) NOT NULL,
    Prostodoncia varchar(255),
    Rx_Panoramica varchar(255),
    Rx_Cefalometrica varchar(255),
    Rx_Periapical varchar(255),
    Tipo_Limpieza_Dental varchar(255) NOT NULL
); 

-- Tabla Odontogramas
CREATE TABLE Odontogramas (
    ID INT PRIMARY KEY,
    HistorialClinicoID INT,
    NumeroDiente INT,
    Estado EstadoDental, -- Usar el tipo ENUM definido
    FOREIGN KEY (HistorialClinicoID) REFERENCES Historiales_Clinicos(Id)
);

-- Tabla RegistroCitas
CREATE TABLE RegistroCitas (
    ID INT PRIMARY KEY,
    HistorialClinicoID INT,
    FechaCita DATE,
    Procedimientos TEXT,
    FOREIGN KEY (HistorialClinicoID) REFERENCES Historiales_Clinicos(ID)
);