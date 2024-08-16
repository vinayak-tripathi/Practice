import pandas as pd
# import numpy as np

def read_input(file_location:str):
    '''file_location --> file location string
    This function reads the "Input" sheet and return a dataframe
    '''
    return pd.read_excel(file_location,sheet_name = 'Input',usecols=['Product','Packing Details','QTY'])
    
def read_productdetails(file_location:str):
    '''file_location --> file location string
    This function reads the  sheet and return a dataframe
    '''
    return pd.read_excel(file_location,sheet_name = 'Product Details',usecols = ['Product', 'Packing Details', 'Rate'])

def preprocess(ip_file,product_details):
    '''ip_file --> unprocessed dataframe
    product_details --> product details dataframe
    This function Processes the input dataframe and returns processed dataframe
    '''
    ip_file['Packing Details'] = ip_file['Packing Details'].fillna(ip_file['Product'].str.extract(r'\(([A-Za-z0-9]+\sx\s\d+[A-Za-z]*)\)')[0])
    ip_file['Product'] = ip_file['Product'].str.replace(r'\s\([A-Za-z0-9]+\sx\s\d+[A-Za-z]*\)','',regex = True)
    # processed = ip_file.set_index(['Product']).combine_first(product_details[['Product','Packing Details']].set_index(['Product'])).reset_index()
    vt = ip_file.merge(product_details,on=['Product'])
    vt.loc[vt[vt['Packing Details_x'].isna()].index,'Packing Details_x'] = vt.loc[vt[vt['Packing Details_x'].isna()].index,'Packing Details_y']
    final = vt.drop_duplicates(subset=['Product', 'Packing Details_x'], keep='first')
    final = final.rename(columns = {'Packing Details_x':'Packing Details'})
    return final[['Product','Packing Details','QTY','Rate']]
 
    
def getUSD_INR_rate():
    import requests
    true = True
    url = "https://api.apilayer.com/fixer/convert?to=INR&from=USD&amount=1"
    payload = {}
    headers= {
      "apikey": "1oqMRDhezrQkPfqIeJhEP91o6AxOCMwR"
    }
    response = requests.request("GET", url, headers=headers, data = payload)
    status_code = response.status_code
    result = response.text
    return eval(result)['info']['rate']

def transform(processed):
    '''ip_file --> unprocessed dataframe
    This function transforms the processed dataframe and returns the tranformed final output dataframe
    '''
    processed['Pieces per Unit'] = processed['Packing Details'].str.extract(r'[A-Za-z0-9]+\sx\s(\d+)[A-Za-z]*').astype('int64')
    dollar_inr_rate = 72
    margin = 0.12
    processed['Rate (USD)'] = processed['Rate']/dollar_inr_rate
    processed['Rate per Package (USD)']=processed['Pieces per Unit']*processed['Rate']*(1+margin)/dollar_inr_rate
    processed['Total Amount (USD)'] = processed['Rate per Package (USD)']*processed['QTY']
    processed.index=processed.index=range(1,len(processed)+1)
    processed.rename_axis('Sr. No.',axis=0,inplace=True)
    return processed[['Product', 'Packing Details', 'QTY','Rate per Package (USD)','Total Amount (USD)']].round(decimals=2)


def transform_currentUSDRate(processed):
    '''ip_file --> unprocessed dataframe
    This function transforms the processed dataframe and returns the tranformed final output dataframe
    '''
    processed['Pieces per Unit'] = processed['Packing Details'].str.extract(r'[A-Za-z0-9]+\sx\s(\d+)[A-Za-z]*').astype('int64')
    dollar_inr_rate = getUSD_INR_rate()
    margin = 0.12
    processed['Rate (USD)'] = processed['Rate']/dollar_inr_rate
    processed['Rate per Package (USD)']=processed['Pieces per Unit']*processed['Rate']*(1+margin)/dollar_inr_rate
    processed['Total Amount (USD)'] = processed['Rate per Package (USD)']*processed['QTY']
    processed.index=processed.index=range(1,len(processed)+1)
    processed.rename_axis('Sr. No.',axis=0,inplace=True)
    return processed[['Product', 'Packing Details', 'QTY','Rate per Package (USD)','Total Amount (USD)']].round(decimals=2)

def etl_prices(file_loc:str):
    '''file_loc --> file location string
    This function will clean, tranform the file
    Returns the final dataframe
    '''
    ip = read_input(file_loc)
    product_details = read_productdetails(file_loc)
    preprocessed_ip = preprocess(ip,product_details)
    return transform(preprocessed_ip)