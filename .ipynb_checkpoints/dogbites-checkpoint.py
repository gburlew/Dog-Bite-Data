import pandas as pd
import pprint

json_data = pd.read_json("../dogbites.json")

pprint(json_data)