#!/usr/bin/env python

from pathlib import Path
from time import sleep
import json
import shutil
import subprocess
import requests

def try_get(*args, **kwargs):
    e = None
    for i in range(5):
        try:
            return requests.get(*args, **kwargs)
        except Exception as exc:
            e = exc
            sleep(1000)
    raise e

def image_url():
    u = "https://www.bing.com/HPImageArchive.aspx?idx=0&format=js&mkt=it-IT&n=1"
    res = try_get(u)
    data = res.json()
    img_path = data['images'][0]['url']
    return "https://www.bing.com" + img_path

img_url = image_url()
response = try_get(img_url, stream=True)

out_path = Path.home() / Path(".local/share/bingpaper.jpg")
with out_path.open('wb') as out:
    shutil.copyfileobj(response.raw, out)

subprocess.run(["wal", "-s", "-t", "-i", str(out_path)])
