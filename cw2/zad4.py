import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import bernoulli, binom, poisson

p_bernoulli = 0.3
rv_bernoulli = bernoulli(p_bernoulli)

n_binom = 10
p_binom = 0.5
rv_binom = binom(n_binom, p_binom)

mu_poisson = 3
rv_poisson = poisson(mu_poisson)

x = np.arange(0, n_binom+1)

plt.subplot(3, 1, 1)
plt.bar(x, rv_bernoulli.pmf(x))
plt.title('Rozkład Bernoulliego')
plt.xlabel('Wartość')
plt.ylabel('Prawdopodobieństwo')

plt.subplot(3, 1, 2)
plt.bar(x, rv_binom.pmf(x))
plt.title('Rozkład Dwumianowy')
plt.xlabel('Wartość')
plt.ylabel('Prawdopodobieństwo')

plt.subplot(3, 1, 3)
plt.bar(x, rv_poisson.pmf(x))
plt.title('Rozkład Poissona')
plt.xlabel('Wartość')
plt.ylabel('Prawdopodobieństwo')

plt.tight_layout()
plt.show()
