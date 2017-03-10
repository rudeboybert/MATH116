#Project Proposal 

#1---Title: Is there a gender bias for lead roles in popular movies? 
#2---Group Members: Tina Chen, Sierra Moen, Jared Whitman
#2.5---Group Name: R-squared
#3---Purpose: We want to explore the gender dynamics of major box office movies over time.
            'By analyzing the variations of male/female leads over the past 16 years, we hope
            to unlock connections between gender and the film industry.
            Middlebury students have already shown a deep interest in this topic, 
            with a popular Feminist and Gender Studies Major and groups such as Feminist 
            Action at Middlebury (FAM) facilitating an ongoing discourse about gender equality.
            We hope to learn whether or not popular movies are biased towards male or female leads.
            
            
4---Scientific Question: 

Has the trend of female leads versus male leads in major motion pictures changed over time? 


5---Data Sources: 

http://minimaxir.com/2016/04/movie-gender/
dataset is from https://docs.google.com/spreadsheets/d/1UMV-6yCjHBveyOcZwiilEm2DWRMjdzAbgdHutcjCn-E/edit#gid=763112547
This data was determined by Movies with at least $10 million in 
inflation-adjusted domestic box office revenue and Movies which were 
released in 2000 or later. 

6---Data Format: As described in the Tips section of the 
Problem Set 06 discussion, describe what your tidy format 
data set looks like:

library(dplyr)
tidy_movie_data <- select(Movie.Data.Set_Max.Woolf, Year, Gender, AdjBoxOffice)
View(tidy_movie_data)
How many tables will you have? 

1 data table

What are the observational units of each table?

Each row will display the year a film was produced, the gender of lead role, and the
revenue it generated.

How many rows does each table have?
2,020 rows

How many columns does each table have and what are their 
names i.e. the variables? What are their units?

Three Columns

1. "Year" (year film was produced) Catergorical Variable
2. "Gender" (gender of film lead) Catergorical Variable
3. "AdjBoxOffice" (gross income of the film, included for a potentially 
                    more detailed analysis) Quantatative Variable'





