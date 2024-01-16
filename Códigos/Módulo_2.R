### CON LOS DATOS ORGANIZADOS PODEMOS EMPEZAR A ANALIZAR


# Para eso vamos a utilizar comenzar a utilizar funciones y librerías

# Descriptivos:

# Media:  mean()
# Mediana: median()
# Mínimo: max() 
# Máximo: min()
# Desviación estándar: sd()









load("desiguales.Rdata")

mean(desiguales$percepcion_desigualdad_general)




#### En vez de escribir los datos dentro de R, podemos cargarlos desde diferentes formatos

# Desde Excel: librerías readxl y openxlsx

# SPSS: haven o foreign

# Formatos nativos de R (*.R o *.Rdata) no necesitan librerías

# Formatos de texto plano como CSV traen preinstaladas librerías para su uso.  

#####
#
#
#     función(dataframe $ variable)
#
#
###




# Distribución de variables cuantitativas: summary()

# Frecuencia: table()

# Porcentaje: prop.table(table())


prop.table(table(desiguales$clase))*100



# Instalar librerías: install.packages("")

# una vez instalada, debemos cargarla en la sesión de R: library()



#######################
#
#
## Actividad aplicada:
#
#
#######################



# Cargar los siguientes dataframes al entorno de R:


# 1. Encuesta cep Diciembre de 2019 (.SPSS)
# 2. Encuesta CASEN (.CSV)


# Para Encuesta cep (SPSS), instalar y cargar la librería `foregin`
# Utilizar la función `read.spss()`

# Para CASEN (csv) instalar y cargar librería `readr`
# utilizar la función `read_csv()`

# En un dataframe selecciona una variable contínua de tu interés y calcula la media y desviación estándar
# En el otro dataframe selecciona una variable categórica y construir una tabla de proporciones.


