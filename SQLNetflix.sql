
Select *
from Netflix..[Netflix Data]

--Top 10 Movies with highest Movie Rating

Select Top 10 Title, avg(Imdb_score)as avg_imdb_Rating
from Netflix..[Netflix Data]
Group by Title
order by avg_imdb_Rating Desc

--Total No of Movies Belong to each genre

Select genre,Count(*)as movie_Count
From Netflix..[Netflix Data]
Group by Genre 
Order by movie_Count Desc

--Rank the movies&Series on the Basis of their IMDB rating

Select Title,Imdb_score,Rank() Over (Order by Imdb_score Desc) as Rnk
from Netflix..[Netflix Data]

--Find the rating of Movies that belongs to multiple genre

Select Genre,avg(Imdb_score)as avg_imdb_Rating
from Netflix..[Netflix Data]
Group by Genre
Order by avg_imdb_Rating Desc

--Genre according to Age Certification

Select 
Case
    when age_certification<='PG'THEN 'Children'
    when age_certification<='PG-13'THEN 'Teen'
    when age_certification in ('R','TV-MA')THEN'Children'
Else 'Unknown'
End as Age_category,Genre
From Netflix..[Netflix Data]
group by Age_certification,Genre

--2nd Highest Movie Made in 2022

Select Title,Imdb_score
From Netflix..[Netflix Data]
Where RELEASE_YEAR=2022 and IMDB_SCORE=(Select Max(Imdb_score)
From Netflix..[Netflix Data]
where RELEASE_YEAR=2022 and IMDB_SCORE<(Select Max(Imdb_score)
From Netflix..[Netflix Data]
Where RELEASE_YEAR=2022
)
)



