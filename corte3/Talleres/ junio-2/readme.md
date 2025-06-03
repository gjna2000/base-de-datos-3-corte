¿Qué son los Disparadores y para qué sirven?
Los disparadores son objetos especiales de la base de datos que se ejecutan automáticamente cuando ocurre un evento específico en una tabla o vista, como una inserción (INSERT), actualización (UPDATE) o eliminación (DELETE). Su principal función es automatizar tareas, mantener la integridad de los datos y aplicar reglas de negocio sin necesidad de intervención del usuario.

Ventajas:

Se ejecutan automáticamente, sin necesidad de programarlos desde la aplicación.

Permiten aplicar reglas de validación y seguridad directamente en la base de datos.

Son útiles para auditorías, ya que pueden registrar los cambios hechos a los datos.

Ayudan a mantener la integridad de la información de manera consistente.

Desventajas:

Pueden dificultar la depuración y seguimiento de errores.

Si no se usan correctamente, pueden afectar el rendimiento de la base de datos.

Su lógica puede ser difícil de entender si no se documenta bien.

Pueden crear dependencias ocultas entre las tablas.

Sintaxis y uso de los Disparadores (ejemplo en MySQL):

sql
Copiar
Editar
CREATE TRIGGER nombre_del_trigger
AFTER INSERT ON nombre_de_la_tabla
FOR EACH ROW
BEGIN
    -- Instrucciones que se ejecutan automáticamente
    INSERT INTO auditoria (usuario, accion, fecha)
    VALUES (USER(), 'Inserción', NOW());
END;


