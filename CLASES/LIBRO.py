class Libro:
    def __init__(self, codigo_libro=None, titulo=None, autor=None, anio_publicacion=None):
        self.codigo_libro = codigo_libro
        self.titulo = titulo
        self.autor = autor
        self.anio_publicacion = anio_publicacion
    
    def __str__(self):
        return f'Libro(codigo_libro={self.codigo_libro}, titulo={self.titulo}, autor={self.autor}, anio_publicacion={self.anio_publicacion})'

    def obtener_informacion(self):
        return {
            "codigo_libro": self.codigo_libro,
            "titulo": self.titulo,
            "autor": self.autor,
            "anio_publicacion": self.anio_publicacion
        }

    def actualizar_informacion(self, titulo=None, autor=None, anio_publicacion=None):
        if titulo is not None:
            self.titulo = titulo
        if autor is not None:
            self.autor = autor
        if anio_publicacion is not None:
            self.anio_publicacion = anio_publicacion
