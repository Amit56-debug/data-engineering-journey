import pandas as pd
import os

# Step 1: Define file paths
base_file = "Week1_Output/sales_base.csv"
delta_file = "Week1_Output/sales_delta.csv"
output_file = "Week1_Output/sales_merged.csv"

# Step 2: Read base and delta data
df_base = pd.read_csv(base_file)
df_delta = pd.read_csv(delta_file)

# Step 3: Merge logic (update + insert)
df_merged = pd.concat([df_base, df_delta]) \
              .sort_values("product") \
              .drop_duplicates(subset=["product"], keep="last")

# Step 4: Add revenue column
df_merged["revenue"] = df_merged["price"] * df_merged["quantity"]

# Step 5: Save merged data
os.makedirs("Week1_Output", exist_ok=True)
df_merged.to_csv(output_file, index=False)
df_merged.to_parquet("Week1_Output/sales_merged.parquet", index=False)

# Step 6: Print sorted by revenue
print("💰 Products sorted by revenue:")
print(df_merged.sort_values(by="revenue", ascending=False).to_string(index=False))

# Step 7: Confirmation message
print("\n✅ Delta load complete! Merged data saved to:")
print(f" - {output_file}")
print(f" - Week1_Output/sales_merged.parquet")
