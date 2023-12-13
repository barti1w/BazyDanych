import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import bernoulli, binom, poisson, describe, kurtosis, skew

p_bernoulli = 0.5
samples_bernoulli = bernoulli.rvs(p_bernoulli, size=100)

n_binomial = 10
p_binomial = 0.3
samples_binomial = binom.rvs(n_binomial, p_binomial, size=100)

lambda_poisson = 3
samples_poisson = poisson.rvs(lambda_poisson, size=100)

fig = plt.figure(figsize=(8, 12))

plt.subplot(3, 1, 1)
plt.hist(samples_bernoulli, bins=[-0.5, 0.5, 1.5], alpha=0.7, color='blue', edgecolor='black')
plt.title('Rozkład Bernoulliego')
plt.xticks([0, 1])

plt.subplot(3, 1, 2)
plt.hist(samples_binomial, bins=np.arange(-0.5, n_binomial + 1.5, 1), alpha=0.7, color='green', edgecolor='black')
plt.title('Rozkład Dwumianowy')
plt.xticks(np.arange(0, n_binomial + 1, 1))

plt.subplot(3, 1, 3)
plt.hist(samples_poisson, bins=np.arange(-0.5, max(samples_poisson) + 1.5, 1), alpha=0.7, color='red', edgecolor='black')
plt.title('Rozkład Poissona')
plt.xticks(np.arange(0, max(samples_poisson) + 1, 1))

plt.tight_layout()
plt.show()

def stats(samples, distribution_name):
    desc = describe(samples)
    kurt = kurtosis(samples)
    skewness = skew(samples)

    print(f"\nStatystyki podstawowe dla rozkładu {distribution_name}:")
    print(f"Średnia: {desc.mean}")
    print(f"Wariancja: {desc.variance}")
    print(f"Kurtoza: {kurt}")
    print(f"Skośność: {skewness}")

stats(samples_bernoulli, "Bernoulli")
stats(samples_binomial, "Dwumianowy")
stats(samples_poisson, "Poissona")
