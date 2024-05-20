# main.py
from MENU.menu import Menu
from CRUD.encripteitor import encode,decode
from CRUD.crud import buscarClave, registroUsuarios
from CONEX.conex import conex

# Establece la conexión
conection = conex()

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
        usuario = input("Ingrese Usuario : ")
        email = input("Ingrese Correo : ")
        clave = input("Ingrese clave : ")
        # Se llama directamente a la función de registro de usuarios
        registroUsuarios(usuario, email, encode(clave), conection)

    elif op == "2":
        usuario = input("Ingrese usuario: ")
        clave = input("Ingrese su contraseña: ")
        try:
            clave_bd = buscarClave(usuario, conection)
            acceso = decode(clave, clave_bd)
            if acceso:
                m = Menu()
            else:
                print("Usuario y/o contraseña invalida")
        except Exception as e:
            print(f"Error al buscar la clave: {e}")
    elif op == "0":
        print("¡Hasta luego, saludos!")
        break
