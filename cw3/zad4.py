from scipy.stats import ttest_ind
import pandas as pd

df = pd.read_csv('napoje.csv', sep=';')

pary_do_porownan = [('okocim', 'lech'), ('fanta ', 'regionalne'), ('cola', 'pepsi')]

for para in pary_do_porownan:
    zmienna1, zmienna2 = para
    data1 = df[zmienna1].dropna()
    data2 = df[zmienna2].dropna()

    stat, p_value = ttest_ind(data1, data2)

    print(f"Pary {zmienna1} - {zmienna2}:")
    print("Wartość p:", p_value)

    alfa = 0.05
    if p_value < alfa:
        print("Duża różnica średnich.")
    else:
        print("Średnie są równe.")
    print('\n')
