from CONEX.conex import conex


class Usuario:
    def __init__(self, codigo_usuario, nombre, tipo_usuario):
        self.codigo_usuario = codigo_usuario
        self.nombre = nombre
        self.tipo_usuario = tipo_usuario

    def __str__(self):
        return f'Usuario(codigo_usuario={self.codigo_usuario}, nombre={self.nombre}, tipo_usuario={self.tipo_usuario})'

    @staticmethod
    def obtener_usuario(codigo_usuario):
        conn = conex()
        cursor = conn.cursor()
        cursor.execute(
            'SELECT * FROM usuarios WHERE idTipoUsuario = %s', (codigo_usuario,))
        row = cursor.fetchone()
        conn.close()
        if row:
            return Usuario(codigo_usuario=row[0], nombre=row[1], tipo_usuario=row[2])
        return None

    @staticmethod
    def tiene_retrasos(codigo_usuario):
        conn = conex()
        cursor = conn.cursor()
        cursor.execute(
            'SELECT COUNT(*) FROM prestamos WHERE IdTipoUsuario = %s AND fechaDevolucion < CURDATE()', (codigo_usuario,))
        row = cursor.fetchone()
        conn.close()
        return row[0] > 0
