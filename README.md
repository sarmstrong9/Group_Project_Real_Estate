# Group_Project_Real_Estate
Group Project for UCSD Data Science Bootcamp

## Topic - Analyzing Housing Market Data
Analyze real estate data to determine if migration trends and population growth/decline could predict housing price increases/declines.  Since we all live in California, we thought it would be interesting to analyze California specific housing market data. We quickly realized that finding good quality data is hard to come by. Upon looking for usable data, we were able to pull US real estate data directly from Redfin which we compared to population/migration data. At first we wanted to look at California to Texas migration since that seems to be a consistent talking point in housing cost, but ultimately decided to look at US data as a whole.

## Data Sources
Redfin - Housing Data (2012-2022)  
https://www.redfin.com/news/data-center/

Kaggle - US Migration Flows in 10 Years (2010-2019)
https://www.kaggle.com/datasets/finnegannguyen/statetostate-migration-flows-from-2010-to-2019?resource=download

## Group Responsibilities
- Python / Pandas - Team Effort  
- HTML / Javascript / CSS - Jadon  
- Tableau / Github Repo - Scott  
- R / Heroku- Brian  
- Database (SQL/AWS) / Machine Learning - Alberto  

## Results  
** Link to Webpage ***  

## Conclusions  
- Based on analyzing the datasets, we see that during this time scale, net population change does not have a strong correlation with housing prices.
- Initially we were looking at state to state migrations, but we realized we were missing the net population growth/decline of each state per year.  We knew that 100k people moved into a state and from where, but we did not know how many people moved out so the initial analysis was misleading.  This led us to calculate the "Net Population Change" for each state per year.
    - Moves from California to show interesting data, however without the net population change, this data wasnt very helpful to determine real estate prices at a State level.

## Limitations
- Data sets didnt fully overlap on timescale.  The main driver for this hypothesis was trying to determine correlation between population growth and housing prices in states where a lot of people moved during the COVID-19 pandemic.
- Had to create "net population change" so "lost" 2010 data as this was used as the baseline to measure from.

## Future Analysis
- Ratio of "Net Population Change" vs Average Median Home Price per state per year.  This could distill all these graphs into one metric and show any potential correlation/outliers
- Find additional datasets to cover population/migration during COVID-19
    - States like Idaho had extreme YoY prices increases during the pandemic, and it seems as though this could have been caused by the migration of people to states like this
- Bring in additional metrics such as job growth to determine additional correlation to housing prices in a region.


## Notes from Project:  

database used to aggregate data??
	call to it to look at that data
	clean in pandas, upload to database, then aggregate and pull out of database


7/5/2022
alberto analyzing machine learning
brian working with R and did some spreadsheet analysys
scott doing spreadsheet analysis and working through pandas and Tableau


recap july 5th:
we're in agreement to use the two datasets available. We're splitting up into analyzing trends or making predictions based on what topics we want to use.

Scott - Github repo owner/ Tableua, Brian - Rstudio, Alberto - Machine Learning.

Not sure what you want to work on, Jadon. Ryan recommended we start writing some notes on what we did each meeting so its easier to trace back our steps if need be.




recap July 7, 2022:   
Jadon will be working with cleaning up dataset & working with javascript. Alberto will drop unsupervised ML and start focusing on simple linear regression supervised ML. Scott will continue making visual graphs through Tableau.  Brian will focus on doing statistical analysis on the datasets including heat maps.
Jadon & Alberto will be collaborating to ensure datasets look collaborative for both users.

7/7/2022
comparison - state to state trends tableau / trend data



machine learning - linear regression for predicting prices in each state

tableau - heatmap of how many people leaving per state (dark red leaving - green positive) - animation per year

net change - per state - not just adds

where correlation happens - only use data that overlaps


Recap July 12th, 2022
Scott moving from Tableau to helping with Database creation. Also spent time with Github merging with help of TA’s.
Alberto has finished his machine learning. Has also made AWS database..
Brian is finalizing visuals from Rstudio, and moving on to helping Jadon with HTML.
Jadon is working on the website itself.
Everyone submit their portion of what they’ve done, and what conclusions they’ve made from their work for Jadon to upload for his HTML website. Also send their visuals/graphs for Jadon to upload onto the website. Mark which ones to upload..


Recap July 19th, 2022
Alberto will start focusing on other types of machine learning, potentially using unsupervised ML using Brian's correlation matrices as guidance.
Brian will start focusing on Flask app & Heroku. Potentially use Javascript (Low priority)
Jadon will start updating the webpage
Scott will working with Alberto's pgAdmin work
General:
we are in agreement to have updated Readme's on our own branches.
We will organize our branches to make the final merge to main branch smooth as possible.
Need to update the tabs on our website instead of using 'R', "Machine Learning", etc...




Jadon, refer to the word document on this branch for your website design. 
