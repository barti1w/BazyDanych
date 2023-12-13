import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

mean_normal = 1
std_dev_normal = 2

mean_standard = 0
std_dev_standard = 1

mean_density = -1
std_dev_density = 0.5

data_normal = np.random.normal(mean_normal, std_dev_normal, 1000)
data_standard = np.random.standard_normal(1000)
data_density = np.random.normal(mean_density, std_dev_density, 1000)

plt.hist(data_normal, bins=30, density=True, alpha=0.5, label='Rozkład normalny mean=1, std_dev=2')
plt.hist(data_standard, bins=30, density=True, alpha=0.5, label='Rozkład standardowy mean=0, std_dev=1')
plt.hist(data_density, bins=30, density=True, alpha=0.5, label='Rozkład normalny mean=-1, std_dev=0.5')

xmin, xmax = plt.xlim()
x_normal = np.linspace(xmin, xmax, 100)
p_normal = norm.pdf(x_normal, mean_normal, std_dev_normal)
plt.plot(x_normal, p_normal, 'k', linewidth=2)

x_standard = np.linspace(xmin, xmax, 100)
p_standard = norm.pdf(x_standard, mean_standard, std_dev_standard)
plt.plot(x_standard, p_standard, 'k--', linewidth=2)

x_density = np.linspace(xmin, xmax, 100)
p_density = norm.pdf(x_density, mean_density, std_dev_density)
plt.plot(x_density, p_density, 'k:', linewidth=2)

plt.legend()
plt.show()
