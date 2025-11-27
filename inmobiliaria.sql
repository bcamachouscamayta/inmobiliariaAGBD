--creacion de la base de datos y sus datos en si 

-- creo todas las tablas de la consigna 1 
-- ya que la base principal esta y es inmobiliara


-- 2. Crear la tabla `Propietarios`
CREATE TABLE Propietarios (
    id_propietario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(10) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE
) ;

-- 2. Crear la tabla `Clientes` (Inquilinos)
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(10) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE
) ;

-- 2. Crear la tabla `Propiedades`
CREATE TABLE Propiedades (
    id_propiedad INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(255) NOT NULL,
    tipo ENUM('Casa', 'Departamento', 'PH', 'Local', 'Oficina') NOT NULL,
    ambientes INT,
    precio_alquiler DECIMAL(10, 2) NOT NULL,
    id_propietario INT,
    FOREIGN KEY (id_propietario) REFERENCES Propietarios(id_propietario)
) ;

-- 2. Crear la tabla `Contratos`
CREATE TABLE Contratos (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_propiedad INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    monto_mensual DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_propiedad) REFERENCES Propiedades(id_propiedad)
) ;

-- 2. Crear la tabla `Pagos`
CREATE TABLE Pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_contrato INT,
    fecha_pago DATE NOT NULL,
    monto_pagado DECIMAL(10, 2) NOT NULL,
    medio_pago ENUM('Efectivo', 'Transferencia', 'Tarjeta') NOT NULL,
    FOREIGN KEY (id_contrato) REFERENCES Contratos(id_contrato)
) ;

-- 3. Insertar Propietarios (10)
INSERT INTO Propietarios (nombre, apellido, dni, telefono, email) VALUES
('Carlos', 'Gómez', '12345678', '11-1234-5678', 'carlos.gomez@email.com'),
('María', 'Fernández', '23456789', '11-2345-6789', 'maria.fernandez@email.com'),
('Juan', 'Rodríguez', '34567890', '11-3456-7890', 'juan.rodriguez@email.com'),
('Ana', 'López', '45678901', '11-4567-8901', 'ana.lopez@email.com'),
('Luis', 'Martínez', '56789012', '11-5678-9012', 'luis.martinez@email.com'),
('Elena', 'Sánchez', '67890123', '11-6789-0123', 'elena.sanchez@email.com'),
('Miguel', 'Pérez', '78901234', '11-7890-1234', 'miguel.perez@email.com'),
('Sofía', 'Díaz', '89012345', '11-8901-2345', 'sofia.diaz@email.com'),
('Diego', 'Romero', '90123456', '11-9012-3456', 'diego.romero@email.com'),
('Laura', 'Torres', '01234567', '11-0123-4567', 'laura.torres@email.com');

-- 3. Insertar Clientes (20)
INSERT INTO Clientes (nombre, apellido, dni, telefono, email) VALUES
('Lucía', 'García', '11111111', '11-1111-1111', 'lucia.garcia@email.com'),
('Marcos', 'Acuña', '22222222', '11-2222-2222', 'marcos.acuna@email.com'),
('Julieta', 'Vázquez', '33333333', '11-3333-3333', 'julieta.vazquez@email.com'),
('Nicolás', 'Castro', '44444444', '11-4444-4444', 'nicolas.castro@email.com'),
('Valentina', 'Ruiz', '55555555', '11-5555-5555', 'valentina.ruiz@email.com'),
('Facundo', 'Ortiz', '66666666', '11-6666-6666', 'facundo.ortiz@email.com'),
('Camila', 'Giménez', '77777777', '11-7777-7777', 'camila.gimenez@email.com'),
('Matías', 'Suárez', '88888888', '11-8888-8888', 'matias.suarez@email.com'),
('Agustina', 'Luna', '99999999', '11-9999-9999', 'agustina.luna@email.com'),
('Tomás', 'Navarro', '10101010', '11-1010-1010', 'tomas.navarro@email.com'),
('Clara', 'Sosa', '12121212', '11-1212-1212', 'clara.sosa@email.com'),
('Pedro', 'Álvarez', '13131313', '11-1313-1313', 'pedro.alvarez@email.com'),
('Martina', 'Gutiérrez', '14141414', '11-1414-1414', 'martina.gutierrez@email.com'),
('Santiago', 'Moreno', '15151515', '11-1515-1515', 'santiago.moreno@email.com'),
('Florencia', 'Silva', '16161616', '11-1616-1616', 'florencia.silva@email.com'),
('Bruno', 'Vega', '17171717', '11-1717-1717', 'bruno.vega@email.com'),
('Renata', 'Ramos', '18181818', '11-1818-1818', 'renata.ramos@email.com'),
('Joaquín', 'Molina', '19191919', '11-1919-1919', 'joaquin.molina@email.com'),
('Emilia', 'Castro', '20202020', '11-2020-2020', 'emilia.castro@email.com'),
('Lucas', 'Peralta', '21212121', '11-2121-2121', 'lucas.peralta@email.com');

-- 3. Insertar Propiedades (10)
INSERT INTO Propiedades (direccion, tipo, ambientes, precio_alquiler, id_propietario) VALUES
('Av. Corrientes 1234, CABA', 'Departamento', 2, 180000.00, 1),
('Calle Falsa 123, Morón', 'Casa', 4, 350000.00, 2),
('Av. Santa Fe 3000, CABA', 'Departamento', 3, 250000.00, 1),
('Gran Vía 50, Ramos Mejía', 'Local', 1, 400000.00, 3),
('Calle 8 Nro 567, La Plata', 'PH', 3, 210000.00, 4),
('Av. Rivadavia 8000, CABA', 'Departamento', 1, 150000.00, 5),
('Olazábal 1500, Belgrano', 'Casa', 5, 500000.00, 6),
('Defensa 900, San Telmo', 'PH', 2, 190000.00, 7),
('Av. del Libertador 5500, CABA', 'Oficina', 1, 280000.00, 8),
('Echeverría 2300, CABA', 'Departamento', 3, 270000.00, 9);

-- 3. Insertar Contratos (14)
INSERT INTO Contratos (id_cliente, id_propiedad, fecha_inicio, fecha_fin, monto_mensual) VALUES
(1, 1, '2023-01-01', '2024-12-31', 180000.00), 
(2, 2, '2023-03-01', '2025-02-28', 350000.00), 
(3, 3, '2022-06-01', '2023-05-31', 220000.00), 
(4, 4, '2023-05-01', '2026-04-30', 400000.00), 
(5, 5, '2023-07-01', '2025-06-30', 210000.00), 
(6, 6, '2023-02-01', '2025-01-31', 150000.00), 
(7, 7, '2023-08-01', '2026-07-31', 500000.00), 
(8, 8, '2021-11-01', '2023-10-31', 170000.00), 
(9, 9, '2023-10-01', '2025-09-30', 280000.00), 
(10, 10, '2023-09-01', '2025-08-31', 270000.00),
(11, 3, '2023-07-01', '2025-06-30', 250000.00),
(12, 8, '2023-12-01', '2025-11-30', 190000.00),
(13, 1, '2020-01-01', '2022-12-31', 120000.00), 
(14, 2, '2021-02-01', '2023-01-31', 300000.00); 

-- 3. Insertar Pagos (16)
INSERT INTO Pagos (id_contrato, fecha_pago, monto_pagado, medio_pago) VALUES
(1, '2023-02-01', 180000.00, 'Transferencia'),
(1, '2023-03-01', 180000.00, 'Transferencia'),
(2, '2023-04-01', 350000.00, 'Efectivo'),
(2, '2023-05-01', 350000.00, 'Transferencia'),
(3, '2023-05-01', 220000.00, 'Efectivo'),
(4, '2023-06-01', 400000.00, 'Transferencia'),
(5, '2023-08-01', 210000.00, 'Tarjeta'),
(6, '2023-03-01', 150000.00, 'Transferencia'),
(7, '2023-09-01', 500000.00, 'Transferencia'),
(8, '2023-10-01', 170000.00, 'Efectivo'),
(9, '2023-11-01', 280000.00, 'Transferencia'),
(10, '2023-10-01', 270000.00, 'Tarjeta'),
(11, '2023-08-01', 250000.00, 'Transferencia'),
(12, '2024-01-02', 190000.00, 'Efectivo'),
(14, '2023-01-05', 300000.00, 'Transferencia'),
(1, '2023-04-01', 1000.00, 'Efectivo');

--corte