import requests
import yaml
import json
from pathlib import Path


def starwarsinfo():
    with open(
            r'..//star_wars_dev_ops/input.yaml') as file:  # opens the input yaml file and loads the contents into
        # dictionary.
        documents = yaml.full_load(file)
    base = Path('chron_output')
    base.mkdir(exist_ok=True) #creates a directory to hold the output.c
    for k in documents:
        search_list = documents.get(k)
        for elem in search_list:
            calls = "https://swapi.dev/api/" + k + "/?search=" + elem  # generate the correct request format for a search of category and item.
            response = requests.get(calls)  # make the get request to the API
            formatting = response.json()  # take the API response into a JSON format.
            name = k + "." + elem  # setting up name
            with open(base/(name + ".json"),
                      'w') as outfile:  # create an output file with correct naming conventions and writes the get response.
                json.dump(formatting, outfile)


starwarsinfo()