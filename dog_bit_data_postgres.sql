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

select * from dog_bite










