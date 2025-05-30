# 🛍️ Sales Data Cleaner

Welcome! This project helps you clean and combine messy sales data from multiple stores into one tidy file — ready for analysis or reporting.

Whether you're working with incomplete values, inconsistent formats, or multiple store files, this tool does the heavy lifting for you.

---

## ✨ What This Script Does

- Reads raw sales data from 3 CSV files (one for each store)
- Combines all the files into a single dataset
- Fixes missing values (like unknown prices or customer IDs)
- Converts data types (dates, numbers, etc.) to the correct format
- Adds a new column `Total_price = Qty × Unit_Price`
- Saves the cleaned, formatted result to a new file

---

## 🛠️ How to Use This

1. ✅ Make sure Python 3.8+ is installed  
2. ✅ Install the required library:

   ```bash
   pip install pandas
