<h1>Clasificación de Vinos con Árboles de Decisión</h1>
    
<div class="section">
        <h2>Descripción del Proyecto</h2>
        <p>Este proyecto implementa un modelo de clasificación utilizando árboles de decisión para categorizar diferentes tipos de vinos basándose en sus características químicas. El código está desarrollado en R y utiliza el conjunto de datos "Wine" del UCI Machine Learning Repository.</p>
    </div>
    
 <div class="section">
        <h2>Dependencias</h2>
        <p>El script requiere las siguientes librerías de R:</p>
        <ul>
            <li><code>tidyverse</code>: Para manipulación y visualización de datos</li>
            <li><code>rpart</code>: Para construir árboles de decisión</li>
            <li><code>rpart.plot</code>: Para visualizar los árboles de decisión</li>
            <li><code>caret</code>: Para evaluación de modelos (matriz de confusión)</li>
        </ul>
    </div>
    
<div class="section">
        <h2>Preparación de Datos</h2>
        <p>El script descarga automáticamente los datos del repositorio UCI:</p>
        <pre><code># Descargar datos
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", "wine.data")
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.names", "wine.names")</code></pre>
        
  <p>Los datos se cargan y transforman adecuadamente:</p>
        <pre><code>vino <- read.table("wine.data", sep = ",", header = FALSE)
names(vino) <- c("tipo", "alcohol", "acido_malico", "ceniza", ...)
vino <- vino %>% mutate_at("tipo", factor)</code></pre>
    </div>
    
<div class="section">
        <h2>Modelado</h2>
        <p>Se implementan dos modelos de árboles de decisión:</p>
        
  <h3>Modelo 1</h3>
        <pre><code>set.seed(1649)
vino_entrenamiento <- sample_frac(vino, .7)
vino_prueba <- setdiff(vino, vino_entrenamiento)
arbol_1 <- rpart(formula = tipo ~ ., data = vino_entrenamiento)</code></pre>
        
   <h3>Modelo 2</h3>
        <pre><code>set.seed(7439)
vino_entrenamiento_2 <- sample_frac(vino, .7)
vino_prueba_2 <- setdiff(vino, vino_entrenamiento)
arbol_2 <- rpart(formula = tipo ~ ., data = vino_entrenamiento_2)</code></pre>
    </div>
    
<div class="section">
        <h2>Evaluación</h2>
        <p>Para cada modelo se genera una matriz de confusión:</p>
        <pre><code>prediccion_1 <- predict(arbol_1, newdata = vino_prueba, type = "class")
confusionMatrix(prediccion_1, vino_prueba[["tipo"]])

prediccion_2 <- predict(arbol_2, newdata = vino_prueba_2, type = "class")
confusionMatrix(prediccion_2, vino_prueba_2[["tipo"]])</code></pre>
    </div>
    
<div class="section">
        <h2>Visualización</h2>
        <p>Los árboles de decisión se visualizan con:</p>
        <pre><code>rpart.plot(arbol_1)
rpart.plot(arbol_2)</code></pre>
    </div>
    
 <div class="section">
        <h2>Uso</h2>
        <ol>
            <li>Instalar las dependencias necesarias en R</li>
            <li>Ejecutar el script completo</li>
            <li>Analizar los resultados y las visualizaciones generadas</li>
        </ol>
    </div>
    
  <div class="section">
        <h2>Resultados Esperados</h2>
        <p>El script generará:</p>
        <ul>
            <li>Dos modelos de árboles de decisión con diferentes semillas aleatorias</li>
            <li>Matrices de confusión para evaluar el rendimiento de cada modelo</li>
            <li>Visualizaciones gráficas de los árboles de decisión</li>
        </ul>
    </div>
