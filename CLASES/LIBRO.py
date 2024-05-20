from CONEX.conex import conex


def insertar_libro(libro):
    conn = conex()
    cursor = conn.cursor()
    cursor.execute('''
    INSERT INTO libros (titulo, autor, anioPublicacion) VALUES (%s, %s, %s)
    ''', (libro.titulo, libro.autor, libro.anio_publicacion))
    conn.commit()
    libro.codigo_libro = cursor.lastrowid
    conn.close()


def obtener_libro(codigo_libro):
    conn = conex()
    cursor = conn.cursor()
    cursor.execute(
        'SELECT * FROM libros WHERE codigoLibro = %s', (codigo_libro,))
    row = cursor.fetchone()
    conn.close()
    if row:
        return Libro(codigo_libro=row[0], titulo=row[1], autor=row[2], anio_publicacion=row[3])
    return None


def editar_libro(libro):
    conn = conex()
    cursor = conn.cursor()
    cursor.execute('''
    UPDATE libros SET titulo = %s, autor = %s, anioPublicacion = %s WHERE codigoLibro = %s
    ''', (libro.titulo, libro.autor, libro.anio_publicacion, libro.codigo_libro))
    conn.commit()
    conn.close()


def eliminar_libro(codigo_libro):
    conn = conex()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM libros WHERE codigoLibro = %s',
                   (codigo_libro,))
    conn.commit()
    conn.close()


def listar_libros():
    conn = conex()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM libros')
    rows = cursor.fetchall()
    conn.close()
    libros = []
    for row in rows:
        libros.append(
            Libro(codigo_libro=row[0], titulo=row[1], autor=row[2], anio_publicacion=row[3]))
    return libros


class Libro:
    def __init__(self, codigo_libro=None, titulo="", autor="", anio_publicacion=0):
        self.codigo_libro = codigo_libro
        self.titulo = titulo
        self.autor = autor
        self.anio_publicacion = anio_publicacion

    def __str__(self):
        return f'Libro(codigo_libro={self.codigo_libro}, titulo={self.titulo}, autor={self.autor}, anio_publicacion={self.anio_publicacion})'

    def guardar(self):
        insertar_libro(self)

    def actualizar(self):
        editar_libro(self)

    def eliminar(self):
        eliminar_libro(self.codigo_libro)

    @staticmethod
    def buscar(codigo_libro):
        return obtener_libro(codigo_libro)

    @staticmethod
    def listar():
        return listar_libros()
