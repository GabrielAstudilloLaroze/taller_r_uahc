# Módulo 5: Modelos de regresión


## Retomando: visualización de dos variables continuas

library(tidyverse)

load("desiguales.Rdata")



# Cargar el dataframe de la encuesta casen: 
df_casen <- read_csv("https://raw.githubusercontent.com/GabrielAstudilloLaroze/taller_r_uahc/main/dataframes/casen_ingresos_trabajo.csv")




desiguales%>%
ggplot(aes(percepcion_desigualdad_oportunidades,
           percepcion_desigualdad_general))+
  geom_point(size=3,
             alpha=.1,
             colour="purple")+
  theme_minimal()


# Correlación mediante función cor()

#podemos calcular la correlación en entre dos variables
cor(desiguales$percepcion_desigualdad_oportunidades,
    desiguales$percepcion_desigualdad_general)


# o podemos calcularla para una matriz
desiguales%>%
  select(percepcion_desigualdad_oportunidades,
         percepcion_desigualdad_general)%>%
  cor()

desiguales%>%
  select(percepcion_desigualdad_oportunidades,
         percepcion_desigualdad_regiones,
         percepcion_desigualdad_ingresos,
         percepcion_desigualdad_poder,
         percepcion_desigualdad_trato,
         percepcion_desigualdad_salud,
         percepcion_desigualdad_educacion,
         percepcion_desigualdad_general)%>%
  cor()














## Pero yo quiero conocer el efecto aislado de cada dimensión sobre la percepción de desigualdad general.

# Para esto utilizamos un modelo de regresión


# función lm()

# estructura: lm(variable depentiente ~ regresores, dataframe)

lm(percepcion_desigualdad_general~ percepcion_desigualdad_oportunidades + 
   percepcion_desigualdad_regiones  + 
   percepcion_desigualdad_ingresos + 
   percepcion_desigualdad_poder + 
   percepcion_desigualdad_trato + 
   percepcion_desigualdad_salud + 
   percepcion_desigualdad_educacion,
   data= desiguales)


# necesito asignarla a un objeto
reg_model<-lm(percepcion_desigualdad_general~ percepcion_desigualdad_oportunidades + 
     percepcion_desigualdad_regiones  + 
     percepcion_desigualdad_ingresos + 
     percepcion_desigualdad_poder + 
     percepcion_desigualdad_trato + 
     percepcion_desigualdad_salud + 
     percepcion_desigualdad_educacion,
   data= desiguales)



# y consulto el resultado
summary(reg_model)









desiguales%>%
  mutate(valores_estimados=reg_model$fitted.values)%>%
  ggplot(aes(percepcion_desigualdad_general,valores_estimados))+
  geom_point(size=3, alpha=.3, colour="purple")+
  theme_minimal()




#######################################
# Actividad aplicada:
# 
# Con los datos de la encuesta casen, desarrolla un modelo de regresión para 
# estimar el efecto de la edad, el grupo ocupacional y las horas de trabajo sobre el ingreso de ocupación principal
# 
# variables:
# ingreso de ocupación principal: yoprcor
# edad: edad
# horas trabajadas: o10
# grupo ocupacional: oficio1_08
#######################################


# IMPORTANTE!
# Primero, debemos hacer pre procesamiento:
# 1. filtrar valores anómalos en o10 (-88)
# 2. definir oficio1_08 como factor.



