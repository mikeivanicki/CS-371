# pyex5.py

import re 
import requests 

url = 'https://www.monmouth.edu/news/archives'

html = requests.get(url)

html_src = html.text

title_pattern = re.compile('target="_self" >(.+?)</a></h2>')

titles = title_pattern.findall(html_src, re.DOTALL) # re.DORALL not actually needed here

#print(len(titles))

links_pattern = re.compile('<a href="(.+?)" target="_self" >')

links = links_pattern.findall(html_src, re.DOTALL)

#print(len(links))

# Make newsfeed dictionary 
#newsfeed = {}
#for title_num in range(len(titles)): 
 #   newsfeed[titles[title_num]] = links[title_num]

# Use a list comprehension to create newfeed 
newsfeed = dict([(titles[i], links[i]) for i in range (len(titles))])
print(newsfeed)