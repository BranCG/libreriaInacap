class Libro:
    def __init__(self, codigo_libro=None, titulo=None, autor=None, anio_publicacion=None):
        self.codigo_libro = codigo_libro
        self.titulo = titulo
        self.autor = autor
        self.anio_publicacion = anio_publicacion

    def __str__(self):
        return f'Libro(codigo_libro={self.codigo_libro}, titulo={self.titulo}, autor={self.autor}, anio_publicacion={self.anio_publicacion})'

    def guardar(self):
        """
        Método para guardar un nuevo libro en la base de datos.
        """
        from CRUD.crud import insertar_libro
        
        libro = (self.titulo, self.autor, self.anio_publicacion)
        insertar_libro(libro)
        
    def actualizar(self):
        """
        Método para actualizar los datos de un libro en la base de datos.
        """
        from CRUD.crud import editar_libro
        
        libro = (self.codigo_libro, self.titulo, self.autor, self.anio_publicacion)
        editar_libro(libro)
        
    def eliminar(self):
        """
        Método para eliminar un libro de la base de datos.
        """
        from CRUD.crud import eliminar_libro
        
        eliminar_libro(self.codigo_libro)
        
    @staticmethod
    def buscar(codigo_libro):
        """
        Método estático para buscar un libro en la base de datos por su código.
        """
        from CRUD.crud import obtener_libro
        
        return obtener_libro(codigo_libro)
    
    @staticmethod
    def listar():
        """
        Método estático para listar todos los libros de la base de datos.
        """
        from CRUD.crud import listar_libros
        
        return listar_libros()