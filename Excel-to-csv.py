
# coding: utf-8

# In[5]:

import pandas as pd
import os


# In[6]:

pwd


# In[7]:

os.chdir(r"C:\Users\admin\Documents\TEMP\testcsv")


# In[8]:

pwd


# In[11]:

data_xls = pd.read_excel('2009 28-43.xlsx')
data_xls.to_csv('your_csv.csv', encoding='utf-8')


# In[12]:

data_xls = pd.read_excel('2009 44-53.xlsx')
data_xls.to_csv('your_csv2.csv', encoding='utf-8')


# In[17]:

fname = '2009 54-94.xlsx'
nname = os.path.splitext(fname)
data_xls = pd.read_excel(fname)
data_xls.to_csv(nname[0] + '.csv', encoding='utf-8')


# In[16]:

nname[0]


# In[20]:

import glob

for filename in glob.iglob(r"C:\Users\admin\Box Sync\CE_Project\York_SO\source\Assessor_Data\*.xlsx"):
    fname = filename
    nname = os.path.splitext(fname)
    data_xls = pd.read_excel(fname)
    data_xls.to_csv(nname[0] + '.csv', encoding='utf-8')


# In[ ]:
