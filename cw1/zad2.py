import csv
import statistics
import math

with open('Wzrost.csv', 'r') as file:
    reader = csv.reader(file)
    data = [row for row in reader]
    data_int = [int(x) for x in data[0]]

variance = statistics.variance(data_int)
stdev = statistics.stdev(data_int)

print(data_int)
print(f'Wariancja: {variance}')
print(f'Odchylenie standardowe: {stdev}')

#Odchylenie standardowe to pierwiastek z wariancji
assert math.sqrt(variance) == stdev