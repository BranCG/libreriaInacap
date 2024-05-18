from CONEX.conex import conex
from datetime import datetime

def insertar_libro(libro):
    conn = conex()
    cursor = conn.cursor()
    cursor.execute('''
    INSERT INTO libro (titulo, autor, anio_publicacion) VALUES (%s, %s, %s)
    ''', (libro.titulo, libro.autor, libro.anio_publicacion))
    conn.commit()
    libro.codigo_libro = cursor.lastrowid
    conn.close()
