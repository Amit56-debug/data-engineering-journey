# Step 1: Create product and price lists
products = ["Laptop", "Mobile", "Tablet", "TV", "Headphones"]
prices = [55000, 20000, 15000, 80000, 3000]

# Step 2: Open file to save Premium products
with open("premium_products.txt", "w", encoding="utf-8") as f:
    # Step 3: Loop through each product
    for i in range(len(products)):
        print(f"{products[i]} costs {prices[i]}", end=" -> ")

        # Step 4: Classify based on price
        if prices[i] > 50000:
            print("Premium")
            f.write(f"{products[i]} - {prices[i]} - Premium\n")  # save to file
        elif 20000 <= prices[i] <= 50000:
            print("Mid-range")
        else:
            print("Budget")
