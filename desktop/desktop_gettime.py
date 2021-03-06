#!/usr/bin/env python3
import requests
import urllib3.request
import time
from bs4 import BeautifulSoup
import shutil
from PIL import Image
def main():
    year = input("Which year are you in? \n :")
    url = f'https://gettime.ga/schema/{year}'
    
    print("Getting reponse now...")
    response = requests.get(url)
    print(response,'\n')

    soup = BeautifulSoup(response.text,"html.parser")
    result = soup.findAll('img')[0]

    print(result,'\n')
    
    link = result['src']

    print("Image link is: https://gettime.ga"+link,'\n')
    url_image = f"https://gettime.ga{link}"
    response_image = requests.get(url_image, stream=True)
    with open(f'{year}.png', 'wb') as out_file:
        shutil.copyfileobj(response_image.raw,out_file)
    del response_image
    print(url_image,'\n')
    file_name = f"{year}.png"
    print(file_name)
    print(f"Image saved as {file_name}")
    
    print("Opening image now..")
    image_schedule = Image.open("20_el_a.png")
    image_schedule.show()   

if __name__=="__main__":
    main()
