#Llamo a la liberia readxl y luego importo.

library(readxl)
datos <- readxl::read_excel("C:/Users/yardo/OneDrive/Desktop/R-with-Data-Science/Script-R-Sex-Education-Database/Educacion Sexual.xlsx")

## Explorando los datos
View(datos)

summary(datos) # Suministra estadistica descriptiva basica

str(datos) # Suministra la estructura de los datos

names(datos) # Lista las variables

head(datos, n= 10) #Primeras 10 filas

tail(datos) # Ultimas 6 filas

tail(datos, n = 10) # Ultimas 10 filas

datos[1:10,1:3] # Primeras 10 filas de las 3 primeras variables

# Informacion Faltante (Missing)

rowSums(is.na(datos)) # Cantidad de Missing por Filas

colSums(is.na(datos)) # Cantidad de Missing por Columnas

# Estadistica Descriptiva mediante paquete "pastecs"-
#install.packages("pastecs")

#Cargamos la libreria
library(pastecs)

#Promedio
mean(datos$edad)
mean(datos$anios_educ)
mean(datos$num_hijos)

#Mediana
median(datos$edad)
median(datos$anios_educ)
median(datos$num_hijos)

#Varianza
var(datos$edad)
var(datos$anios_educ)
var(datos$num_hijos)

#Desvio Estandar
sd(datos$edad)
sd(datos$anios_educ)
sd(datos$num_hijos)

#Maximos
max(datos$edad)
max(datos$anios_educ)
max(datos$num_hijos)

#Minimo
min(datos$edad)
min(datos$anios_educ)
min(datos$num_hijos)

#Rango
range(datos$edad)
range(datos$num_hijos)
range(datos$anios_educ)

#Dimension del dataset
length(datos)

# Modo por Frecuencias
table(datos$en_pareja)
table(datos$bajo_socioecon)
table(datos$edad)

#Graficos 
hist(datos$anios_educ)
barplot(prop.table(table(datos$en_pareja)))
boxplot(datos$edad)

labels <- c("Si", "No")
pie(prop.table(table(datos$bajo_socioecon)), labels, 
    main="Nivel Bajo-Socieconomico")

labels <- c("No", "Si")
pie(prop.table(table(datos$en_pareja)),labels,main="En pareja")
