from CRUD.crud import *
from CLASES.LIBRO import Libro


class Menu:
    def __init__(self):
        while True:
            print("\n----PANELES DE CONTROL----")
            print("1- GESTION DE LIBROS")
            print("2- GESTION DE USUARIOS")
            print("3- REPORTES")
            print("4- SALIR")
            opc1 = input("Elige un panel de control: ")
            if opc1 == "1":
                while True:
                    print("\n----GESTION DE LIBROS----")
                    print("1- Listar libros")
                    print("2- Agregar libro")
                    print("3- Eliminar libro (NO ESTE EN PRÉSTAMO)")
                    print("4- Actualizar libro")
                    print("5- Salir")
                    opcion = input("\nIngresa la opción que desees ejecutar: ")
                    if opcion == "1":
                        libros = Libro.listar()
                        if libros:
                            for libro in libros:
                                print(libro)
                        else:
                            print("No hay libros registrados.")
                    elif opcion == "2":
                        titulo = input("Ingrese el título del libro: ")
                        autor = input("Ingrese el autor del libro: ")
                        anio_publicacion = input(
                            "Ingrese el año de publicación del libro: ")
                        nuevo_libro = Libro(
                            None, titulo, autor, anio_publicacion)
                        nuevo_libro.guardar()
                        print("Libro agregado con éxito.")
                    elif opcion == "3":
                        codigo_libro = input(
                            "Ingrese el código del libro a eliminar: ")
                        libro = Libro.buscar(codigo_libro)
                        if libro:
                            libro.eliminar()
                            print("Libro eliminado con éxito.")
                        else:
                            print("El libro no existe.")
                    elif opcion == "4":
                        codigo_libro = input(
                            "Ingrese el código del libro a actualizar: ")
                        libro = Libro.buscar(codigo_libro)
                        if libro:
                            titulo = input(
                                "Ingrese el nuevo título del libro: ")
                            autor = input("Ingrese el nuevo autor del libro: ")
                            anio_publicacion = input(
                                "Ingrese el nuevo año de publicación del libro: ")
                            libro.titulo = titulo
                            libro.autor = autor
                            libro.anio_publicacion = anio_publicacion
                            libro.actualizar()
                            print("Libro actualizado con éxito.")
                        else:
                            print("El libro no existe.")
                    elif opcion == "5":
                        break
                    else:
                        print("Opción inválida.")
            elif opc1 == "2":
                while True:
                    print("\n----GESTION DE USUARIOS----")
                    print("1- Realizar préstamo")
                    print("2- Renovación")
                    print("3- Multas")
                    print("4- Historial de usuario por código de libro")
                    print("5- Salir")
                    opcion = input("\nIngresa la opción que desees ejecutar: ")
                    if opcion == "1":
                        print("Funcionalidad de préstamo")
                    elif opcion == "2":
                        print("Funcionalidad de renovación")
                    elif opcion == "3":
                        print("Funcionalidad de multas")
                    elif opcion == "4":
                        print(
                            "Funcionalidad de historial de usuario por código de libro")
                    elif opcion == "5":
                        break
                    else:
                        print("Opción inválida.")
            elif opc1 == "3":
                print("\n----REPORTES----")
                print("1- Obtener listado de préstamos por día y tipo de usuario")
                print("2- Salir")
                opcion = input("\nIngresa la opción que desees ejecutar: ")
                if opcion == "1":
                    print("Funcionalidad de reportes")
                elif opcion == "2":
                    pass
                else:
                    print("Opción inválida.")
            elif opc1 == "4":
                print("¡Hasta pronto!")
                break
            else:
                print("Opción inválida.")
