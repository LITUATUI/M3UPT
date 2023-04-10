#!/usr/bin/env python

# Get the stream URL of Porto Canal and put it in porto_canal.txt

import os, requests, json, time, sys
os.system("clear")

url = "https://www.dailymotion.com/video/x8egnb8"

def download_data(url):
    p1 = "https://api.w03.savethevideo.com/tasks"

    obj = {"type":"info","url": url }

    r = requests.post(p1, json = obj)
    h = json.loads(r.text)['href']

    print(h)

    g1 = "https://api.w03.savethevideo.com//" + h
    time.sleep(3)
    r2 = requests.get(g1)

    jr2 = json.loads(r2.text)

    #print(jr2)
    print(jr2['result']['title'])
    sys.stdout=open("porto_canal.txt","w")
    print(jr2['result']['url'])
    sys.stdout.close()

    return_data = {
        "title" : jr2['result']['title'],
        "url" : jr2['result']['url']    
    }

download_data(url)
