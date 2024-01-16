





















a<-4
b<-8 
c<-15 
d<-16 
e<-23 
f<-42  


x<-a+b

y<-c*d





este_objeto_es_texto<-"¡Bienvenidos y bienvenidas al curso!"

este_objeto_es_texto<-"Introducción al análisis de datos en R"

este_objeto_es_un_vector<-c(4,8,15,16,23,42)





libros<-c("Esquisse d’une théorie de la pratique", "La reproducción", "El oficio de sociólogo" , "El amor al arte. Los museos europeos y su público",
          "Los estudiantes y la cultura", "Argelia 60. Estructuras económicas y estructuras temporales")

años_publicacion<-c(1972,1970,1968,1966,1964,1977)

bourdieu_df<-data.frame(libros,años_publicacion)



bourdieu_df$libros

bourdieu_df$años_publicacion


### CON LOS DATOS ORGANIZADOS PODEMOS EMPEZAR A ANALIZAR

# Descriptivos:

# Media:  mean()
# Mediana: median()
# Mínimo: max() 
# Máximo: min()
# Desviación estándar: sd()



#### En vez de escribir los datos dentro de R, podemos cargarlos desde diferentes formatos

# Desde Excel: librerías readxl y openxlsx

# SPSS: haven o foreign

# Formatos nativos de R (*.R o *.Rdata) no necesitan librerías

# Formatos de texto plano como CSV traen preinstaladas librerías para su uso.  



save(bourdieu_df, file="bourideu_df.Rdata")

load("desiguales.Rdata")

mean(desiguales$percepcion_desigualdad_general)


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








#######################
#
#
## Actividad aplicada:
#
#
#######################


# Seleciona una de las siguientes bases de datos e impórtala a R

# 1. Encuesta cep Diciembre de 2019 (.SPSS)
# 2. Encuesta CASEN (.CSV)

# Selecciona una variable contínua y calcular la media y desviación estándar
# Una variable categórica y construir una tabla de proporciones.
