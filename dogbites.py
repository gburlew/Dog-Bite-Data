import json
import pandas as pd
from pprint import pprint

json_data = json.load(open("dogbites.json"))

# creating a data specific DataFrame.
dog_data = pd.DataFrame(json_data["data"], columns=[
  "drop_code1",
  "drop_code2",
  "drop_code3",
  "drop_code4",
  "drop_code5",
  "drop_code6",
  "drop_code7",
  "drop_code8",
  "UniqueID",
  "incident_date",
  "species",
  "breed",
  "age",
  "gender",
  "spay/neuter_status",
  "borough",
  "zip_code"
])

# specifying columns to drop.
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

dog_data_clean = dog_data.drop(columns=drop_columns)
dog_data_clean.sort_values("UniqueID")
print(dog_data_clean)

