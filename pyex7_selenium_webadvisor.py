# pyex7_selenium_webadvisor.py - Interact with webadvisor course search 

from selenium import webdriver
from selenium.webdriver.support.ui import Select        # for dropdown menus
from selenium.webdriver.chrome.options import Options   # for headless Chrome
import time                                             # implement pauses

# Instance of Options class to configure headless Chrome 
options = Options()

# Parameter to tell Chrome that it should run without a UI (headless)
options.headless = True

driver = webdriver.Chrome(options=options)

driver.get('https://www2.monmouth.edu/muwebadv/wa3/search/SearchClassesv2.aspx')

#Select the term 
term_val = '23/SU'
# Find the term dropdown menu 
term_select = Select(driver.find_element_by_name('_ctl0:MainContent:ddlTerm'))
term_select.select_by_value(term_val)

# Select the subject 
subj_val = 'CS'
# Find the subject dropdown menu 
subj_select = Select(driver.find_element_by_name('_ctl10:MainContent:ddlSubj_1'))
subj_select.select_by_value(subj_val)

# Click the Submit button
driver.find_element_by_name('_ctl0:MainContent:btnSubmit').click()

# Get resulting html and print it 
print(driver.page_source)

driver.quit() # close the browser window