def algoritmo(tuplas):
    analisis_ordenados = sorted(tuplas, reverse=True, key=lambda tupla : tupla[1])
    respuesta = []
    for analisis in analisis_ordenados:
        respuesta.append(analisis[0])

    return respuesta