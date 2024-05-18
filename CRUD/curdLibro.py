from CONEX.conex import conex
from datetime import datetime
from CLASES.LIBRO import Libro

def insertar_libro(libro):
    conn = conex()
    cursor = conn.cursor()
    cursor.execute('''
    INSERT INTO libro (titulo, autor, anio_publicacion) VALUES (%s, %s, %s)
    ''', (libro.titulo, libro.autor, libro.anio_publicacion))
    conn.commit()
    libro.codigo_libro = cursor.lastrowid
    conn.close()

def obtener_libro(codigo_libro):
    conn = conex()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM libro WHERE codigo_libro = %s', (codigo_libro,))
    row = cursor.fetchone()
    conn.close()
    if row:
        return Libro(codigo_libro=row[0], titulo=row[1], autor=row[2], anio_publicacion=row[3])
    return None
