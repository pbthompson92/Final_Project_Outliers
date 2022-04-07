# US Housing Prices

## Team Introduction
This project was successful due to active participation of following team members:<br/>
#### Matt Hardy
#### Ruchi Mathur
#### Kathy Nwe
#### Paula Thompson

## Project Overview
Our project is focused on creating a machine learning model that predicts housing prices in the United States based on a number of economic variables including inflation rates, unemployment, rates, gas prices, interest rates and mortgages.

In the last month we have a 40-year high in inflation rates. Our group is interested in understanding the impact these aggressive increases will have on housing prices across our various locations.

### Project Question
Can we predict housing prices across various regions in the United States using consumer price index, fuel rates, interest rates, unemployment rates, mortgage data, and other variables through a machine learning model? 

### Index
- [Data Sources](#description-of-data-source)
    - [Data Exploration](#data-exploration)
- [Technologies Used](#technologies-used)
- [Data Transformation](#data-transformation-1)
    - [Geocoding](#geocoding)
    - [Incorporating Additional Datasets](#incorporating-additional-datasets)
- [Machine Learning Model](#machine-learning-model-1)
    - [Feature and Target Variables](#feature-and-target-variables)
    - [Data Pre-Processing](#data-pre-processing)
    - [Outlier Detection](#outlier-detection)
- [Multiple Linear Regression](#1-machine-learning-model---multiple-linear-regression-mlr)
    - [Feature Engineering and Feature Selection](#feature-engineering-and-feature-selection)
    - [Modeling Process](#mlr---modeling-process)
    - [Model Evaluation](#mlr---model-evaluation)
    - [Model Evaluation Using Statsmodel](#mlr---model-evaluation-using-statsmodel)
    - [Predictions](#mlr---predictions)
    - [Graphical User Interface (GUI)](#mlr---graphical-user-interface-gui)
    - [Advantages and Disadvantages](#mlr--advantages-and-disadvantages)
- [Random Foreset Regressor](#2-machine-learning-model---random-forest-regressor-rf)
    - [Modeling Process](#rf---modeling-process)
    - [Model Evaluation](#rf---model-evaluation)
- [Neural Network](#3-machine-learning-model---neural-network-nn)
- [Machine Learning Model Comparison/Model of Choice](#4-machine-learning-model-comparison-and-model-of-choice)
- [Database](#database-1)
- [Tableau Dashboard](#dashboard-1)
---
- [Presentation](#presentation)
---
### Project Outline

![image](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/Project%20Flow.png)


## Description of Data Source 
 * [Unemployment Rates](https://data.oecd.org/unemp/unemployment-rate.htm) - Rates for the United States, filtered between 2011 to 2022. 
 * [Housing Price Dataset](https://www.kaggle.com/paultimothymooney/zillow-house-price-data?select=Sale_Prices_City.csv) - Contains information on housing prices across multiple regions in the United States. 
 * [Gas Prices](https://www.eia.gov/dnav/pet/hist/LeafHandler.ashx?n=PET&s=EMD_EPD2D_PTE_R50_DPG&f=W)
 * [Consumer Price Index Dataset](https://fred.stlouisfed.org/series/CPIAUCNS) - Contains information on the consumer price index between 1913 to 2022.
 * [Mortgage Data](https://www.fhfa.gov/DataTools/Downloads/Pages/National-Mortgage-Database-Aggregate-Data.aspx) - Monthly mortgage data in the United States on a monthly basis. 
 * [Interest Rates](https://fred.stlouisfed.org/series/FEDFUNDS) - Interest Rates starting in 1955

We will combine these datasets together to create one comprehensive view that can be used for the remainder of this analysis.

### Data Exploration 
Our team started this project with only two data sources, [housing prices](https://www.kaggle.com/paultimothymooney/zillow-house-price-data?select=Sale_Prices_City.csv) and [consumer price index](https://fred.stlouisfed.org/series/CPIAUCNS). The other datasources listed above were slowly added. These data sources were cleaned by dropping null values, limiting the data range and dropping unnecessary columns. All of this data was filtered to be specific to the United States and limited to years between 2011 and 2022. We also determined the need to include zip code and latitude / longitude. This was a proactive approach to ensure we had all the information we need to create meaningful visualizations that would easily display discrepancies across the various regions within the United States. 

## Technologies Used
We used a variety of technologies, languages and libraries during the different stages of our project and you can see a comprehensive list of them here:<br/>
#### Data Transformation 
Python (pandas, USzipcode, geopy, Nominatim api, pathlib/path) Jupyter Notebook, csv file
#### Database
SQL, postgreSQL, pgAdmin, Microsoft Excel
#### Machine Learning Model
Python (pandas, numpy, matplotlib, seaborn, sci-kit learn, tensorflow), Jupyter Notebook, csv file
#### Dashboard
Python GUI (tkinter), Tableau, vizQL


## Data Transformation
Our first [dataset](https://www.kaggle.com/paultimothymooney/zillow-house-price-data?select=Sale_Prices_City.csv) contains chronological housing price data from 3,728 cities within the US, but there were many null values.  Our scope had to be limited to dates beginning in 2011 in order to have enough datapoints after rows with null values were purged from the dataset, ultimately netting 1,097 cities to work with.  The dataset used unique "region ID's" for an index, with monthly datestamps as column headers.  All of the other datasets that we wanted to incorporate used dates as their index, so we would need to transpose the housing price dataset after it had gone through our geocoding engine.

### Geocoding
Our dataset only included city and state names, without any additional geographic data that we would need in order to properly visualize our data on a map.  We chose to feed our list of locations through the USzipcode python search engine, in order to then feed the list of zip codes to our geocoding API (Nominatim).  We instructed our code to only one zip code in (most) cases where a city name returned more than one.  We also created a list of cities that the engine wasn't able to pair with a result, to make sure we weren't losing too many locations (we lost around another 100 locations during this process, but investigating them revealed that they were all very obscure and rural).<br/>
Our slightly reduced dictionary of locations (paired with zip codes) was then fed through a Nominatim API call (accessed through the GeoPy Python library) to produce exact coordinates for each city in order to visualize the data in Tableau.  The API seemed to locate a slightly different number of locations each time it was ran, which is why we chose to do the remaining data incorporation with automated Python scripts (rather than with SQL joins, referenced [below](#database-1)).<br/>

![api_call](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/api_call.png)

### Incorporating Additional Datasets
After we had generated our finalized list of locations that were properly matched with zip codes and coordinates, we purged locations locations that were not in the list from our original dataset.  Our original data was transposed in order to use dates as our index, and we chose to use zip codes as our unique column headers to facilitate our [machine learning model's GUI](#mlr---graphical-user-interface-gui).  We then used a Python script to import and clean the inflation, gas price, interest rate, unemployment rate, and average mortgage rate datasets, converting them to a uniform date-time format in the process.  Through Python, we merged each dataset with our original, much like a series of SQL inner joins.<br/>
<br/>
After all datasets had been successfully merged into the file that we would be using for our machine learning model, we used a Pandas ".melt()" method to create a very long, skinny version of the dataset that would be more useful for integration with Tableau.

## Machine Learning Model
To find an answer to our project question, we tested out three different machine learning algorithms to see which one works best: <br/>
- Multiple Linear Regression
- Random Forest Regression
- Neural Network Algorithm

### Feature and Target Variables
Based on our project question, our target/ dependent variable is:
- Housing Prices in various zip codes of the country <br/>

Feature/ Independent Variables are:
- Gas Prices
- Unemployment Rates
- Average Mortgage Rates
- Consumer Price Index (Inflation)
- Interest Rates

### Data Pre-Processing
In addition to the transformation conducted and detailed above, additional pre-processing was performed prior to implementing a machine learning model:
 * Import the libraries
 * Import the final dataset as a csv file
 * Check for missing values
 * No encoding is necessary. All data in our dataset is numeric.
 * Splitting the dataset into training and testing set
 * Feature scaling in porder to minimize the variations in our dataset. The housing prices across all different locations/zip codes were divided by 1000.

### Outlier Detection
Presence of outliers in a dataset can result in a poor fit and lower predictive modeling performance. Boxplots were plotted to identify any outliers in our dataset. Below is an image of boxplots for zipcode 10001. As illustrated below, no outliers were identified in our dataset.

![boxplot.png](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/boxplot.png)

However, it is to be noted that identifying and removing outliers is challenging with simple statistical methods for most machine learning datasets given the large number of input variables. If outlier removal/replacement is required, instead of following a manual process, we recommend automatic outlier detection methods which can be used in the modeling pipeline and compared, just like other data preparation methods that may be applied to the dataset. The scikit library has several options for automatic outlier detection. One example is Isolation Forest, or iForest for short.

### 1. Machine Learning Model - Multiple Linear Regression (MLR)
A linear regression model is an appropriate choice for making numerical predictions, especially when there is linear relation between the features. In our case, since we have multiple features in our dataset, a multiple linear regression model is applicable. The Multiple linear regression algorithm, models the linear relationship between a single dependent continuous variable and more than one independent variables.

#### Feature Engineering and Feature Selection

Feature engineering is a process of extracting useful features from raw data using math, statistics and domain knowledge. For our project we started the process of feature engineering early on by detecting missing values and removing them from the dataset. Additionally during preprocessing, zip codes were added as a feature to our dataset by matching each region ID against the respective zip codes. This was performed during the data transformation process.

Feature selection was achieved by checking the linear relationships that exists between the dependent and independent variable. Scatter plots were prepared for each feature. Scatter plots for the zip code 10001 are illustrated below. Based on these plots we determined the following: <br/>
 - Interest Rates and Inflation (Consumer Price Index - CPI) have a linear relationship with Housing Prices
 - Gas Prices and Unemployment Rates also have a linear relationship with Housing Prices, but with a negative slope, which means that housing prices decrease with increasing gas prices and unemployment rates
 - Mortgage rates do not have a linear relationship with Housing Prices. Multiple regressions are based on the assumption that there is a linear relationship between both the dependent and independent variables. Therefore, we dropped the mortgage rates from our dataset. 
 
![scatterplots.png](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/scatterplots.png)

#### MLR - Modeling Process
![MLRsteps.png](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/MLRsteps.png)

- The model begins by us selecting the zip code that we are interested in for predicting housing prices. This pulls in the housing prices data for that particular zip code. 
- Feature and target variables are defined. This definition is same as discussed in previous sections
- The data is split into training and testing sets. Python Scikitlearn's train_test_split function was used to split our data into training and testing sets for model performance evaluation. This is done by importing train_test_split from sklearn.model_selection. By default this function allots 25% of the dataset as the testing set.
- Linear regression model is applied 
- The model is trained 
- Model is put to use by making predictions 

#### MLR - Model Evaluation
To evaluate model performance we calculate several parameters (For an example a model was evaluated for zip code 10001):<br/>
- MAE is a very simple metric which calculates the absolute difference between actual and predicted values. (MAE = 10.42)
- MSE represents the squared distance between actual and predicted values. we perform squared to avoid the cancellation of negative terms and it is the benefit of MSE. (MSE = 169.21)
- RMSE The metric is very helpful when you are developing a model without calling the inputs. In that case, the output will vary on a large scale. (RMSE = 13.01)
- RMSLE: To control this situation of RMSE we take the log of calculated RMSE error. (RMSLE = 2.57)
- R2 is the Coefficient of Determination or Goodness of fit. It calculates how must regression line is better than a mean line.(R2 = 0.88)<br/>
The disadvantage of the R2 score is while adding new features in data the R2 score starts increasing or remains constant but it never decreases because It assumes that while adding more data, variance of data increases. But the problem is when we add an irrelevant feature in the dataset then at that time R2 sometimes starts increasing which is incorrect.
- Adjusted R2: To control this situation discussed above adjusted R2 is calculated. (adj R2 = 0.86)<br/>

#### MLR - Model Evaluation using statsmodel
Statsmodels is a Python library built specifically for statistics. OLS from statsmodel was used in order to see all model statistics in one place, in a tabular format.<br/>
(OLS) or Ordinary Least Squares regression  is a common technique for estimating coefficients of linear regression equations which describe the relationship between one or more independent quantitative variables and a dependent variable
Notice below that the coefficients captured in this table match with the coefficients generated by sklearn in the previous section.
![OLStable.png](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/OLStable.png)

#### MLR - Predictions
What would be the housing price in zip code 10001 (which is in NY btw) when average gas price hits $6.69, unemployment rate hits 13.5, interest rates are at 4.5, and the Consumer price index is at 356 points?
Feature Variables:
Gas Prices = $6.69
Unemployment Rate = 13.5
Interest Rate = 4.5
CPI = 356
Model Prediction = $750,321

![MLRprediction.png](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/MLRprediction.png)

#### MLR - Graphical User Interface (GUI)
The predictions of this model can be visualized in a pop up window with a help of GUI. This GUI will allow users to input the desired economic factors in order to get predicted housing prices. This was done by using Tkinter, which is a standard GUI library for Python. Python when combined with Tkinter provides a fast and easy way to create GUI applications.
Once we run the code, we will see this GUI, which includes the output generated by sklearn and the scatter diagrams for the selected Zip code. To bring to your attention that this is the same prediction we saw in the previous section.<br/>

![GUI.png](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/GUI.png)

Please note: A live demo of this model prediction GUI is included in 'Dashboards and Visualization' section of our presentation. A link to the presentation is included later in this README file.

#### MLR- Advantages and Disadvantages 
There are two main advantages to analyzing data using a multiple regression model. The first is the ability to determine the relative influence of one or more independent variables to the dependent variable. The second advantage is the ability to identify outliers, or anomalies.

Any disadvantage of using a multiple regression model usually comes down to the data being used. Two examples of this are using incomplete data and falsely concluding that a correlation is a causation.

### 2. Machine Learning Model - Random Forest Regressor (RF)
#### RF - Modeling Process
Random forest is a type of supervised learning algorithm that uses ensemble methods (bagging) to solve both regression and classification problems. The algorithm operates by constructing a multitude of decision trees at training time and outputting the mean or mode of prediction of the individual trees.

![RFmodel.png](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/RFmodel.png)

RandomForest Regressor model was used with a thousand estimators and the model was trained. Once the training was complete, a comparison of actual housing prices and predicted housing prices was made in the form of dataframe and also as a plot. The comparison showed comparable actual and predicted values.

![RFdataframe.png](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/RFdataframe.png)

#### RF - Model evaluation
This model was evaluated similar to the MLR model. Parameters like MAE, MSE, and RMSE were calculated.<br/>
- MAE = 8.8
- MSE = 110.79
- RMSE = 10.53
Since values indicate better fit, Random Forest Regressor appears to be a better model so far.



### 3. Machine Learning Model -  Neural Network (NN)
In addition to the models discussed above, a neural network model was also tested for our problem. Neural networks work better at predictive analytics because of the hidden layers. Linear regression models use only input and output nodes to make predictions. The neural network also uses the hidden layer to make predictions more accurate. That’s because it ‘learns’ the way a human does.

However, they require massive amounts of computing power, so they are cost-prohibitive. In addition, neural networks work best when trained with extremely large data sets.<br/>
Our NN model used one hidden layer with 10 nodes and Relu activation function. The output layer used linear activation function with one node which will be prediced one real-value. The model was trained with 1,000 epochs.<br/>

We calculated loss function and MSE to evaluate the model performance. The results showed very high losses. The running time was also high for this model. Since we already know that our dataset is not very large, and due to other issues discussed before, we decided not to pursue further revisions of this model.

<img width="723" alt="NN_model" src="https://user-images.githubusercontent.com/92502292/162108370-c8d2efbe-dcb7-41b5-bd0b-1530564234f8.PNG">


### 4. Machine Learning Model Comparison and Model of Choice
As discussed in sections above, here are some important inferences:
- Performance metrics are better for RF. 
- NN model was not developed further due to time constraints and insufficient data.
- Since RF is a decision tree model, when compared to MLR, there is less chance of overfitting and greater accuracy expected. 
- However, when we compare model predictions from MLR and RF we see that the results are vastly different. This is due to the fact that decision trees work within the maximum and minimum values of the dataset and cannot make predictions beyond the range of values that the model has trained on. In other words, the RF model cannot extrapolate. 

Based on the above discussion our model of choice is Multiple Linear Regression and we will be using MLR model for predictions.
 


## Database
All of our original datasets were imported to a PostgreSQL server, visualized in the ERD below.  Our API call returned a slightly different number of locations each time it was ran, so ultimately we decided to merge the datasets with Python scripts rather than SQL.
![image](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/ERD.png)

## Dashboard 
Tableau is being to create an interactive dashboard to help visualize the relationship between housing prices and our variables.  Our dashboard contains a filter that allows users to limit the data by date and region. The story board includes a United States map visual that indicates region housing prices through bubble size, a data table that lists the housing prices and associated variables across different regions and line charts that show trending of the variables over time. In addition it easily allows users to analyze housing prices across states and cities within the United States. 

![image](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/Dashboard%201.png)

![image](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/Dashboard%202.png)

![image](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/Dashboard%203.png)

The full Tableau story can be found [here](https://public.tableau.com/app/profile/paula.thompson/viz/OutlierProject/Story1?publish=yes).

## Presentation
A PowerPoint Presentation summarizing our project can be found [here](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Final%20Presentation.pptx). 
