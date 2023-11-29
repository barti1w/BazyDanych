import pandas as pd

df = pd.read_csv('D:\Szkoła\Magisterka\Semestr1\stats\cw1\MDR_RR_TB_burden_estimates_2023-11-29.csv', usecols= ['e_rr_pct_new'])
print(df.describe())