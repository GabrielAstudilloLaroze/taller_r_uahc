





















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

save(bourdieu_df, file="bourideu_df.Rdata")


load("bourideu_df.Rdata")
