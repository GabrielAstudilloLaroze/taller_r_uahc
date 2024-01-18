# Módulo 6: Análisis Factorial Exploratorio



# Vamos a utilizar la librería psych.

# install.packages("psych")

library(psych)


#Pre procesamiento de los datos

fa_data<-desiguales%>%
  select(`Las personas son recompensadas por su inteligencia y habilidades`:`Las personas son recompensadas por sus esfuerzos`)%>%
  mutate(id=row_number())%>%
  pivot_longer(`Las personas son recompensadas por su inteligencia y habilidades`:`Las personas son recompensadas por sus esfuerzos`)%>%
  mutate(value=case_when(value=="Muy de acuerdo"~5,
                         value=="De acuerdo"~4,
                         value=="Ni de acuerdo ni en desacuerdo"~3,
                         value=="En desacuerdo"~2,
                         value=="Muy en desacuerdo"~1))%>%
  pivot_wider()%>%
  select(-id)



fa_data%>%
  nfactors()


factor_analisys<-fa_data%>%
  fa(nfactors=2)
  
print(factor_analisys,sort=TRUE,cut=.3)




########################
# Ejercicio:
# 
# En el dataframe desiguales, realiza un análisis factorial exploratorio con las variables
# sobre percepción de la desigualdad 
# 
########################


















#####################
# Segunda parte: K means

fa_data%>%
  kmeans(centers=2)





k_model<-fa_data%>%
  filter(!is.na(`Las personas son recompensadas por sus esfuerzos`),
         !is.na(`Las diferencias de ingreso son demasiado grandes`),
         !is.na(`Las personas son recompensadas por su inteligencia y habilidades`),
         !is.na(`Desigualdad sigue existiendo porque beneficia a los ricos y poderosos`))%>%
  kmeans(centers=2)




k_model$centers




########################
# Ejercicio:
# 
# En el dataframe desiguales, implementa un modelo de clusters con las variables
# sobre percepción de la desigualdad 
# 
# Define tres clusters en el modelo
# 
########################

