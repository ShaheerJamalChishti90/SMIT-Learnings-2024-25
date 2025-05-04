from bs4 import BeautifulSoup
import requests


url = "https://realpython.github.io/fake-jobs/"
request = requests.get(url).content
soup = BeautifulSoup(request, "lxml")

print(soup.prettify())