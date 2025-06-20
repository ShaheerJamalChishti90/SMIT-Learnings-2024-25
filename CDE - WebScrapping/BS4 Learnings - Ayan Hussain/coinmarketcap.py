from bs4 import BeautifulSoup
import requests


url = "https://coinmarketcap.com/"
request = requests.get(url).content
soup = BeautifulSoup(request, "lxml")

print(soup.prettify())