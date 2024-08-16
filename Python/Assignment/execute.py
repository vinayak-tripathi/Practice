from src.etl_file_processing import etl_prices
import pandas as pd
vt = pd.read_excel("Python\\Assignment\\inputfile\\PythonProject.xlsx")
# with open("inputfile/")
final = etl_prices('Python\\Assignment\\inputfile\\PythonProject.xlsx')
print(final)
final.to_csv('Python\\Assignment\\output\\output_.csv')
# Python\Assignment\inputfile
# Python\Assignment\inputfile\PythonProject.xlsx
# Python\Assignment\output