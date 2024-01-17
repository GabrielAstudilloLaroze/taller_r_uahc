# Módulo 3 Manipulación de datos mediante tidyverse



load("desiguales.Rdata")






#############
#    %>%
#############

# 1. Tablas de frecuencias




desiguales%>%
  count(clase)











# 2. Modificar o crear una variable: función mutate()





desiguales%>%
  count(clase)%>%
  mutate(n=n/sum(n)*100)





# 3. Agrupar los datos: función group_by()



desiguales%>%
  group_by(Genero)%>%
  count(clase)%>%
  mutate(n=n/sum(n)*100)





# 4. medias agrupadas

desiguales%>%
  group_by(Genero)%>%
  summarise(percepcion_desigualdad_ingresos=mean(percepcion_desigualdad_ingresos))





###############################################################
#
# Ejercicio aplicado
#
# Tomando los datos de la encuesta CASEN, aplica estas fuciones para calcular:
# 1. Número y porcentaje de personas según género
# 2. Ingreso promedio según género
#
# 
# 
# Importante: 
# 
# ingreso de ocupación principal: yoprcor
# encuesta casen tiene tanto la variable sexo como género, pueden ocupar la que prefieran.
# en la variable sexo 1 = masculino, 2 = femenino

###############################################################

# Cargar el dataframe de la encuesta casen: 
df_casen <- read_csv("https://raw.githubusercontent.com/GabrielAstudilloLaroze/taller_r_uahc/main/dataframes/casen_ingresos_trabajo.csv")

















### Otras funciones importantes de manipulación de datos


# Filtrar datos: filter()


# Estas tablas manipuladas las podemos guardar como un objeto

sub_df<-desiguales%>%
  select(Genero,`Las personas son recompensadas por sus esfuerzos`)



sub_df%>%
  filter(Genero!="Femenino")

  
  

  
## la función filter utiliza operadores para hacer pruebas lógicas:
  # == comprueba si los dos valores son iguales iguales o no
  # != comprueba los dos valores son diferentes
  # operador | es igual a "o": se cumple al menos una de las condiciones (pueden ser de una misma o diferentes variables)
  # operador & es igual a "y": se cumplen todas las condiciones (de diferentes variables)
  


## Renombrar columnas: función rename()



desiguales%>%
  select(clase)%>%
  rename(`Auto adscripción de clase`=clase)







## Recodificar valores de variable dentro de funciones mutate
# utilizando una función case_when() y pruebas lógicas
# terminamos con el valor que queremos asignar

desiguales%>%
  rename(esfuerzo=`Las personas son recompensadas por sus esfuerzos`)%>%
  select(esfuerzo)%>%
  mutate(esfuerzo=
           case_when(esfuerzo=="Muy de acuerdo" ~ 5,
                     esfuerzo=="De acuerdo" ~ 4,
                     esfuerzo=="Ni de acuerdo ni en desacuerdo" ~ 3,
                     esfuerzo=="En desacuerdo" ~ 2,
                     esfuerzo=="Muy en desacuerdo" ~ 1))



###############################################################
#
# Ejercicio aplicado
#
# En la encuesta CASEN:
# 1. filtra el grupo ocupacional Profesionales, científicos e intelectuales (grupo 2)
# selecciona las columnas oficio1_08 y sexo 
# 2. recodifica los valores de género masculino y femenino para que se visualice el texto
# 3. crea una tabla de frecuencias utilizando la función count()
#
# 
# 
###############################################################
