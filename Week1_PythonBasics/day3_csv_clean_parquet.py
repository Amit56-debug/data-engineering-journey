import pandas as pd
import os

# Step 1: Read your CSV file
input_file = "Week1_Output/raw_data.csv"   # 🔹 change this to your actual CSV path
df = pd.read_csv(input_file)

# Step 2: Clean data (example cleaning)
df.dropna(inplace=True)
df = df.drop_duplicates()

# Step 3: Create an output folder if it doesn't exist
output_dir = "Week1_Output"
os.makedirs(output_dir, exist_ok=True)

# Step 4: Save cleaned data as Parquet
output_file = os.path.join(output_dir, "cleaned_data.parquet")
df.to_parquet(output_file, index=False)

# Step 5: Confirm file creation
if os.path.exists(output_file):
    print(f"✅ Data cleaned and saved as Parquet successfully: {output_file}")
else:
    print("❌ Parquet file not found. Please check file paths or data cleaning steps.")
