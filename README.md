# Final Project Outliers

### Project Overview
This project will use a supervised machine learning model to predict housing prices across various regions based on inflation rates.

In the last month we have a 40-year high in inflation rates. Our group is interested in understanding the impact these aggressive increases will have on housing prices across our various locations.

### Project Question
Can we predict housing prices across various regions in the United States using consumer price index, fuel rates, interest rates, unemployment rates, mortgage data, and other variables through a machine learning model? 

### Project Outline

![image](https://user-images.githubusercontent.com/91712554/160052377-8fbe0ddc-3ca1-44f3-81ab-e82281392d9b.png)


### Description of Data Source 
 * [Unemployment Rates](https://data.oecd.org/unemp/unemployment-rate.htm) - Rates for the United States, filtered between 2011 to 2022. 
 * [Housing Price Dataset](https://www.kaggle.com/paultimothymooney/zillow-house-price-data?select=Sale_Prices_City.csv) - Contains information on housing prices across multiple regions in the United States. 
 * [Gas Prices](https://www.eia.gov/dnav/pet/hist/LeafHandler.ashx?n=PET&s=EMD_EPD2D_PTE_R50_DPG&f=W)
 * [Consumer Price Index Dataset](https://fred.stlouisfed.org/series/CPIAUCNS) - Contains information on the consumer price index between 1913 to 2022.
 * [Mortgage Data](https://www.fhfa.gov/DataTools/Downloads/Pages/National-Mortgage-Database-Aggregate-Data.aspx) - Monthly mortgage data in the United States on a monthly basis. 
 * [Interest Rates](https://fred.stlouisfed.org/series/FEDFUNDS) - Interest Rates starting in 1955

We will combine these datasets together to create one comprehensive view that can be used for the remainder of this analysis.

### Data Exploration 
Our team started this project with only two data sources, [housing prices](https://www.kaggle.com/paultimothymooney/zillow-house-price-data?select=Sale_Prices_City.csv) and [consumer price index](https://fred.stlouisfed.org/series/CPIAUCNS). These data sources were cleaned by dropping null values, limiting the data range and dropping unnecessary columns. Following our initial analysis, it was determine that additional variables needed to be added in order for our machine learning model to be of real value. We then considered additional variables that could be added. Ultimately we added [gas prices](https://www.eia.gov/dnav/pet/hist/LeafHandler.ashx?n=PET&s=EMD_EPD2D_PTE_R50_DPG&f=W),  [unemployment rates](https://data.oecd.org/unemp/unemployment-rate.htm), and [data on mortgage payments](https://www.fhfa.gov/DataTools/Downloads/Pages/National-Mortgage-Database-Aggregate-Data.aspx). All of this data was filtered to be specific to the United States and limited to years between 2011 and 2022. We also determined the need to include zip code and latitude / longitude. This was a proactive approach to ensure we had all the information we need to create meaningful visualizations that would easily display discrepancies across the various regions within the United States. 


### Machine Learning Model
#### Data Preprocessing
We followed the following steps to accomplish data pre-processing:
 * Import the libraries
 * Import the dataset
 * Check the missing values
 * Splitting the dataset into training and testing set
 * Feature scaling: method used to normalize the range of independent variables or features of data. When the values vary a lot in an independent variable, we use feature scaling so that all the values remain in the comparable range. The variations in our dataset can be minimized simply by dividing the house prices by 1000.

  #### Feature Engineering and Feature Selection

 Feature engineering is a process of extracting useful features from raw data using math, statistics and domain knowledge. For our project we started the process of feature engineering early on by detecting missing values and removing them from the dataset. Additionally during preprocessing, we added zip codes as a feature to our dataset by matching each region ID against the respective zip codes

 In order to do a preliminary feature selection we checked the linear relationships that exists between the dependent and independent variable. Based on the output we determined there was not a linear relationship between housing prices and mortgage rates. Therefore, we dropped the mortgage rates from our dataset. 
 
![Machine Learning Charts](https://user-images.githubusercontent.com/91712554/160052560-38988a82-ceac-410f-9708-05174fbd972a.png)


 #### Split the data into trainig and testing sets
 Python Scikitlearn's train_test_split function was used to split our data into training and testing sets for model performance evaluation. This is done by importing train_test_split from sklearn.model_selection. By default this function allots 25% of the dataset as the testing set.

 #### Model of Choice
 Our problem statement involves predicting housing values. This problem can be solved by using a regression model. Multiple Linear Regression (MLR) is one of the important regression algorithms which models the linear relationship between a single dependent continuous variable and more than one independent variables. Multiple regressions are based on the assumption that there is a linear relationship between both the dependent and independent variables. It also assumes no major correlation between the independent variables.
 
#### Advantages and Disadvantages 
 There are two main advantages to analyzing data using a multiple regression model. The first is the ability to determine the relative influence of one or more predictor variables to the criterion value. The second advantage is the ability to identify outliers, or anomalies.

 Any disadvantage of using a multiple regression model usually comes down to the data being used. Two examples of this are using incomplete data and falsely concluding that a correlation is a causation.

### Database

![image](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Images/ERD.png)

### Dashboard 
Tableau is being to create an interactive dashboard to help visualize the relationship between housing prices and our variables.  Our dashboard contains a filter that allows users to limit the data by date and region. The story board will include a United State map visual that indicates region housing prices through bubble size, a data table that lists the housing prices and associated variables across different regions and line charts that show trending of the variables over time. In addition it easily allows users to analyze housing prices across states and cities within the United States. 

The Tableau story can be found [here](https://public.tableau.com/app/profile/paula.thompson/viz/OutlierProject/Story1?publish=yes).

### Presentation
A PowerPoint Presentation summarizing our project can be found [here](https://github.com/pbthompson92/Final_Project_Outliers/blob/main/Final%20Presentation.pptx). 

### Communication Protocols 
Below you can see a list of our team's communication protocols. 

 * All meeting times we will be set assuming PST time zone
 * Primary communication method is group slack chat
 * Backup communication method is group text messages
 * All team members commit to meet from 7pm to 9pm on Tuesday and Thursday until the project is complete
 * The team will set up additional meetings as needed during the week and on the weekend as needed 
 * Every time someone merges a branch in GitHub a message will be sent to the group slack so everyone has visibility 
 * Refer to GitHub best practices document for additional guidance to ensure consistency on GitHub use