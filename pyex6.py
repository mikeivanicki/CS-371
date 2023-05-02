# pyex6.py - Use BeautifulSoup parser to parse MU news archives 

import requests
import bs4

url = requests.get('https://www.monmouth.edu/news/archives')

html = url.text

munews_soup = bs4.BeautifulSoup(html, 'html.parser')
#print(type(munews_soup))

articles = munews_soup.find_all('h2') # list of bs4 Tag objects 
#print(articles[0])

#Get the titles 
titles = []
links = []
for article in articles: #Each article will be a dictionary 
    anchor = article.find('a') # find nested <a Tag inside <h2;
                               # anchor will also be a directory 
    titles.append(anchor.text)
    links.append(anchor['href'])

# Make newsfeed dictionary, where key = title, value = link
newsfeed = {}
for title_num in range(len(titles)): 
    newsfeed[titles[title_num]] = links[title_num]

print(newsfeed)