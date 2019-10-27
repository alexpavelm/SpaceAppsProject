import h5py
import csv

h5file = h5py.File('OMI-Aura_L2G.he5', 'r')

data_set_lat = h5file['HDFEOS']['GRIDS']['ColumnAmountAerosol']['Data Fields']['Latitude']
data_set_lon = h5file['HDFEOS']['GRIDS']['ColumnAmountAerosol']['Data Fields']['Longitude']
data_set_value = h5file['HDFEOS']['GRIDS']['ColumnAmountAerosol']['Data Fields']['UVAerosolIndex']
error = data_set_value.attrs['MissingValue'][0]

n = data_set_value.shape[0]
m = data_set_value.shape[1]
p = data_set_value.shape[2]

with open('Aura_Data_AOD.csv', 'w') as csvFile:
    writer = csv.writer(csvFile)
    for x in range(n):
        for y in range(m):
            for z in range(p):
                if data_set_value[(x,y,z)] != error:
                    csvData = [data_set_lat[(x,y,z)], data_set_lon[(x,y,z)], data_set_value[(x,y,z)]]
                    writer.writerows([csvData])

csvFile.close()