from selenium import webdriver
from selenium.webdriver.chrome.service import Service


path = r""


service = Service(path)
service.start()


driver = webdriver.Chrome(path)
driver.get("") #yahan audible ki website ka link aajayega

driver.find_element_by_xpath("").click()
# //span[@class="" and contains(text(), "English")]

# //span[@class="" and contains(text(), "English")]
# //li[@class=""/h3[@class=""]/a[@class=""] and contains(text(), "Just say yes")]

# 0324 2060070 Bilal Cyber Security B1
# driver.quit()


 