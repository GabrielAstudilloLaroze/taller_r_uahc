# Módulo 4: visualización de datos mediante Ggplot2

library(tidyverse)

load("desiguales.R")

# Cargar el dataframe de la encuesta casen: 
df_casen <- read_csv("https://raw.githubusercontent.com/GabrielAstudilloLaroze/taller_r_uahc/main/dataframes/casen_ingresos_trabajo.csv")



## Gráficos para visualización de una sola variable:


ggplot(data= desiguales,
       aes(x = Genero))+
  geom_bar()



ggplot(data= desiguales,
       aes(x = percepcion_desigualdad_ingresos))+
  geom_density()



##########    ESTRUCTURA DE LA FUNCIÓN GGPLOT ###########
#      1. ggplot() Con este comando podemos crear un gráfico.

#      2. data corresponde al dataframe desde donde vamos a tomar los datos para el gráfico.

#      3. aes() corresponden a las estéticas, dimensiones, que vamos a visualizar, como los ejes x e y,
#         pero también otros elementos como el color, el tamaño, la opacidad, y más.

#      4. geom_...() corresponden a las geometrías, capas, que vamos a visualizar como elementos gráficos



## Gráficos para más de una dimensión


ggplot(data= desiguales,
       aes(percepcion_desigualdad_trato,fill=Genero))+
  geom_density(alpha=.3)





ggplot(data= desiguales,
       aes(y=clase,fill = Genero))+
  geom_bar(position=position_dodge())






###############################################################
#
# Ejercicio aplicado
#
# En la encuesta CASEN, crea un gráfico de densidad
# para visualizar la distribución de los ingresos según sexo
# 
###############################################################






ggplot(data= desiguales,
       aes(percepcion_desigualdad_oportunidades,
           percepcion_desigualdad_ingresos))+
  geom_point()






ggplot(data= desiguales,
       aes(percepcion_desigualdad_oportunidades,
           percepcion_desigualdad_ingresos))+
  geom_point()+
  geom_smooth()





## Dataframe + %>% + ggplot !!!













desiguales%>%
  group_by(clase)%>%
  count(Genero)%>%
  mutate(n=n/sum(n)*100)%>%
  ggplot(aes(y=clase, x=n, fill = Genero))+
  geom_col(position = position_dodge())




###############################################################
#
# Ejercicio aplicado
#
# En la encuesta CASEN, tomando la tabla que construiste en el último ejercicio de género en el grupo
# ocupacional de Profesionales, científicos e intelectuales (grupo 2), crea un gráfico de columnas
# para visualizar la información de la tabla
# 
###############################################################



















#### Aspectos visuales de los gráficos:

# Podemos cambiar el tema de fondo agregando + theme_minimal()
# Podemos agregar o modificar título y etiquetas de ejes agregando + labs()


# podemos manejar los colores del gráfico como una dimensión más utilizando 
# geom_colour() 
# geom_fill()
# Y podemos agregar los valores mediante geom_text()



desiguales%>%
  group_by(clase)%>%
  count(Genero)%>%
  mutate(n=n/sum(n)*100)%>%
  ggplot(aes(y=clase, x=n, fill = Genero))+
  geom_col(position = position_dodge())+
  geom_text(aes(label=round(n,digits=2)),
            position = position_dodge(.9))+
  theme_minimal()+
  labs(title="Auto identificación de clase según Género",
       x="%",
       y="")





