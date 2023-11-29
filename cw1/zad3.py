from scipy.stats import describe, skew, kurtosis, pearsonr, spearmanr
import pandas as pd

data = pd.read_csv('brain_size.csv', delimiter=';', usecols=range(1,8))

selected_column = 'FSIQ'
data[selected_column] = pd.to_numeric(data[selected_column], errors='coerce')

stats_summary = describe(data[selected_column])
skewness = skew(data[selected_column])
kurt = kurtosis(data[selected_column])
spearman_corr, _ = spearmanr(data['MRI_Count'], data['Height'])

print(f'Statystyki opisowe {selected_column}: {stats_summary}')
print(f'Skewness dla {selected_column}: {skewness}')
print(f'Kurtoza dla {selected_column}: {kurt}')
print(f'Korelacja Spearmana między Weight a Height: {spearman_corr}')