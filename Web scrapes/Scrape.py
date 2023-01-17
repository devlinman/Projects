 
from bs4 import BeautifulSoup

html_doc= open("W.html", "r")

soup = BeautifulSoup(html_doc, 'html.parser')

# traverse paragraphs from soup
#
# h2, h3 = soup.find_all("h2"), soup.find_all("h3")
# h20, h30 = h2[0], h3[0]
# print("Chapter", h20.get_text(), h30.get_text())
#
# for data in soup.find_all("p"):
#     print(data.get_text(), "\n\n###################" )

c = soup.find("h2")
print(c)
