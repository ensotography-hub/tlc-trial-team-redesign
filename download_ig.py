import urllib.request
import re
import os

url = "https://www.picuki.com/profile/tlctrialteam"
req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
try:
    html = urllib.request.urlopen(req).read().decode('utf-8')
    # picuki html structure varies, let's just grab any standard img url that looks like an IG photo
    # Picuki might block us but it's worth a try.
    images = re.findall(r'<img[^>]+src="([^"]+scontent[^"]+)"', html)
    if not images:
        images = re.findall(r'<img[^>]+src="([^"]+picuki[^"]+)"', html)
        
    if images:
        os.makedirs("assets/img/ig", exist_ok=True)
        count = 0
        for img_url in images:
            if count >= 8: break
            if "scontent" not in img_url and "picuki" not in img_url: continue
            print(f"Downloading {img_url}")
            img_req = urllib.request.Request(img_url.replace("&amp;", "&"), headers={'User-Agent': 'Mozilla/5.0'})
            try:
                img_data = urllib.request.urlopen(img_req).read()
                with open(f"assets/img/ig/post_{count}.jpg", "wb") as f:
                    f.write(img_data)
                count += 1
            except Exception as e:
                print(f"Failed to download {img_url}: {e}")
        print(f"Success: downloaded {count} images")
    else:
        print("No images found on Picuki")
except Exception as e:
    print(f"Error: {e}")
