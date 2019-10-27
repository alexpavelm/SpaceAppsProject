import netCDF4 as nc4
import datetime
import csv

fh = nc4.Dataset('MERRA2.nc4', mode='r')

n = fh.variables['lat'].shape[0]
m = fh.variables['lon'].shape[0]

with open('MERRA2_Data.csv', 'w') as csvFile:
    writer = csv.writer(csvFile)
    for x in range(n):
        for y in range(m):
            csvData = [fh.variables['lat'][x], fh.variables['lon'][y], fh.variables['AODANA'][0][x][y]]
            writer.writerows([csvData])

csvFile.close()