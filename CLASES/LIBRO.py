class Libro:
    def __init__(self, codigo_libro=None, titulo=None, autor=None, anio_publicacion=None):
        self.codigo_libro = codigo_libro
        self.titulo = titulo
        self.autor = autor
        self.anio_publicacion = anio_publicacion

    def __str__(self):
        return f'Libro(codigo_libro={self.codigo_libro}, titulo={self.titulo}, autor={self.autor}, anio_publicacion={self.anio_publicacion})'

    def guardar(self):
        from CRUD.crud import insertar_libro

        libro = (self.titulo, self.autor,
                 self.anio_publicacion)  # Corrección aquí
        insertar_libro(libro)

    def actualizar(self):
        from CRUD.crud import editar_libro

        editar_libro(self)

    def eliminar(self):
        from CRUD.crud import eliminar_libro

        eliminar_libro(self.codigo_libro)

    @staticmethod
    def buscar(codigo_libro):
        from CRUD.crud import obtener_libro

        return obtener_libro(codigo_libro)

    @staticmethod
    def listar():
        from CRUD.crud import listar_libros

        return listar_libros()
