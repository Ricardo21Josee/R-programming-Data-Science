library(tidyverse)
library(rpart)
library(rpart.plot)
library(caret)

# Datos
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", "wine.data")

# Información
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.names", "wine.names")

#Empezamos a analizar nuestros datos
readLines("wine.data", n = 10)

#Utilizacion de la funcion read_tables
vino <- read.table("wine.data", sep = ",", header = FALSE)

#Lectura del archivo
readLines("wine.names", n = 10)

#Transformacion
file.copy(from = "wine.names", to = "wine_names.txt")
file.show("wine_names.txt")

#Summary del Objeto
summary(vino)

#Transformacion de los nombres de las columnas
nombres <- 
  readLines("wine_names.txt")[58:70] %>% 
  gsub("[[:cntrl:]].*\\)", "", .) %>% 
  trimws() %>% 
  tolower() %>% 
  gsub(" |/", "_", .) %>% 
  # Agregamos el nombre "tipo", para nuestra primera columna con los tipos de vino
  c("tipo", .)

#Visualizamos
names(vino) <- nombres 

#Transformacion Final
vino <- vino %>% 
  mutate_at("tipo", factor)


#Creacion del Modelo de ML
set.seed(1649)
vino_entrenamiento <- sample_frac(vino, .7)

#Data de validacion
vino_prueba <- setdiff(vino, vino_entrenamiento)

#Entrenando nuestro modelo
arbol_1 <- rpart(formula = tipo ~ ., data = vino_entrenamiento)

#Evaluando el modelo
arbol_1

#Importando la libreria
library(rpart.plot)
rpart.plot(arbol_1) 

#Prediccion del algoritmo
prediccion_1 <- predict(arbol_1, newdata = vino_prueba, type = "class")

#Matriz de Confusion!
confusionMatrix(prediccion_1, vino_prueba[["tipo"]])

#Generamos un segundo arbol de decision
set.seed(7439)
vino_entrenamiento_2 <- sample_frac(vino, .7)
vino_prueba_2 <- setdiff(vino, vino_entrenamiento)
arbol_2 <- rpart(formula = tipo ~ ., data = vino_entrenamiento_2)
prediccion_2 <- predict(arbol_2, newdata = vino_prueba_2, type = "class")

#Visualizamos el arbol de decision
rpart.plot(arbol_2)

#Matriz de Confusion
confusionMatrix(prediccion_2, vino_prueba_2[["tipo"]])

