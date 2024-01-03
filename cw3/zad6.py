from scipy.stats import ttest_ind
import pandas as pd

df = pd.read_csv('napoje.csv', sep=';')

piwo_regionalne_2001 = df[df['rok'] == 2001]['regionalne'].dropna()
piwo_regionalne_2015 = df[df['rok'] == 2015]['regionalne'].dropna()

stat, p_value = ttest_ind(piwo_regionalne_2001, piwo_regionalne_2015)

print("Test pomiędzy latami 2001 i 2015:")
print("Wartość p:", p_value)

alfa = 0.05
if p_value < alfa:
    print("Duża różnica średnich.")
else:
    print("Średnie są równe.")
