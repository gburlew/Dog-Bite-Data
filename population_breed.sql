select b.borough, pop.pop_portion as population_percent, b.breed, b.breed_count from
(select borough, breed, count(breed) as breed_count from breed_borough
	group by borough, breed
	order by borough asc) as b join population as pop on pop.borough=b.borough;

select d.borough, count(borough) as "borough_count" from dog_locations as d
	group by d.borough
	order by borough_count desc;