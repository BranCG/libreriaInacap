class Estado:
    def __init__(self, idEstado=None, estado=None):
        self.idEstado = idEstado
        self.estado = estado

    def __str__(self):
        return f'Estado(idEstado={self.idEstado}, estado={self.estado})'

    def obtener_informacion(self):
        return {
            "idEstado": self.idEstado,
            "estado": self.estado
        }

