#!/usr/bin/env python
# coding: utf-8

# In[2]:


import csv


# In[5]:


ages = []
rows = []

with open('master.csv') as master:
    csvreader = csv.reader(master, delimiter=',')    
    
    fields = next(csvreader)
    
    for row in csvreader:
        age = row[3].split(' ')[0].strip('+').split('-')
        
        if (len(age) == 2):
            row.append(age[0])
            row.append(age[1])
        else:
            row.append(age[0])
            row.append('120')
        row.remove(row[3])
        row.remove(row[6])
        
        rows.append(row)
        
    fields.remove(fields[3])
    fields.remove(fields[6])
    
    fields.append('age_lb')
    fields.append('age_ub')
    
    with open('newmaster.csv', 'w') as newfile:
        csvwriter = csv.writer(newfile)
        
        csvwriter.writerow(fields)
        
        csvwriter.writerows(rows)


# In[ ]:





# In[ ]:




