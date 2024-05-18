from CRUD.encripteitor import encode, decode  # Corrección en la importación
from CRUD.crud import registroUsuarios
from CONEX.conex import conex

conection = conex()

class Acceso():
    # Instanciamos objeto en esta clase para luego insertar con la función registroUsuarios
    def registroUsuarios(self):
        usuario = input("Ingrese Usuario : ")
        email = input("Ingrese Correo : ")
        clave = input("Ingrese clave : ")
        # print(f"la clave encriptada es {encode(clave)}") Descomenta línea para mostrar clave encriptada.
        registroUsuarios(usuario, email, encode(clave), conection)  # se lleva la clave encriptada bajo "encode".