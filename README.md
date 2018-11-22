# Zenith_DataAnalytics_Project
#This is the class project of Data Analytics

Project Title: Predicting Winner of the IPL Season based on the match-by-match analysis

# Data Description:

$$$ 1. deliveries.csv $$$

-----About the file-----
Ball by ball details for all matches for all seasons.

-----Columns-----
1. match_id
2. inning - 
Tells if the first set of batting was going on or second. 1: First Innings 2: Second Innings 
3. batting_team - 
The team name which is currently batting.
4. bowling_team -
The team name which is currently bowling.
5. over -
Describe the current over number.
6. ball -
Describe the current bowl no of the current over.
7. batsman -
Name of the batsman on striking end.
8. non_striker -
Name of the batsman on non-striking end.
9. bowler
10. is_super_over
11. wide_runs
12. bye_runs
13. legbye_runs
14. noball_runs
15. penalty_runs
16. batsman_runs
17. extra_runs
18. total_runs
19. player_dismissed
20. dismissal_kind
21. fielder

$$$ 2. matches.csv $$$

-----About the file-----
Details of each match 
-----Columns-----
1. id
2. season
3. city
4. date
5. team1
6. team2
7. toss_winner
8. toss_decision
9. result
10. dl_applied
11. winner
12. win_by_runs
13. win_by_wickets
14. player_of_match
15. venue
16. umpire1
17. umpire2
18. umpire3

Data Collection of Statistics is done by scraping the palyers profile from all each teams player statistics and merged to get the stats_batting_2.csv and stats_bowling_1.csv

The order of folders execution are creation was:
    1)Web Scraping
    2)Probability
    3)Clustering 
    4)Simulation

Visualisation folder has code for basic visualisation on matches.csv and deliveries.csv


We have implemented the KMeans Algorithm for predicting the cluster of batsman and bowler whose combination has never appeared before.

And we used some of the Concepts to solve problem,they are:
    1)MLE (Maximum Likelihood Estimator)
    2)probability of an event
    3)probability for multiple independent events
    4)Normal Distributiom
    5)Hypothesis
    6)WCSS(within-cluster sums of squares) elbow method  -- minimizing the WCSS (within-cluster sums of squares) will maximize the    distance between clusters.
    7)Kmeans algorithm
    
Result Analysis:
    We ran our simulation on 8 different matches it predicted the 6/8 correctly , and we also ran the simulation multiple times for the same match then also the average prediction was near to 75percent.
    
