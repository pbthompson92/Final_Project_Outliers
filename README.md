# Final Project Outliers

### Project Overview
This project will use a supervised machine learning model to predict housing prices across various regions based on inflation rates.

In the last month we have a 40-year high in inflation rates. Our group is interested in understanding the impact these aggressive increases will have on housing prices across our various locations.

### Project Question
Can we predict housing prices across various regions in the United States using consumer price index, fuel rates, interest rates, unemployment rates, mortgage data, and other variables through a machine learning model? 

### Project Outline
SCREEENSHOT PLACEHOLDER

### Description of Data Source 
 * [Unemployment Rates](https://data.oecd.org/unemp/unemployment-rate.htm) - Rates for the United States, filtered between 2011 to 2022. 
 * [Housing Price Dataset](https://www.kaggle.com/paultimothymooney/zillow-house-price-data?select=Sale_Prices_City.csv) - Contains information on housing prices across multiple regions in the United States. 
 * [Gas Prices](https://www.eia.gov/dnav/pet/hist/LeafHandler.ashx?n=PET&s=EMD_EPD2D_PTE_R50_DPG&f=W)
 * [Consumer Price Index Dataset](https://fred.stlouisfed.org/series/CPIAUCNS) - Contains information on the consumer price index between 1913 to 2022.
 * [Mortgage Data](https://www.fhfa.gov/DataTools/Downloads/Pages/National-Mortgage-Database-Aggregate-Data.aspx) - Monthly mortgage data in the United States on a monthly basis. 

We will combine these datasets together to create one comprehensive view that can be used for the remainder of this analysis.

### Data Exploration 
Our team started this project with only two data sources, [housing prices](https://www.kaggle.com/paultimothymooney/zillow-house-price-data?select=Sale_Prices_City.csv) and [consumer price index](https://fred.stlouisfed.org/series/CPIAUCNS). These data sources were cleaned by dropping null values, limiting the data range and dropping unnecessary columns. Following our initial analysis, it was determine that additional variables needed to be added in order for our machine learning model to be of real value. We then considered additional variables that could be added. Ultimately we added [gas prices](https://www.eia.gov/dnav/pet/hist/LeafHandler.ashx?n=PET&s=EMD_EPD2D_PTE_R50_DPG&f=W),  [unemployment rates](https://data.oecd.org/unemp/unemployment-rate.htm), and [data on mortgage payments](https://www.fhfa.gov/DataTools/Downloads/Pages/National-Mortgage-Database-Aggregate-Data.aspx). All of this data was filtered to be specific to the United States and limited to years between 2011 and 2022. We also determined the need to include zip code and latitude / longitude. This was a proactive approach to ensure we had all the information we need to create meaningful visualizations that would easily display discrepancies across the various regions within the United States. 


### Machine Learning Model 
 * Description of preliminary data preprocessing
 * Description of preliminary feature engineering, feature selection (including decision making process)
 * Description of how data was split into training and testing sets 
 * Explanation of model choice, including limitations and benefits 

### Database
 * ERD with Relationships 

### Dashboard 
Tableau will be used to create an interactive dashboard to help visualize the relationship between housing prices and our variables.  Our dashboard will contain a filter that allows users to limit the data by date and region. The story board will include a United State map visual that indicates region housing prices through a heatmap or bubble size, a data table that lists the housing prices and associated variables across different regions and line charts that show trending of the variables over time. 

### Communication Protocols 
Below you can see a list of our team's communication protocols. 

 * All meeting times we will be set assuming PST time zone
 * Primary communication method is group slack chat
 * Backup communication method is group text messages
 * All team members commit to meet from 7pm to 9pm on Tuesday and Thursday until the project is complete
 * The team will set up additional meetings as needed during the week and on the weekend as needed 
 * Every time someone merges a branch in GitHub a message will be sent to the group slack so everyone has visibility 
 * Refer to GitHub best practices document for additional guidance to ensure consistency on GitHub use  