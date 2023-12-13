import numpy as np

wartosci = np.array([1, 2, 3, 4, 5, 6])
prawdopodobienstwo = np.array([1/6, 1/6, 1/6, 1/6, 1/6, 1/6])

srednia = np.sum(wartosci * prawdopodobienstwo)
wariancja = np.sum((wartosci - srednia)**2 * prawdopodobienstwo)
odchylenie_standardowe = np.sqrt(wariancja)

print(f"Średnia: {srednia}")
print(f"Wariancja: {wariancja}")
print(f"Odchylenie standardowe: {odchylenie_standardowe}")
