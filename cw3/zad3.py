from scipy.stats import shapiro
import pandas as pd

df = pd.read_csv('napoje.csv', sep=';')

for column in df.columns:
    if column not in ['mies', 'rok']:  # nieistotne kolumny
        data = df[column].dropna()
        stat, p_value = shapiro(data)
        print(f"Kolumna {column}:")
        print("Wartość p:", p_value)
        if p_value < 0.05:
            print("Rozkład nie jest normalny")
        else:
            print("Rozkład jest normalny")
        print("\n")
