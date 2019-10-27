from pyhdf.SD import SD, SDC
import csv

hdf = SD('AIRS.hdf', SDC.READ)

coords = hdf.select('L1B_AIRS_Science/Geolocation Fields')
data = hdf.select('L1B_AIRS_Science/Data Fields')
data_set_lat = coords['Latitude']
data_set_lon = coords['Longitude']
data_set_value = data['BT_diff_SO2']
error = data_set_value.attrs['_FillValue'][0]

n = data_set_value.shape[0]
m = data_set_value.shape[1]

with open('AIRS.csv', 'w') as csvFile:
    writer = csv.writer(csvFile)
    for x in range(n):
        for y in range(m):
            if data_set_value[(x,y)] != error:
                csvData = [data_set_lat[(x,y)], data_set_lon[(x,y)], data_set_value[(x,y)]]
                writer.writerows([csvData])

csvFile.close()