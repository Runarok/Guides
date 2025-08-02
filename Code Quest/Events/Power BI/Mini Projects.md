# Power BI Mini Projects

A collection of 5 mini projects showcasing different Power BI skills and dashboards.

## Table of Contents
- [Project 1: Sales Analytics Dashboard](#project-1-sales-analytics-dashboard)
- [Project 2: Insurance Company’s Dashboard](#project-2-insurance-companys-dashboard)
- [Project 3: Google Stock Price Analysis](#project-3-google-stock-price-analysis)
- [Project 4: Netflix Movies and Shows](#project-4-netflix-movies-and-shows)
- [Project 5: ICC T20 World Cup Analysis (2007-2021)](#project-5-icc-t20-world-cup-analysis-2007-2021)

---

## Project 1: Sales Analytics Dashboard

### Description
This project focuses on building a Power BI dashboard to analyze the sales dataset of a company, providing a comprehensive view of key metrics and trends. By harnessing the power of data visualization, the dashboard aims to empower decision-makers to gain actionable insights, optimize sales strategies, and enhance overall business performance.

### Problem Statement
The company faces challenges in effectively analyzing and interpreting its sales data, resulting in potential inefficiencies in decision-making and sales strategies. There is a need to consolidate and visualize critical information related to orders, shipping, customers, and product details to identify patterns, optimize processes, and ultimately improve sales performance. The goal is to address these challenges through the development of an insightful Power BI dashboard.

### Objective
The primary objective of this project is to create a dynamic and interactive Power BI dashboard that enables stakeholders to:
1. Gain Overview: Obtain a quick overview of key sales metrics, such as total sales, average unit price, and total unit cost.
2. Analyze Sales Trends: Visualize sales trends over time using line charts or time series visuals to identify peak sales periods and potential seasonality.
3. Customer Insights: Explore customer-related metrics, such as the number of orders per customer and total sales per customer, to identify high-value customers.
4. Channel Analysis: Analyze sales performance across different channels (e.g., online, offline) to identify the most effective sales channels.
5. Currency Impact: Understand the impact of currency fluctuations on sales by visualizing sales data in different currencies.
6. Warehouse Efficiency: Evaluate warehouse performance by analyzing order fulfillment times, shipping delays, and overall order processing efficiency.
7. Product Performance: Assess the performance of individual products through visuals such as bar charts or heatmaps, identifying top-selling products and potential inventory management opportunities.
8. Cost and Profitability: Visualize the relationship between unit price, total unit cost, and profit margins to optimize pricing strategies.
9. Regional Analysis: Explore sales patterns across different delivery regions to tailor marketing and sales efforts based on regional demand.

### Data Fields
- Order Number
- Order Date
- Shipping Date
- Customer Name Index
- Channel
- Currency Code
- Warehouse Code
- Delivery Region Index
- Product Description Index
- Product Quantity
- Unit Price
- Total Unit Cost

### Dataset  
[![Sales Dataset](https://img.shields.io/badge/Google_Drive-Sales%20Dataset-4285F4?style=for-the-badge&logo=google-drive&logoColor=white)](https://docs.google.com/spreadsheets/d/1vj_DSY2BWLwazhNU_62xl0CT3z1_RM0B/edit?usp=drive_link&ouid=106071436383892307069&rtpof=true&sd=true)

[Back to Table of Contents](#table-of-contents)

[![Click Me](https://img.shields.io/badge/Click%20Me-blue?style=for-the-badge)](https://example.com)

---

## Project 2: Insurance Company’s Dashboard

### Objective
Develop a Power BI dashboard to compare income, life insurance share, market share, penetration, reinsurance ratio, and retention ratio across various countries. The objective is to facilitate data-driven decision-making for the company's global expansion.

### Datasets
- Primary Dataset: Insurance Sample Dataset  
- Secondary Dataset: Global Financial Development Database  
- Data Integration: Utilize Power BI's data modeling features to combine information from both datasets.

### Steps to Perform
1. **Geographic Map:**  
   - Use the Power BI map visual to display countries.  
   - Color the map based on the income column from the secondary dataset.  
   - Include an income group filter in the dashboard for enhanced interactivity.

2. **KPI Table:**  
   - Create two parameters for Year Selection and Category Selection using Power BI's parameter feature.  
   - Define the Category parameter to include life insurance share, market share, penetration, reinsurance ratio, and retention ratio.  
   - Develop a calculated column or measure to compute the Growth %.  
   - Create a table displaying these values with a dynamic title based on the selected category.

3. **Growth Indicator Shapes:**  
   - Generate Growth Indicator Shapes based on the calculated Growth % using Power BI shapes or conditional formatting.  
   - Display Negative, No Change, and Positive as values along with corresponding shapes for easy interpretation.

4. **Trend Line:**  
   - Construct a trend line showcasing selected category values using Power BI line charts.  
   - Enhance the trend line by incorporating arrows or triangles at the last data point for visual emphasis.

5. **Dashboard Filter:**  
   - Implement a dashboard filter for the income group using Power BI's filter options.  
   - Ensure that the filter is applied across all relevant visuals for consistent and synchronized data exploration.

6. **Formatting:**  
   - Apply appropriate formatting for a polished and professional appearance using Power BI's formatting options.  
   - Ensure consistency in colors, fonts, and layouts for a cohesive visual experience.

### Dataset  
[![Insurance Dataset](https://img.shields.io/badge/Google_Drive-Insurance%20Dataset-4285F4?style=for-the-badge&logo=google-drive&logoColor=white)](https://drive.google.com/drive/folders/1aut4O2py6NOnN6pdEVUYpMiaB0_KMer7?usp=sharing)

[Back to Table of Contents](#table-of-contents)

---

## Project 3: Google Stock Price Analysis

### Google Stock Overview
Alphabet Inc. serves as the parent entity for Google, having undergone corporate restructuring in 2015. The company issues two types of stock, namely Class A and Class C, each with distinct voting rights compared to Class B shares. Notably, insiders predominantly hold Class B shares, endowed with higher voting influence. The trading symbols for Alphabet's Class C and Class A shares are "GOOG" and "GOOGL," respectively. Google is a significant constituent in major stock market indices such as the S&P 500 and NASDAQ-100, functioning as benchmarks for overall market performance assessment.

As a data analyst, your goal is to gain a comprehensive understanding of Google's stock performance and make informed decisions based on historical trends and current market dynamics.

### Dataset Information
The provided dataset encapsulates Google's stock price dynamics from its public debut on 19th August 2004 to 10th November 2023, encompassing details across 4842 trading sessions. Seven distinct elements, each represented by a corresponding column, furnish insights into the trading activity and performance of the stock over this extensive period. A concise overview of these elements is as follows:

| Column      | Description                                                                                      |
|-------------|------------------------------------------------------------------------------------------------|
| Date        | Records the calendar date when stock-related data is documented.                                |
| Open        | Represents the initial recorded price of the stock for a given trading session.                 |
| High        | Indicates the highest traded price of the stock during a specific trading session.              |
| Low         | Denotes the lowest traded price of the stock within a specific trading session.                  |
| Close       | Reflects the closing price, marking the last traded value of the stock at the session's conclusion. |
| Adj Close   | Adjusted closing price accommodates corporate actions like dividends and stock splits.          |
| Volume      | Represents the total shares traded during a defined time period, serving as an indicator of market activity and liquidity. |

### Objectives
1. **Price Trends Over Time:** Visually represent how the Open, High, Low, and Close prices fluctuate over the dataset timeline.  
2. **Volatility Analysis:** Showcase the range between High and Low prices, providing insights into stock volatility.  
3. **Volume Activity:** Illustrate the variations in trading volume over different periods, aiding in identifying market interest.  
4. **Moving Averages:** Implement moving average calculations to smooth out price fluctuations, aiding in trend identification.  
5. **Comparative Analysis:** Assess how Google's stock performance aligns with market indices like S&P 500 and NASDAQ-100.

### Dataset  
[![Google Stock Price Dataset](https://img.shields.io/badge/Google_Drive-Google%20Stock%20Price-4285F4?style=for-the-badge&logo=google-drive&logoColor=white)](https://drive.google.com/file/d/1OCaBhJKOkjHGigUnPhUIwavfJMs3EV0L/view?usp=drive_link)

[Back to Table of Contents](#table-of-contents)

---

## Project 4: Netflix Movies and Shows

### Dataset Overview
This dataset provides a comprehensive snapshot of the movies and shows available on Netflix, offering a wealth of information to understand content trends, popularity, and various significant aspects. It is a valuable resource for exploring entertainment trends, discerning preferences across different age groups, and conducting comparative analyses of genres and production locations.

As a Data Analyst at Netflix, your task is to create a Power BI dashboard that helps Netflix gain important data-driven insights to inform future strategies.

### Features
- **title:** The name of the movie or show, an essential identifier.  
- **type:** Distinguishes between a movie and a show, indicating the format of the content.  
- **release_year:** The year the content was released, providing a temporal context.  
- **age_certification:** Indicates the age suitability rating, important for audience targeting.  
- **runtime:** Duration of the movie or show in minutes, reflecting content length.  
- **genres:** Categories of the content, such as comedy, drama, or horror, crucial for understanding its theme.  
- **production_countries:** The countries where the content was produced, highlighting geographical influences.  
- **seasons:** Number of seasons (applicable for shows), indicating the extent of the content.  
- **imdb_id:** A unique identifier for each title on IMDb, useful for cross-referencing.  
- **imdb_score:** The IMDb rating of the content, reflecting its popularity and quality.  
- **imdb_votes:** The number of votes the content received on IMDb, indicating viewer engagement and popularity.

### Use Case
1. **Trend Analysis in Entertainment:** Identify evolving patterns and trends in the Netflix content library.  
2. **Predictive Modeling for Viewer Preferences:** Leverage features like genres, IMDb ratings, and release years to build predictive models for anticipating viewer preferences.  
3. **Comparative Studies of Genres and Release Years:** Conduct detailed analyses to compare the success and popularity of different genres and content released in various years.  
4. **Audience Targeting:** Use age certification information to tailor content recommendations and targeting for specific age groups.  
5. **Viewer Engagement Assessment:** Analyze IMDb votes and scores to evaluate viewer engagement and the perceived quality of content.

### Dataset  
[![Netflix Movies and Shows Dataset](https://img.shields.io/badge/Google_Drive-Netflix%20Movies%20and%20Shows-4285F4?style=for-the-badge&logo=google-drive&logoColor=white)](https://drive.google.com/file/d/1e-JWeapMYl6nQxWLwam_1ktRHw8VqNxb/view?usp=sharing)

[Back to Table of Contents](#table-of-contents)

---

## Project 5: ICC T20 World Cup Analysis (2007-2021)

### Description
Suppose you are a Cricket Data Analyst. This dataset provides a comprehensive collection of statistics from previous tournaments held between 2007 and 2021. The dataset comprises seven distinct files, each corresponding to a specific edition of the T20 World Cup.

| Column               | Description                                          |
|----------------------|------------------------------------------------------|
| Match No             | An index column telling the match number.            |
| Date                 | The date on which the match was played.              |
| Group/Semi Final/Final | Indicates if the match was a group stage, semi-final, or final. |
| Match Between        | The two opponents the match was played between.      |
| Venue                | The venue of the match.                               |
| Winning Team Score   | The score of the team that won the match.            |
| Losing Team Score    | The score of the team that lost the match.           |
| Winner Team          | The name of the winning team.                         |
| Result               | The final result of the match.                        |
| Player of the Match  | Player awarded the "Player of the Match".            |

### Use Case
1. **Team Performance Over Time:** Showcase the performance of specific teams across different editions. Compare win-loss ratios, runs scored, and wickets taken over the years.  
2. **Tournament Overview:** Utilize summary cards to display total matches played, total runs scored, and total wickets taken. Create a timeline visualizing the growth of the tournament with each edition.  
3. **Venue Analysis:** Plot maps or charts to showcase the distribution of matches across different venues. Highlight venues with the most matches or those associated with significant events.  
4. **Performance Metrics:** Implement bar charts to compare average scores, average wickets, and average run rates. Explore trends in team performance based on different metrics.  
5. **Player of the Match Insights:** Create a list or visual highlighting players with the most "Player of the Match" awards. Explore the correlation between player performance and overall team success.

### Dataset  
[![ICC T20 World Cup Analysis Dataset](https://img.shields.io/badge/Google_Drive-ICC%20T20%20World%20Cup-4285F4?style=for-the-badge&logo=google-drive&logoColor=white)](https://drive.google.com/drive/folders/1PjhjUlmq4t7xZtV5M58FUAdjrQSS8JhM?usp=drive_link)

[Back to Table of Contents](#table-of-contents)

---

*End of Projects*

[Community credited](https://community.fabric.microsoft.com/t5/Themes-Gallery/Solar-PV-Generation-amp-Performance-Index/td-p/4705919)
