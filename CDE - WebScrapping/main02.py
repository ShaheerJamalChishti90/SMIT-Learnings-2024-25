import requests
from bs4 import BeautifulSoup

url = "https://realpython.github.io/fake-jobs/"

web = requests.get(url).content

soup = BeautifulSoup(web, "lxml")

a = soup.text
# print(a.find_all(h2))

print(soup.prettify())