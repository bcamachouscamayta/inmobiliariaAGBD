--actividad extra

-- Intentamos insertar un contrato malo (Fin 2020 < Inicio 2025)
INSERT INTO Contratos (id_cliente, id_propiedad, fecha_inicio, fecha_fin, monto_mensual)
SELECT 1, 1, '2025-01-01', '2020-01-01', 50000
FROM Dual
WHERE '2020-01-01' >= '2025-01-01';

--la verificacion

-- Intentamos insertar un contrato BUENO (Inicio 2025, Fin 2026)
-- Como 2026 >= 2025, esto SÍ debería entrar.
INSERT INTO Contratos (id_cliente, id_propiedad, fecha_inicio, fecha_fin, monto_mensual)
SELECT 1, 1, '2025-01-01', '2026-01-01', 60000
FROM Dual
WHERE '2026-01-01' >= '2025-01-01';