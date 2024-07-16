# Importing dependencies that will be used for the code.
import json
import pandas as pd
from pprint import pprint
import datetime

# Importing json data.
json_data = json.load(open("dogbites.json"))

# Creating a data specific DataFrame.
dog_data = pd.DataFrame(json_data["data"], columns=[
  "drop_code1",
  "drop_code2",
  "drop_code3",
  "drop_code4",
  "drop_code5",
  "drop_code6",
  "drop_code7",
  "drop_code8",
  "unique_id",
  "incident_date",
  "species",
  "breed",
  "age",
  "gender",
  "spay_neuter_status",
  "borough",
  "zip_code"
])

# Specifying columns to drop.
drop_columns = [
  "drop_code1",
  "drop_code2",
  "drop_code3",
  "drop_code4",
  "drop_code5",
  "drop_code6",
  "drop_code7",
  "drop_code8"
]

# Cleaning column headers.
dog_data_clean = dog_data.drop(columns=drop_columns)
# Notes on cleaning the data:
# - Inconsistent age formatting was used. Sometimes in months, mostly in years.
# - Zipcodes labeled in different ways. "?", "N/A", etc.

dog_data_clean["unique_id"] = dog_data_clean["unique_id"].astype("Int64")

# Sorting and printing data.
# dog_data_clean.sort_values("unique_id")
print(dog_data_clean.dtypes)
