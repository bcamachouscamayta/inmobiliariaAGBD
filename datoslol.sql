--datos y verificaciones

SET FOREIGN_KEY_CHECKS=0; -- Desactiva la revisión de "enganches"

TRUNCATE TABLE Pagos;
TRUNCATE TABLE Contratos;
TRUNCATE TABLE Propiedades;
TRUNCATE TABLE Clientes;
TRUNCATE TABLE Propietarios;

SET FOREIGN_KEY_CHECKS=1; -- Reactiva la revisión de "enganches"

--este codigo se uso primero para corregir unas cosas pero tambien fue erroneo ya que 
--directamente no borro como deberia 

-- 1. Desactivamos la protección de claves
SET FOREIGN_KEY_CHECKS=0;

-- 2. Vaciamos las tablas (DELETE es más seguro que TRUNCATE aquí)
DELETE FROM Pagos;
DELETE FROM Contratos;
DELETE FROM Propiedades;
DELETE FROM Clientes;
DELETE FROM Propietarios;

-- 3. (OPCIONAL PERO RECOMENDADO) Reiniciamos los contadores de ID
-- para que los nuevos datos empiecen en 1
ALTER TABLE Pagos AUTO_INCREMENT = 1;
ALTER TABLE Contratos AUTO_INCREMENT = 1;
ALTER TABLE Propiedades AUTO_INCREMENT = 1;
ALTER TABLE Clientes AUTO_INCREMENT = 1;
ALTER TABLE Propietarios AUTO_INCREMENT = 1;

-- 4. Reactivamos la protección
SET FOREIGN_KEY_CHECKS=1;

--luego de ese truncate se uso este para vaciar las tabls por un error de ""insercion""

---pedi otras formas de ver la misma consulats d ela act:9 
SELECT 
    nombre,
    apellido,
    (SELECT COUNT(*) FROM Propiedades WHERE id_propietario = Propietarios.id_propietario) AS cantidad
FROM Propietarios;
--esta npo usa el goup by que pide la consigna 
SELECT 
    pr.nombre,
    pr.apellido,
    -- Si hay propiedad (id no es nulo), suma 1. Si no, suma 0.
    SUM(CASE WHEN p.id_propiedad IS NOT NULL THEN 1 ELSE 0 END) AS cantidad_propiedades
FROM Propietarios pr
LEFT JOIN Propiedades p ON pr.id_propietario = p.id_propietario
GROUP BY pr.id_propietario, pr.nombre, pr.apellido;
---etsa utiliza el sum para sumar entre tablas

--pedi una verificaacion para ver y compaprar los precios
SELECT direccion, precio_alquiler 
FROM Propiedades 
WHERE tipo = 'Departamento';

--pedi la verificacion para el telefpono del cliente
SELECT id_cliente, nombre, apellido, telefono 
FROM Clientes 
WHERE id_cliente = 1;

--la verificaion del pago vacio
-- Buscamos el pago 16 para ver si todavía existe
SELECT * FROM Pagos 
WHERE id_pago = 16;

--la verificacion para la ultima actividad 14
SELECT * FROM Contratos 
WHERE fecha_fin < '2024-01-01';

--corte