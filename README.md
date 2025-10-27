# Data Analytics for Forex Trading Strategy 

## Introduction  
This is the shared findings from a year-long forex trading journey and data analysis, which was initiated to rigorously test the profitability of popular Smart Money Concepts (SMC) and ICT trading ideas by collecting granular trade data. The core of this study centered on a custom-devised strategy, BNTP (Bias, Narrative, Time, Price), implemented on the GBPUSD pair from mid-2024 to mid-2025. The framework required collecting all parameters for 102 trades, which were subsequently prepared for analysis using **SQL**, **Python** and **Power BI**. The BNTP method relies on four key components: Bias (speculating daily direction), Narrative (using price action to anticipate expansion), Time (trading the high-liquidity 12:00 to 16:00 UTC window), and Price (aiming for optimal buy/sell execution).

The overall performance of the BNTP strategy yielded an expected mix of wins and losses, which is typical for initial development years. Crucially, a deeper analysis revealed that specific combinations of the BNTP parameters yielded attractive, profitable outcomes. This finding validates the strategy’s underlying potential and confirms that with focused fine-tuning, the system can be optimized to significantly improve its profit profile.


## Skills Employed

- **Structured Query Language (SQL)**  
> ***Database Development:*** Designed the conceptual and physical components of the database for collection of trade data in MySQL Database Management System.  

> ***Data Import:*** script a piece of query for importing the data from a csv file into the database.

> ***Constraint Checks:*** handled contraints using queries to accommodate for successful import of the data and prevention of future errors when data has to be imported in the database.


- **Python Programming**  
> ***ETL:*** Extracted the forex data into VSCode IDE using python by building a database connection. Then Transformed the data into an analysis-ready form, later loaded into Power BI for creating dashboard of findings.

> ***Data Preparation:*** Performed data cleaning and feature engineering using python packages such as pandas, numpy, datetime and scipy.

> ***Exploratory Data Analysis:*** Performed comprehension univariate and bivariate descriptive analysis on the data to dig into the past performance of the strategy in  the GBPUSD (cable/GU) market over the past year. Calculated **Key Metrics** that best measure the performance of the strategy in terms of profitability and reliability.   
Wrote high quality python functions adhering to PEP 8 guidelines for code reusability. 
Employed python packages such as scipy, matplotlib and seaborn for advance metric calculations and visualizations.

- **Microsoft Power BI**  
> ***ETL:*** Loaded the prepared data for creating dashboard.

> ***Power Query:*** was used for further preparation of the data to suit the Power BI environment.

> ***Measures:*** Formulated **Implicit and Explicit** measures to derive key metrics that provided direct insight into the past performance of the strategy.

> ***Metric Indicators:*** Used **Cards** to display key metrics, easily visible for instant insight provision.

> ***Dashboard Design:*** Developed an intuitive and visually appealing layout, exploring **chart types** to better convey the story of the past the data is telling.


## Dashboard Overview  
<img width="1301" height="799" alt="Screenshot 2025-10-27 141121" src="https://github.com/user-attachments/assets/072d0e89-58a5-4ac5-8ef3-15927ec61123" />

This dashboard shows the key metrics employed to measure the past performance of the strategy over factors such as Month and the amount risked per trade in US Dollars. It shows the size of a trade outcome, whether a win or a loss in terms of median winning and losing dollar amounts, and number of trades.   

It display the proportion of trades that had a trailing stop and the proportion that did not. And it displays the **Equity Curve** of the trading balance over the one year period the strategy was implemented in the forex market.  

The median stop loss and take profit set per trading day in terms of pips, is also displayed to easily discern the risk to reward ratio taken over the course of the trading period.
Finally the median win and loss for core variables implemented in the strategy are available for easy discernment.


## Conclusion  
This dashboard showcases how the **BNTP strategy** performed over the one year period, over which **102 trades** were executed.  
With a **Net Profit** in the negative, large negative **Sortino Ratio** and a less than 1 **Profit Factor** it is clear the strategy lost money, mostly due to a significantly less trades of 13% having trailing stops to lock in profits.  

Also typical wins of $34.57 dollars was not able to cover a loss of -$20 given a very low win rate of 29%.
