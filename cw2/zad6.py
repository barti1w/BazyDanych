import numpy as np
from scipy.stats import describe

mean_normal = 0
std_dev_normal = 2
num_data_points = 100

data_points = np.random.normal(mean_normal, std_dev_normal, num_data_points)

desc_stats = describe(data_points)

theoretical_mean = mean_normal
theoretical_std_dev = std_dev_normal
theoretical_variance = std_dev_normal**2
theoretical_skewness = 0
theoretical_kurtosis = 3

print("\nObliczone Statystyki:")
print(f"Średnia: {desc_stats.mean}, Teoretyczna: {theoretical_mean}")
print(f"Wariancja: {desc_stats.variance}, Teoretyczna: {theoretical_variance}")
print(f"Skośność: {desc_stats.skewness}, Teoretyczna: {theoretical_skewness}")
print(f"Kurtoza: {desc_stats.kurtosis}, Teoretyczna: {theoretical_kurtosis}")

# Więcej danych
num_data_points_increase = 1000
data_points_increase = np.random.normal(mean_normal, std_dev_normal, num_data_points_increase)
desc_stats_increase = describe(data_points_increase)

print("\nObliczone Statystyki (Więcej danych):")
print(f"Średnia: {desc_stats_increase.mean}, Teoretyczna: {theoretical_mean}")
print(f"Wariancja: {desc_stats_increase.variance}, Teoretyczna: {theoretical_variance}")
print(f"Skośność: {desc_stats_increase.skewness}, Teoretyczna: {theoretical_skewness}")
print(f"Kurtoza: {desc_stats_increase.kurtosis}, Teoretyczna: {theoretical_kurtosis}")
