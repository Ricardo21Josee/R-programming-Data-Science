<h1>Análisis de Datos de Educación Sexual</h1>
    
  <div class="section">
        <h2>Descripción del Proyecto</h2>
        <p>Este proyecto realiza un análisis exploratorio de datos sobre educación sexual, incluyendo estadísticas descriptivas, manejo de valores faltantes y visualización de datos. El análisis se realiza en R utilizando datos almacenados en un archivo Excel.</p>
    </div>
    
  <div class="section">
        <h2>Dependencias</h2>
        <p>El script requiere las siguientes librerías de R:</p>
        <ul>
            <li><code>readxl</code>: Para importar datos desde archivos Excel</li>
            <li><code>pastecs</code>: Para cálculos estadísticos avanzados</li>
        </ul>
    </div>
    
  <div class="section">
        <h2>Importación de Datos</h2>
        <p>Los datos se importan desde un archivo Excel:</p>
        <pre><code>library(readxl)
datos <- readxl::read_excel("ruta/al/archivo/Educacion Sexual.xlsx")</code></pre>
    </div>
    
  <div class="section">
        <h2>Exploración Inicial</h2>
        <p>El script incluye varias funciones para explorar los datos:</p>
        <pre><code>View(datos)         # Vista tabular
summary(datos)    # Estadísticas descriptivas básicas
str(datos)        # Estructura de los datos
names(datos)      # Nombres de variables
head(datos, 10)   # Primeras 10 filas
tail(datos, 10)   # Últimas 10 filas
datos[1:10,1:3]   # Primeras 10 filas de 3 variables</code></pre>
    </div>
    
  <div class="section">
        <h2>Manejo de Valores Faltantes</h2>
        <p>Se identifican valores faltantes por filas y columnas:</p>
        <pre><code>rowSums(is.na(datos))  # Missing por filas
colSums(is.na(datos))  # Missing por columnas</code></pre>
    </div>
    
  <div class="section">
        <h2>Análisis Estadístico</h2>
        <p>Se calculan diversas métricas estadísticas para variables clave:</p>
        
  <h3>Variables Analizadas</h3>
        <ul>
            <li><span class="variable">edad</span>: Edad de los participantes</li>
            <li><span class="variable">anios_educ</span>: Años de educación</li>
            <li><span class="variable">num_hijos</span>: Número de hijos</li>
            <li><span class="variable">en_pareja</span>: Estado de relación</li>
            <li><span class="variable">bajo_socioecon</span>: Nivel socioeconómico</li>
        </ul>
        
  <h3>Métricas Calculadas</h3>
        <pre><code># Tendencia central
mean(datos$edad)    # Promedio
median(datos$edad)  # Mediana

# Dispersión
var(datos$edad)     # Varianza
sd(datos$edad)      # Desviación estándar

# Extremos
max(datos$edad)     # Máximo
min(datos$edad)     # Mínimo
range(datos$edad)   # Rango

# Frecuencias
table(datos$en_pareja)      # Modo (recuento)
prop.table(table(datos$en_pareja))  # Proporciones</code></pre>
    </div>
    
  <div class="section">
        <h2>Visualización de Datos</h2>
        <p>El script genera varios gráficos para explorar los datos:</p>
        <pre><code># Histograma para años de educación
hist(datos$anios_educ)

# Gráfico de barras para estado de relación
barplot(prop.table(table(datos$en_pareja)))

# Diagrama de caja para edad
boxplot(datos$edad)

# Gráficos circulares
pie(prop.table(table(datos$bajo_socioecon)), labels = c("Si", "No"), 
    main = "Nivel Bajo-Socioeconómico")

pie(prop.table(table(datos$en_pareja)), labels = c("No", "Si"), 
    main = "En pareja")</code></pre>
    </div>
    
  <div class="section">
        <h2>Uso</h2>
        <ol>
            <li>Instalar las dependencias necesarias en R</li>
            <li>Actualizar la ruta del archivo Excel</li>
            <li>Ejecutar el script completo</li>
            <li>Analizar los resultados y visualizaciones generadas</li>
        </ol>
    </div>
