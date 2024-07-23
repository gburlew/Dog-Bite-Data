drop table if exists population cascade;
drop table if exists dog_bite cascade;
drop table if exists dog_locations cascade;
drop table if exists dogs_data cascade;
drop table if exists breed_borough cascade;


create table population (
	index_column INT,
	borough VARCHAR (500) primary key,
	total_population VARCHAR (500),
	pop_portion VARCHAR (500)

);

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

create table dogs_data (
	index_column INT,
	incident_date DATE,
	breed VARCHAR (200),
	age INT,
	gender VARCHAR (200),
	spay_neuter_status VARCHAR (200),
	foreign key (index_column) references dog_bite (index_column)
);

create table dog_locations (
	index_column INT,
	incident_date DATE,
	borough VARCHAR (200),
	zip_code VARCHAR (200),
	foreign key (index_column) references dog_bite (index_column),
	foreign key (borough) references population (borough)
);

create table breed_borough (
	index_column INT,
	incident_date DATE,
	breed VARCHAR (200),
	borough VARCHAR (200),
	foreign key (index_column) references dog_bite (index_column),
	foreign key (borough) references population (borough)
);

-- 1. Count of how many incidences in each borough and by year.
-- 2. Count of breeds and and incidences by breed.

select breed_borough.breed, count(*) as incident_count
from breed_borough
group by breed_borough.breed
order by incident_count desc;


-- 3. Population percentage vs. number of incidences and breed.
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










