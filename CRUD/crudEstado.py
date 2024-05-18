from CONEX.conex import conex
from datetime import datetime
from CLASES import Estado

def insertar_estado(estado):
    conn = conex()
    cursor = conn.cursor()
    cursor.execute('''
    INSERT INTO estado (estado) VALUES (%s)
    ''', (estado.estado,))
    conn.commit()
    estado.idEstado = cursor.lastrowid
    conn.close()

def obtener_estado(idEstado):
    conn = conex()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM estado WHERE idEstado = %s', (idEstado,))
    row = cursor.fetchone()
    conn.close()
    if row:
        return Estado(idEstado=row[0], estado=row[1])
    return None

def listar_estados():
    conn = conex()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM estado')
    rows = cursor.fetchall()
    conn.close()
    estados = []
    for row in rows:
        estados.append(Estado(idEstado=row[0], estado=row[1]))
    return estados
