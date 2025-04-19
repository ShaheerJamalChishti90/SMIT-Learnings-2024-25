import requests
from bs4 import BeautifulSoup


url = "https://www.pakwheels.com/used-cars/search/-/" #PakWheels not scrappable

web = requests.get(url).content

soup = BeautifulSoup(web, "lxml")

print(soup.text)