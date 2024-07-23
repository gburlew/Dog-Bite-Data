# Dog-Bite-Data

Data Engineering Track
See dogbites JSON file, we are looking at number of dog bites reported in new york city boroughs between 2015 and 2022.

1. SQL source file: dog_bit_data_postgres
       Tables:
           1. population: population percentages in new york city boroughs
           2. dog_bite: full data set
           3. dogs_data: dog demographics
           4. dog_locations: borough and zipcodes
           5. breed_borough: breed of dogs by borough
           6. incidents_by_year_borough: number of dog bites in each borough by year.
   
2. dogbites JSON (https://catalog.data.gov/dataset/dohmh-dog-bite-data/resource/21d7bc57-e2a5-48e2-bf4b-10f13bea946b), nyc_pop

3-4. Transformed data to cleaned csv files:  cleaned_data (master df), dog_location, dogs_data, incidents_by_year_borough, breed_borough, borough_loc, 2020_nyc_pop_df

5. Folium: see Folium Map

6. *need documents of why we chose postgressql and an updated ERD
