<h1>Sexual Education Data Analysis</h1>
    
  <div class="section">
        <h2>Project Description</h2>
        <p>This project performs exploratory data analysis on sexual education data, including descriptive statistics, missing value handling, and data visualization. The analysis is conducted in R using data stored in an Excel file.</p>
    </div>
    
  <div class="section">
        <h2>Dependencies</h2>
        <p>The script requires the following R libraries:</p>
        <ul>
            <li><code>readxl</code>: For importing data from Excel files</li>
            <li><code>pastecs</code>: For advanced statistical calculations</li>
        </ul>
    </div>
    
  <div class="section">
        <h2>Data Import</h2>
        <p>Data is imported from an Excel file:</p>
        <pre><code>library(readxl)
data <- readxl::read_excel("path/to/file/Sexual Education.xlsx")</code></pre>
    </div>
    
  <div class="section">
        <h2>Initial Exploration</h2>
        <p>The script includes several functions for data exploration:</p>
        <pre><code>View(data)         # Tabular view
summary(data)    # Basic descriptive statistics
str(data)        # Data structure
names(data)      # Variable names
head(data, 10)   # First 10 rows
tail(data, 10)   # Last 10 rows
data[1:10,1:3]   # First 10 rows of 3 variables</code></pre>
    </div>
    
  <div class="section">
        <h2>Missing Value Handling</h2>
        <p>Missing values are identified by rows and columns:</p>
        <pre><code>rowSums(is.na(data))  # Missing by rows
colSums(is.na(data))  # Missing by columns</code></pre>
    </div>
    
  <div class="section">
        <h2>Statistical Analysis</h2>
        <p>Various statistical metrics are calculated for key variables:</p>
        
  <h3>Analyzed Variables</h3>
        <ul>
            <li><span class="variable">edad</span> (age): Participants' age</li>
            <li><span class="variable">anios_educ</span> (education_years): Years of education</li>
            <li><span class="variable">num_hijos</span> (children_count): Number of children</li>
            <li><span class="variable">en_pareja</span> (in_relationship): Relationship status</li>
            <li><span class="variable">bajo_socioecon</span> (low_socioeconomic): Socioeconomic level</li>
        </ul>
        
  <h3>Calculated Metrics</h3>
        <pre><code># Central tendency
mean(data$edad)    # Average
median(data$edad)  # Median

# Dispersion
var(data$edad)     # Variance
sd(data$edad)      # Standard deviation

# Extremes
max(data$edad)     # Maximum
min(data$edad)     # Minimum
range(data$edad)   # Range

# Frequencies
table(data$en_pareja)      # Mode (count)
prop.table(table(data$en_pareja))  # Proportions</code></pre>
    </div>
    
  <div class="section">
        <h2>Data Visualization</h2>
        <p>The script generates several plots to explore the data:</p>
        <pre><code># Histogram for education years
hist(data$anios_educ)

# Bar plot for relationship status
barplot(prop.table(table(data$en_pareja)))

# Box plot for age
boxplot(data$edad)

# Pie charts
pie(prop.table(table(data$bajo_socioecon)), labels = c("Yes", "No"), 
    main = "Low Socioeconomic Level")

pie(prop.table(table(data$en_pareja)), labels = c("No", "Yes"), 
    main = "In Relationship")</code></pre>
    </div>
    
  <div class="section">
        <h2>Usage</h2>
        <ol>
            <li>Install required dependencies in R</li>
            <li>Update the Excel file path</li>
            <li>Run the complete script</li>
            <li>Analyze the generated results and visualizations</li>
        </ol>
    </div>
