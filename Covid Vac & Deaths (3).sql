SELECT*
  FROM `my-portfolio-457721.My_First_Portfolio.CovidDeaths`
  WHERE continent IS NOT NULL
  order by 3,4;
SELECT*
  FROM `my-portfolio-457721.My_First_Portfolio.Covid Vaccinations`
   WHERE continent IS NOT NULL
  order by 3,4;

--SELECT DATA NEEDED FOR USAGE--

SELECT Location, date, aged_65_older,cardiovasc_death_rate,total_cases, population
FROM `my-portfolio-457721.My_First_Portfolio.CovidDeaths` 
 WHERE continent IS NOT NULL
order by 1,2;

--Calculating the Total_cases vs Cardiovasc_death_rate
SELECT Location, date, total_cases, cardiovasc_death_rate, (total_cases/cardiovasc_death_rate)*100 AS DeathPercentage --this shows the percentage of CardioVasc death rates divided by cases and changes a column name to be DeathPercentage
FROM `my-portfolio-457721.My_First_Portfolio.CovidDeaths` 
 WHERE continent IS NOT NULL
order by 1,2;

--Viewing the same information in Africa
SELECT Location, date, total_cases, cardiovasc_death_rate, (total_cases/cardiovasc_death_rate)*100 AS DeathPercentage --this shows the percentage of CardioVasc death rates divided by cases and changes a column name to be DeathPercentage but in Africa
FROM `my-portfolio-457721.My_First_Portfolio.CovidDeaths` 
WHERE location LIKE '%Africa%'
AND continent IS NOT NULL
order by 1,2 DESC;


--Showing the Total_cases vs Population
SELECT Location, date, total_cases, total_deaths,Population ,(total_cases/population)*100 AS DeathPercentage --this shows what percentage of population got covid
FROM `my-portfolio-457721.My_First_Portfolio.CovidDeaths` 
WHERE location LIKE '%Africa%'
order by 1,2;

--Displaying countries with high cardio death rates vs population
SELECT Location,population, MAX(cardiovasc_death_rate) AS HighCardioDeathCount, MAX((cardiovasc_death_rate/population))*100 AS PercentageCardioDeaths --Maximum amount of countries with high cardio deaths 
FROM `my-portfolio-457721.My_First_Portfolio.CovidDeaths` 
 WHERE continent IS NOT NULL 
Group by Location,Population,aged_65_older
order by aged_65_older DESC; 

--Shows countries with highest cardio death count per population with covid
SELECT continent,MAX(cast(Total_Deaths AS int)) AS TotalDeathCount, MAX(cast(cardiovasc_death_rate AS int)) AS CardioDeathRates
FROM `my-portfolio-457721.My_First_Portfolio.CovidDeaths` 
 WHERE Location LIKE '%Africa%' AND continent IS NOT NULL
Group by continent
order by TotalDeathCount desc;

--Global Numbers
--In Africa
SELECT SUM(new_cases) AS total_cases,SUM(cast(new_deaths AS int)) AS total_deaths, SUM(total_deaths)/SUM(new_cases) *100 AS DeathPercentage 
FROM `my-portfolio-457721.My_First_Portfolio.CovidDeaths` 
WHERE location LIKE '%Africa%' AND continent IS NOT NULL
--GROUP BY date
order by 1,2;

--Not in Africa
SELECT date, SUM(new_cases) AS total_cases,SUM(cast(new_deaths AS int)) AS total_deaths, SUM(total_deaths)/SUM(new_cases) *100 AS DeathPercentage 
FROM `my-portfolio-457721.My_First_Portfolio.CovidDeaths` 
WHERE continent IS NOT NULL
GROUP BY date
order by 1,2;

--Joining Covid Deaths table and Covid Vaccination table

SELECT *
FROM `my-portfolio-457721.My_First_Portfolio.CovidDeaths` Dea
JOIN `my-portfolio-457721.My_First_Portfolio.Covid Vaccinations` vac
ON Dea.location = vac. location
AND Dea.date = vac.date;

