import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv('brain_size.csv', delimiter=';')

FSIQ_mean = data['FSIQ'].mean()
print(f'Średnia FSIQ: {FSIQ_mean}')

gender = data['Gender'].value_counts()
print(f'Liczba kobiet: {gender["Female"]}')
print(f'Liczba mężczyzn: {gender["Male"]}')

data[['FSIQ', 'VIQ', 'PIQ']].hist(bins=10, edgecolor='black', grid=False, figsize=(12, 6))
plt.suptitle('Histogramy dla kolumn FSIQ, VIQ, PIQ')
plt.show()

female_data = data[data['Gender'] == 'Female']
female_data[['FSIQ', 'VIQ', 'PIQ']].hist(bins=10, edgecolor='black', grid=False, figsize=(12, 6))
plt.suptitle('Histogramy dla kobiet, kolumny FSIQ, VIQ, PIQ')
plt.show()
