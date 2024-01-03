import pandas as pd
from scipy.stats import ttest_1samp

df = pd.read_csv('napoje.csv', sep=';')

lech_mean = 60500
lech_data = df['lech'].dropna()
lech_test = ttest_1samp(lech_data, lech_mean)

print("Wynik dla piwa Lech:")
print("Wartość p:", lech_test.pvalue)
if lech_test.pvalue < 0.05:
    print("Odrzucamy hipotezę - istnieje duża różnica.")
else:
    print("Hipoteza jest okej.")

coli_mean = 222000
coli_data = df['cola'].dropna()
coli_test = ttest_1samp(coli_data, coli_mean)

print("\nWynik testu dla coli:")
print("Wartość p:", coli_test.pvalue)
if coli_test.pvalue < 0.05:
    print("Odrzucamy hipotezę - istnieje duża różnica.")
else:
    print("Hipoteza jest okej.")

regionalne_mean = 43500
regionalne_data = df['regionalne'].dropna()
regionalne_test = ttest_1samp(regionalne_data, regionalne_mean)

print("\nWynik testu dla piw regionalnych:")
print("Wartość p:", regionalne_test.pvalue)
if regionalne_test.pvalue < 0.05:
    print("Odrzucamy hipotezę - istnieje duża różnica.")
else:
    print("Hipoteza jest okej.")
