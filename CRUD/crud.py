from CONEX.conex import conex
from datetime import datetime
import traceback
conection = conex()


def validar_rut(rut):  # Para validar rut, lo recicle de mi codigo eva 2.
    return rut.isdigit() and (len(rut) == 8 or len(rut) == 9)


# FUNCIONES PARA LOGIN-------------------------------------------------------------------------------------------
# Aca recibimos los atributos desde la clase acceso y se hace la query para insertar.
def registroUsuarios(usuario, correo, clave, conection):
    sql = "insert into login (usuario, correo, clave, fecha) values (%s,%s,%s,%s)"
    try:
        fecha = datetime.now()  # Fecha actual y se almacena
        # Cursor se utiliza para ejecutar querys en la base de datos.
        cursor = conection.cursor()
        # Se ejecuta la consulta SQL con los valores proporcionados como parámetros.
        cursor.execute(sql, (usuario, correo, clave, fecha))
        conection.commit()  # Se confirman los cambios en la base de datos.
        # Se obtiene el número de filas afectadas por la operación de inserción.
        filas = cursor.rowcount
        if filas > 0:
            # Si al menos 1 fila fue afectada se ejecuta el print.
            print("¡¡Usuario ingresado con exito!!")
        else:
            print("No hay cambios")
    except:
        # Imprime información detallada sobre la excepción que ocurrió.
        print(traceback.print_exc())


# Acá se comparan las claves encriptadas la que esta almacenada con la que se ingresa.
def buscarClave(usuario, conection):  # Busca la clave en la base de datos .
    # Variable sql toma este valor SELECT
    sql = "select clave from login where usuario = %s"
    try:
        usuario_tupla = (usuario,)  # Tupla de un solo elemento.
        # Se convierte el primer elemento de la tupla (usuario_tupla) a una cadena y se guarda en la variable usuario_str.
        usuario_str = str(usuario_tupla[0])
        cursor = conection.cursor()
        cursor.execute(sql, (usuario_str,))
        # Se obtiene la primera fila del resultado de la consulta y se guarda en la variable resultado.
        resultado = cursor.fetchone()
        # Se devuelve el valor de la primera columna de la fila obtenida. En este caso, sería la clave del usuario.
        return resultado[0]

    except:
        print(traceback.print_exc())
