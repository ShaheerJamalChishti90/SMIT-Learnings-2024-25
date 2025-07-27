20/4/25

import requests
from bs4 import BeautifulSoup
import re
import json

url = ""
web = requests.get(url).content
soup = Beautifulsoup(web, "lxml")

# Whenever we do filtering, we do only on two things, either on class or on Id

data = soup.find_all("script")
string = data[12].string

match = re.seach(r"window.searchStoreV2\s*=\s*(\{.*?\});", string, re.DOTALL)
if match:
    works = match.group(1)
    works_json = json.loads(works)

    works = works_json.get('works')

for i in works:
    data.update(i)
    title = data["title"]
    condition = data["buyNowCondition"]
    buy_price = data["buyNowPrice"]


    with open("thrift_books.csv", "a") as f:
        f.write(f"{title}, {condition}, {buy_price}\n")


