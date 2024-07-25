drop table if exists population cascade;
drop table if exists dog_bite cascade;
drop table if exists dog_locations cascade;
drop table if exists dogs_data cascade;
drop table if exists breed_borough cascade;

select * from population

create table population (
	index_column INT,
	borough VARCHAR (500) primary key,
	total_population VARCHAR (500),
	pop_portion VARCHAR (500)

);

select * from Dog_Bite

create table Dog_Bite (
	index_column INT PRIMARY KEY,
	incident_date DATE,
	breed VARCHAR (200),
	age VARCHAR (200),
	gender VARCHAR (200),
	spay_neuter_status VARCHAR (200),
	borough VARCHAR (200),
	zip_code VARCHAR (200),
	foreign key (borough) references population (borough)
);

select * from dogs_data

create table dogs_data (
	index_column INT,
	incident_date DATE,
	breed VARCHAR (200),
	age INT,
	gender VARCHAR (200),
	spay_neuter_status VARCHAR (200),
	foreign key (index_column) references dog_bite (index_column)
);

select * from dog_locations

create table dog_locations (
	index_column INT,
	incident_date DATE,
	borough VARCHAR (200),
	zip_code VARCHAR (200),
	foreign key (index_column) references dog_bite (index_column),
	foreign key (borough) references population (borough)
);

select * from breed_borough

create table breed_borough (
	index_column INT,
	incident_date DATE,
	breed VARCHAR (200),
	borough VARCHAR (200),
	foreign key (index_column) references dog_bite (index_column),
	foreign key (borough) references population (borough)
);



-- QUERY to analyze dog bite data

-- 1. Count of how many incidences in each borough and by year.

SELECT *
FROM incidents_by_year_borough
where year = 2015

create table incidents_by_year_borough as
select extract (year from incident_date) as year, borough, Count (*) As IncidentCount
from dog_locations
group by year, borough
order by year, borough;


-- 2. Count of breeds and and incidences by breed.

select breed_borough.breed, count(*) as incident_count
from breed_borough
group by breed_borough.breed
order by incident_count desc;


-- 3. Population percentage vs. number of incidences and breed.

select b.borough, pop.pop_portion as population_percent, b.breed, b.breed_count from
(select borough, breed, count(breed) as breed_count from breed_borough
	group by borough, breed
	order by borough asc) as b join population as pop on pop.borough=b.borough;

-- 4. Popularity of breed in each borough.

select distinct breed_borough.borough as borough
from breed_borough;

create view brooklyn as
select breed_borough.breed, COUNT(*) as breed_count
from breed_borough
where breed_borough.borough = 'Brooklyn'
group by breed_borough.breed
order by breed_count desc
limit 10;

create view queens as
select breed_borough.breed, COUNT(*) as breed_count
from breed_borough
where breed_borough.borough = 'Queens'
group by breed_borough.breed
order by breed_count desc
limit 10;

create view staten_island as
select breed_borough.breed, COUNT(*) as breed_count
from breed_borough
where breed_borough.borough = 'Staten Island'
group by breed_borough.breed
order by breed_count desc
limit 10;

create view bronx as
select breed_borough.breed, COUNT(*) as breed_count
from breed_borough
where breed_borough.borough = 'Bronx'
group by breed_borough.breed
order by breed_count desc
limit 10;

create view manhattan as
select breed_borough.breed, COUNT(*) as breed_count
from breed_borough
where breed_borough.borough = 'Manhattan'
group by breed_borough.breed
order by breed_count desc
limit 10;



create table breed_year_borough as
WITH ranked_breeds AS (
    SELECT 
        EXTRACT(YEAR FROM incident_date) AS year,
        borough,
        breed,
        ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM incident_date), borough ORDER BY COUNT(*) DESC) AS breed_rank
    FROM breed_borough
    GROUP BY EXTRACT(YEAR FROM incident_date), borough, breed
)
SELECT year, borough, breed
FROM ranked_breeds
WHERE breed_rank <= 3
ORDER BY year, borough, breed_rank;


select * from breed_year_borough


