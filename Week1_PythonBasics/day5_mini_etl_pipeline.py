import pandas as pd
import os

raw_path = "data/raw/sales_raw.csv"
staging_path = "data/staging/sales_clean.csv"
processed_path = "data/processed/sales_final.parquet"

df_raw = pd.read_csv(raw_path)
print("Raw Data Loaded ✅")

df_staging = df_raw.copy()
df_staging.columns = ['product_name', 'price', 'quantity', 'discount']
df_staging = df_staging.drop_duplicates()
df_staging['discount'] = df_staging['discount'].fillna(0)
df_staging['price'] = df_staging['price'].astype(float)

os.makedirs("data/staging", exist_ok=True)
df_staging.to_csv(staging_path, index=False)
print("Staging file created ✅")

df_processed = df_staging.copy()
df_processed['net_price'] = df_processed['price'] * (1 - df_processed['discount']/100)
df_processed['revenue'] = df_processed['net_price'] * df_processed['quantity']

os.makedirs("data/processed", exist_ok=True)
df_processed.to_parquet(processed_path, index=False)
print("Processed data saved ✅")

print("\nFinal Processed Data:")
print(df_processed.head())
print(f"Rows (Raw): {len(df_raw)}, Rows (Staging): {len(df_staging)}, Rows (Processed): {len(df_processed)}")
