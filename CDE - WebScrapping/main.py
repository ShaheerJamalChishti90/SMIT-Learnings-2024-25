from bs4 import BeautifulSoup
import requests

url = "https://m.timesjobs.com/mobile/jobs-search-result.html?txtKeywords=python&cboWorkExp1=-1&txtLocation="


web = requests.get(url).content
# print(type(web))

soup = BeautifulSoup(web, "html.parser")

jobs = soup.find_all("div", class_ = "srp-job-heading")

job_json = {}
for job in jobs:
    title = job.find("h3").text
    company = job.find("span", class_ = "spr-comp-name").text
    posting_time = job.find("span", class_ = "posting-time").text

    job_json = {
    "job_title": title,
    "company_name": company,
    "posting_time": posting_time
    }


print(job_json)