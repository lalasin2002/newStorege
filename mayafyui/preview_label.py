import requests , pprint

r = requests.get("http://127.0.0.1:8188/object_info/CheckpointLoaderSimple")
data = r.json()
pprint.pprint(data )