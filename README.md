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
- R - Brian  
- Database (SQL/AWS) / Machine Learning - Alberto  

## Final Presentation
https://sarmstrong9.github.io/Group_Project_Real_Estate/Webpage/index.html  

## Conclusions  
- After analyzing our data through visual, statistical, and predictive analysis we found that there is not a strong correlation between US migration and the price of housing. This disproves the theory that population change is a leading factor in increases in the housing market. Although we did not see much causation in our analysis, we are still curious to learn more about what is causing housing market increases.


## Limitations
- Data sets didnt fully overlap on timescale.  The main driver for this hypothesis was trying to determine correlation between population growth and housing prices in states where a lot of people moved during the COVID-19 pandemic.
- Initially we were looking at state to state migrations, but we realized we were missing the net population growth/decline of each state per year.  We knew that 100k people moved into a state and from where, but we did not know how many people moved out so the initial analysis was misleading.  This led us to calculate the "Net Population Change" for each state per year.
    - Moves from California to show interesting data, however without the net population change, this data wasnt very helpful to determine real estate prices at a State level.
- Had to create "net population change" so "lost" 2010 data as this was used as the baseline to measure from.

## Future Analysis
- Ratio of "Net Population Change" vs Average Median Home Price per state per year.  This could distill all these graphs into one metric and show any potential correlation/outliers
- Find additional datasets to cover population/migration during COVID-19
    - States like Idaho had extreme YoY prices increases during the pandemic, and it seems as though this could have been caused by the migration of people to states like this
- Bring in additional metrics such as job growth and number of people who are searching for a home (as opposed to just the overall population which would include non-home buying age groups) to determine additional correlation to housing prices in a region.