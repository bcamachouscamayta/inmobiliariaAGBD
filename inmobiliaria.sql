-- creo todas las tabñas de la consigna 1 
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