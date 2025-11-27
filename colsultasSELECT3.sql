-- 4. Mostrar todas las propiedades con su propietario
SELECT
    p.direccion,
    p.tipo,
    p.precio_alquiler,
    pr.nombre AS propietario_nombre,
    pr.apellido AS propietario_apellido,
    pr.telefono AS propietario_telefono
FROM Propiedades p
JOIN Propietarios pr ON p.id_propietario = pr.id_propietario;


-- 5. Listar los contratos vigentes, mostrando cliente, dirección y monto mensual.
-- (Consideramos "vigentes" aquellos cuya fecha de fin es futura a HOY)
SELECT
    c.id_contrato,
    c.fecha_inicio,
    c.fecha_fin,
    cl.nombre AS cliente_nombre,
    cl.apellido AS cliente_apellido,
    p.direccion AS propiedad_direccion,
    c.monto_mensual
FROM Contratos c
JOIN Clientes cl ON c.id_cliente = cl.id_cliente
JOIN Propiedades p ON c.id_propiedad = p.id_propiedad
WHERE c.fecha_fin > CURDATE(); --< se utiliza para mostrar la fecha actual ñññ


-- 6. Mostrar los pagos realizados junto con cliente y dirección.
SELECT
    pa.id_pago,
    pa.fecha_pago,
    pa.monto_pagado,
    pa.medio_pago,
    cl.nombre AS cliente_nombre,
    cl.apellido AS cliente_apellido,
    p.direccion AS propiedad_direccion
FROM Pagos pa
JOIN Contratos co ON pa.id_contrato = co.id_contrato
JOIN Clientes cl ON co.id_cliente = cl.id_cliente
JOIN Propiedades p ON co.id_propiedad = p.id_propiedad
ORDER BY pa.fecha_pago DESC; --< ordena de mayor a menor ñññ

-- 7. Mostrar los clientes Y los ambientes de las propiedades que alquilaron (> 3)
SELECT 
    cl.id_cliente,
    cl.nombre,
    cl.apellido,
    cl.dni,
    cl.telefono,   -- <-- Dato agregado
    cl.email,      -- <-- Dato agregado
    p.direccion,   -- <-- Agregué la dirección para identificar la casa
    p.ambientes
FROM Clientes cl
JOIN Contratos co ON cl.id_cliente = co.id_cliente
JOIN Propiedades p ON co.id_propiedad = p.id_propiedad
WHERE p.ambientes > 3;


-- 8. Listar las propiedades con alquiler superior a $200.000.
SELECT * FROM Propiedades
WHERE precio_alquiler > 200000
ORDER BY precio_alquiler DESC;

-- 9. Mostrar cuántas propiedades posee cada propietario
-- Usamos LEFT JOIN para que si hay un dueño sin propiedades, aparezca con 0.

SELECT 
    pr.nombre,
    pr.apellido,
    COUNT(p.id_propiedad) AS cantidad_propiedades
FROM Propietarios pr
LEFT JOIN Propiedades p ON pr.id_propietario = p.id_propietario
GROUP BY pr.id_propietario, pr.nombre, pr.apellido
ORDER BY cantidad_propiedades DESC;

-- 10. Aumentar el precio de alquiler de los “Departamentos” en un 10%.
-- Multiplicamos por 1.10 (que es el original + 10%)
UPDATE Propiedades
SET precio_alquiler = precio_alquiler * 1.10
WHERE tipo = 'Departamento';

-- 11. Cambiar el teléfono de un cliente específico.
-- (Le cambiamos el teléfono al cliente número 1, Lucía García)

UPDATE Clientes
SET telefono = '11-9999-8888'
WHERE id_cliente = 1;

-- 12. Eliminar un pago erróneo.
-- (Borramos el pago 16, que era el de $1000 que pusimos a propósito)
DELETE FROM Pagos
WHERE id_pago = 16;

-- 13. Eliminar los contratos que finalizaron antes de 2024.
-- ¡OJO AQUÍ! No podemos borrar contratos si tienen pagos asociados.
-- Primero borramos los PAGOS de esos contratos viejos (limpiamos a los hijos).
DELETE FROM Pagos
WHERE id_contrato IN (
    SELECT id_contrato FROM Contratos WHERE fecha_fin < '2024-01-01'
);
--utilize estos dos para hacer la activida en referido a eliminar de tal a tal tabla en un punto
DELETE FROM Pagos
WHERE id_contrato IN (
    SELECT id_contrato FROM Contratos WHERE fecha_fin < '2024-01-01'
);

DELETE FROM Contratos
WHERE fecha_fin < '2024-01-01';

--ññññ
