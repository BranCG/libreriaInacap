from CRUD.crud import *
from CRUD.encripteitor import encode, decode
from CONEX.conex import conex
from CRUD.curdLibro import *
conection = conex()



class Menu:
    def __init__(self):
        while True:
            print("\n----PENELES DE CONTROL----")
            print("1- GESTION DE LIBRO")
            print("2- GESTION DE USUARIOS")
            print("3- SALIR")
            opc1 = input("Elige un panel de control: ")
            if opc1 == "1":
                while True:
                    '''19.	El encargado de biblioteca podrá modificar los stocks de los libros 
                        y editar el catálogo de libros.
                        a.	No podrá eliminar ejemplares que se encuentren en préstamo, 
                        pero si podrá dar de baja libros por mal estado.
                            i.	La historia de estos libros no deberá perderse, solo se desactivará el ejemplar.
                            ii.	No se deberá eliminar el título, salvo que sea el único ejemplar.
                        20.	Tendrá un reporte, en donde podrá obtener el listado de préstamos realizados 
                        por día específico y por tipo de usuario (alumnos y docentes).'''

                    print("1- Listar libros")
                    print("2- Agregar libro")
                    print("3- Eliminar libro(NO ESTE EN PRESTAMO)")
                    print("4- Actualizar libro")
                    print("5- Buscar libro")
                    print("0- Salir")
                    opcion = input("\nIngresa la opcion que desees ejecutar: ")
                    print("")
                    if opcion == "1":
                        print("funcion 1")
                        print(listar_libros())
                        break
                    elif opcion == "2":
                        print("funcion 2") 
                        break
                    elif opcion == "3":
                        print("funcion 3")  
                        break
                    elif opcion == "4":
                        print("funcion 4") 
                        break
                    elif opcion == "5":
                        print("funcion 5")  
                        break
                    else:
                        print("saliste")
                        break
            elif opc1 == "2":
                while True:
                    print("1- REALIZAR PRESTAMO")
                    print("2- RENOVACION")
                    print("3- MULTAS")
                    print("4- HISTORIAL DE USUARIO POR RUT")
                    print("0- Salir")

                    opcion = input("\nIngresa la opcion que desees ejecutar: ")
                    print("")
                    if opcion == "1":
                        print('''1.	Se deberá poder registrar la fecha de préstamo de un ejemplar de un libro, identificando claramente si el usuario solicitante es un docente o un estudiante.
                        2.	Se deberá asociar la fecha de préstamo y mostrar la fecha de devolución del texto cuando se realiza la asignación del libro.
                        3.	El código del texto deberá ser ingresado al sistema de préstamos, así como el RUT del usuario solicitante. Con esto el sistema deberá identificar si el usuario corresponde a un docente o un estudiante.
                        4.	En caso de que quien solicita es un alumno, el sistema proveerá de hasta 7 días máximo el préstamo del ejemplar.
                        5.	En caso de que quien solicita es un docente, el sistema proveerá un mínimo de 7 días de préstamo y un máximo de 20 días.
                        6.	Los días de préstamo son corridos, es decir, no corresponden a días hábiles, sino que considera días sábado y domingo.
                        7.	El usuario alumno podrá solicitar un máximo de 4 libros a préstamo (no necesariamente consecutivos).
                        8.	Un usuario docente no tendrá límite de libros a ser solicitados a préstamo.
                        9.	Independiente del tipo de usuario, solo se podrán prestar un ejemplar del mismo libro.
                            ''')
                        break
                    elif opcion == "2":
                        print('''7.	Un usuario podrá solicitar a través del sistema la prórroga de la entrega de un libro (renovación), de acuerdo con las siguientes reglas:
                        a.	Si es estudiante:
                            i.	Solo podrá solicitar una renovación de libro por un plazo máximo de 3 días más. Una vez cumplido el plazo, se deberá realizar la devolución del ejemplar.
                            ii.	En caso de tener más de un ejemplar en préstamo, solo podrá solicitar la renovación de uno de ellos.
                        b.	Si es docente:
                            i.	Podrá solicitar un máximo de 3 renovaciones consecutivas del mismo ejemplar, sin un límite de renovaciones paralelas.
                            ii.	Podrá renovar todo el listado de libros en préstamo.
                        ''')
                        break
                    elif opcion == "3":
                        print('''1.	No se podrán prestar libros si el usuario posee multas impagas.
                            2. Por cada día de retraso en la entrega de un libro, se cobrará una multa de $1.000 independiente del tipo de usuario que solicita.
                            3. Para realizar el pago de la multa, se deberá proveer el RUT del usuario que la posee, y registrar el cobro en el sistema.
                            ''')
                        break
                    elif opcion == "4":
                        print('''17.La interacción de los usuarios alumnos y docente será externa a la plataforma y
                            sólo el usuario encargado de biblioteca podrá realizar la asignación de los libros a los usuarios.

                            18.	El encargado de biblioteca podrá buscar a los usuarios alumnos y profesores a través de una interfaz,
                            en donde a través del RUT, obtendrá la siguiente información:
                                a.	Información personal, tales como:
                                    i.	Nombre.
                                    ii.	RUT.
                                    iii.	Datos de contacto.
                                b.	Últimos libros en préstamo
                                    i.	Título.
                                    ii.	Estado(al día, retrasado).
                                    iii.	Fecha de entrega.
                                    iv.	Fecha de préstamo.
                                c.	Deudas
                                    i.	Título del libro que generó la deuda.
                                    ii.	Cantidad de días de retraso.
                                    iii.	Monto de la deuda.
                            ''')
                        break
                    else:
                        print("saliste")
                        break
            elif opc1 == "3":
                print("¡Hasta pronto!")
