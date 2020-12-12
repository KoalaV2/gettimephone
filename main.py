#!/usr/bin/env python3
import requests
import urllib3.request
import time
from bs4 import BeautifulSoup

def main():
    year = input("Which year are you in? \n :")
    url = f'https://gettime.ga/schema/{year}'

    response = requests.get(url)
    print(response,'\n')

    soup = BeautifulSoup(response.text,"html.parser")
    result = soup.findAll('img')[0]

    print(result,'\n')
    
    link = result['src']

    print("Image link is: https://gettime.ga"+link,'\n')
if __name__=="__main__":
    main()
