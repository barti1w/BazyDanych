import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import binom

n_binomial = 20
p_binomial = 0.4
x = np.arange(0, n_binomial + 1)

probabilities = binom.pmf(x, n_binomial, p_binomial)

sum_probabilities = np.sum(probabilities)

plt.bar(x, probabilities, color='green', alpha=0.7, edgecolor='black')
plt.title('Rozkład Prawdopodobieństwa Dwumianowego')
plt.xlabel('k (Liczba sukcesów)')
plt.ylabel('Prawdopodobieństwo')
plt.show()

print(f"Suma prawdopodobieństw: {sum_probabilities}")
# Suma jest prawie równa 1, przy 15 miejscu po przecinku mamy niezgodność. Przyjąłem, że jest to jednorazowa anomalia
assert round(sum_probabilities, 10) == 1