# usuario con md5 para login.
from MENU.menu import Menu
from CRUD.encripteitor import decode
from CRUD.crud import *
from CLASES.acceso import Acceso


# El sistema considera sólo un tipo de usuario que lo manipulará, el cual corresponde al usuario encargado de biblioteca.
# llaves para ingresar a menu
# user: brandon
# pass: 1234

while True:
    print("\n----Login----")
    print("1- Registrar usuario")
    print("2- Login ")
    print("0- Exit ")
    op = input("Ingrese opción: ")

    if op == "1":
        a = Acceso()# Instancia la clase Acceso para usar luego metodo registroUsuarios.
        a.registroUsuarios()

    elif op == "2":
        usuario = input("Ingrese usuario: ")
        clave = input("Ingrese su contraseña: ")
        acceso = decode(clave, buscarClave(usuario, conection))
        if acceso == True:  # Si el acceso es exitoso, deja entrar al menu.
            m = Menu()
        else:
            print("Usuario y/o contraseña invalida")
    elif op == "0":
        print("¡Hasta luego, saludos!")
        break
