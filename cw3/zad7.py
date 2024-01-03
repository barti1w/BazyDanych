from scipy.stats import ttest_rel
import pandas as pd

df = pd.read_csv('napoje.csv', sep=';')
df_po_reklamie = pd.read_csv('napoje_po_reklamie.csv', sep=';')

df_2016 = df[df['rok'] == 2016]

zmienne_do_testu = ['cola', 'fanta ', 'pepsi']

for zmienna in zmienne_do_testu:
    data_2016 = df_2016[zmienna].dropna()
    data_po_reklamie = df_po_reklamie[zmienna].dropna()

    stat, p_value = ttest_rel(data_2016, data_po_reklamie)

    print(f"Test dla {zmienna}:")
    print("Wartość p:", p_value)

    alfa = 0.05
    if p_value < alfa:
        print("Duża różnica średnich.")
    else:
        print("NŚrednie są równe.")
    print("\n")
