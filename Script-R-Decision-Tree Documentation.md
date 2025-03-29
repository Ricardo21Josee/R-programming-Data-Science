<h1>Wine Classification with Decision Trees</h1>
    
  <div class="section">
        <h2>Project Description</h2>
        <p>This project implements a classification model using decision trees to categorize different types of wines based on their chemical characteristics. The code is developed in R and uses the "Wine" dataset from the UCI Machine Learning Repository.</p>
    </div>
    
  <div class="section">
        <h2>Dependencies</h2>
        <p>The script requires the following R libraries:</p>
        <ul>
            <li><code>tidyverse</code>: For data manipulation and visualization</li>
            <li><code>rpart</code>: For building decision trees</li>
            <li><code>rpart.plot</code>: For visualizing decision trees</li>
            <li><code>caret</code>: For model evaluation (confusion matrix)</li>
        </ul>
    </div>
    
  <div class="section">
        <h2>Data Preparation</h2>
        <p>The script automatically downloads data from the UCI repository:</p>
        <pre><code># Download data
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", "wine.data")
download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.names", "wine.names")</code></pre>
        
  <p>Data is loaded and properly transformed:</p>
        <pre><code>wine <- read.table("wine.data", sep = ",", header = FALSE)
names(wine) <- c("type", "alcohol", "malic_acid", "ash", ...)
wine <- wine %>% mutate_at("type", factor)</code></pre>
    </div>
    
  <div class="section">
        <h2>Modeling</h2>
        <p>Two decision tree models are implemented:</p>
        
  <h3>Model 1</h3>
        <pre><code>set.seed(1649)
train_data <- sample_frac(wine, .7)
test_data <- setdiff(wine, train_data)
tree_1 <- rpart(formula = type ~ ., data = train_data)</code></pre>
        
  <h3>Model 2</h3>
        <pre><code>set.seed(7439)
train_data_2 <- sample_frac(wine, .7)
test_data_2 <- setdiff(wine, train_data)
tree_2 <- rpart(formula = type ~ ., data = train_data_2)</code></pre>
    </div>
    
  <div class="section">
        <h2>Evaluation</h2>
        <p>For each model, a confusion matrix is generated:</p>
        <pre><code>prediction_1 <- predict(tree_1, newdata = test_data, type = "class")
confusionMatrix(prediction_1, test_data[["type"]])

prediction_2 <- predict(tree_2, newdata = test_data_2, type = "class")
confusionMatrix(prediction_2, test_data_2[["type"]])</code></pre>
    </div>
    
  <div class="section">
        <h2>Visualization</h2>
        <p>Decision trees are visualized with:</p>
        <pre><code>rpart.plot(tree_1)
rpart.plot(tree_2)</code></pre>
    </div>
    
  <div class="section">
        <h2>Usage</h2>
        <ol>
            <li>Install required dependencies in R</li>
            <li>Run the complete script</li>
            <li>Analyze the generated results and visualizations</li>
        </ol>
    </div>
    
  <div class="section">
        <h2>Expected Results</h2>
        <p>The script will generate:</p>
        <ul>
            <li>Two decision tree models with different random seeds</li>
            <li>Confusion matrices to evaluate each model's performance</li>
            <li>Graphical visualizations of the decision trees</li>
        </ul>
    </div>
