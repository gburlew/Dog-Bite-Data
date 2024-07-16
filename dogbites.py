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

dt_format = None

dog_data_clean["unique_id"] = dog_data_clean["unique_id"].astype("Int64")
dog_data_clean['age'] = dog_data_clean["age"].replace("Y", "", regex=True)
dog_data_clean['zip_code'] = dog_data_clean["zip_code"].replace("?", "None")
dog_data_clean['incident_date'] = pd.to_datetime(dog_data_clean["incident_date"], format=dt_format)

# Sorting and printing data.
dog_data_clean.sort_values("unique_id")
print(dog_data_clean)

