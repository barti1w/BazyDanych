from scipy.stats import levene
import pandas as pd

df = pd.read_csv('napoje.csv', sep=';')

pary_do_porownan_wariancji = [('okocim', 'lech'), ('żywiec', 'fanta '), ('regionalne', 'cola')]

for para in pary_do_porownan_wariancji:
    zmienna1, zmienna2 = para
    data1 = df[zmienna1].dropna()
    data2 = df[zmienna2].dropna()

    stat, p_value = levene(data1, data2)

    print(f"Pary {zmienna1} - {zmienna2}:")
    print("Wartość p:", p_value)

    alfa = 0.05
    if p_value < alfa:
        print("Duża różnica wariancji.")
    else:
        print("Wariancje są równe.")

    print("\n")
