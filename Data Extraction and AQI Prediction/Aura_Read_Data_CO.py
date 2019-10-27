import h5py
import csv

h5file = h5py.File('OMI-Aura_L2.he5', 'r')

data_set_lat = h5file['HDFEOS']['SWATHS']['Aerosol NearUV Swath']['Geolocation Fields']['Latitude']
data_set_lon = h5file['HDFEOS']['SWATHS']['Aerosol NearUV Swath']['Geolocation Fields']['Longitude']
data_set_value = h5file['HDFEOS']['SWATHS']['Aerosol NearUV Swath']['Data Fields']['AIRSL3COvalue']
error = data_set_value.attrs['MissingValue'][0]

n = data_set_value.shape[0]
m = data_set_value.shape[1]

with open('Aura_Data_CO.csv', 'w') as csvFile:
    writer = csv.writer(csvFile)
    for x in range(n):
        for y in range(m):
            if data_set_value[(x,y)] != error:
                csvData = [data_set_lat[(x,y)], data_set_lon[(x,y)], data_set_value[(x,y)]]
                writer.writerows([csvData])

csvFile.close()