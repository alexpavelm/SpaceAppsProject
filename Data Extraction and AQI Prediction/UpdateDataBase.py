import firebase_admin
import matlab.engine
import csv
import os

def Aprox_AQI(lat, lon):
    mtlb = matlab.engine.start_matlab()
    with open('Example.csv') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        line_count = 0
        for row in csv_reader:
            if line_count == 0:
                line_count += 1
            else:
                if lat == row[0] and lon == row[1]:
                    aod = row[2]
                    co = row[3]
                    regressionModel = mtlb.regressionModel('Example.csv')
                    aproxAQI = mtlb.predictAQI(regressionModel, aod, co)
                    break
    return aproxAQI

os.environ['AQIPY_TOKEN'] = '55ffc71f65b43a06b9a1cc6aa8cb66ac4f6cbd6b'

from firebase_admin import credentials, firestore
from waqi_python import client as base


cred = credentials.Certificate('./SpaceApps.json')
default_app = firebase_admin.initialize_app(cred)
db = firestore.client()

client = base.WaqiClient()
docs = db.collection(u'cities').stream()

for doc in docs:
    lat = doc.to_dict()["lat"]
    long = doc.to_dict()["long"]
    my_station = client.get_station_by_latlng(lat, long)

    if my_station.aqi != "none":
        city_ref = db.collection(u'cities').document(doc.id)
        city_ref.set({
            u'aqi': my_station.aqi
        }, merge=True)
    else:
        aprox_AQI = Aprox_AQI(lat, long)
        city_ref = db.collection(u'cities').document(doc.id)
        city_ref.set({
            u'aqi': aprox_AQI,
            u'provider': "Air Guardian"
        }, merge=True)

