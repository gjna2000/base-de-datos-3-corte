--CURSORES EN PL/pgSQL
--Definición: Son punteros que permiten recorrer registros de una consulta uno por uno.
--Son útiles para manejar resultados secuenciales y realizar operaciones personalizadas.
--Pueden definirse con o sin parámetros y se combinan con comandos como FETCH y LOOP.

--Estructura básica de uso:
BEGIN
	DECLARE
		-- Declaración del cursor y variables
	OPEN
		-- Apertura del cursor
	FETCH
		-- Recuperar registros uno por uno
	CLOSE
		-- Cierre del cursor
	COMMIT / ROLLBACK
END

-- Cursor simple con FETCH único
DO
$$
DECLARE
	dato_usuario users%ROWTYPE;
	cursor_usuarios CURSOR FOR SELECT * FROM users WHERE country = 'colombia';
BEGIN
	OPEN cursor_usuarios;
		FETCH cursor_usuarios INTO dato_usuario;
		RAISE NOTICE 'País del usuario: %', dato_usuario.country;
	CLOSE cursor_usuarios;
END
$$ LANGUAGE plpgsql;

-- Cursor con ciclo WHILE y verificación de FOUND
DO
$$
DECLARE
	dato_usuario users%ROWTYPE;
	cursor_usuarios CURSOR FOR SELECT * FROM users WHERE country = 'colombia';
BEGIN
	OPEN cursor_usuarios;
		FETCH cursor_usuarios INTO dato_usuario;
		WHILE FOUND LOOP
			RAISE NOTICE 'País del usuario: %', dato_usuario.country;
			FETCH cursor_usuarios INTO dato_usuario;
		END LOOP;
	CLOSE cursor_usuarios;
END
$$ LANGUAGE plpgsql;

-- Cursor explícito con FOR...LOOP (requiere declaración de variable ROWTYPE)
DO
$$
DECLARE
	dato_usuario users%ROWTYPE;
	cursor_usuarios CURSOR FOR SELECT * FROM users WHERE country = 'colombia';
BEGIN
	RAISE NOTICE 'Inicio del recorrido';
	FOR dato_usuario IN cursor_usuarios LOOP
		RAISE NOTICE 'Registro: %', dato_usuario;
	END LOOP;
	RAISE NOTICE 'Fin del recorrido';
END
$$ LANGUAGE plpgsql;

-- Cursor implícito (no se define cursor ni variable explícitamente)
DO
$$
DECLARE
	registro users%ROWTYPE;
BEGIN
	RAISE NOTICE 'Iniciando recorrido implícito';
	FOR registro IN SELECT * FROM users WHERE country = 'colombia' LOOP
		RAISE NOTICE 'Usuario desde: %', registro.country;
	END LOOP;
	RAISE NOTICE 'Recorrido completado';
END
$$ LANGUAGE plpgsql;

