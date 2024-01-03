import numpy as np
from scipy.stats import ttest_1samp

mean = 2
std = 30
count = 200

rand_val = np.random.normal(mean, std, count)

hipoteza_test = ttest_1samp(rand_val, 2.5)

print("Wynik testu:", hipoteza_test.statistic)
print("Wartość p:", hipoteza_test.pvalue)

alfa = 0.05
if hipoteza_test.pvalue < alfa:
    print("Odrzucamy hipotezę - istnieje duża różnica.")
else:
    print("Hipoteza jest okej.")
