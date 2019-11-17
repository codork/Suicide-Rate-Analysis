#!/usr/bin/env python
# coding: utf-8

# In[1]:


import csv


# In[2]:


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
        #remove 'age' column in old format
        row.remove(row[3])
        #remove 'country-year' column
        row.remove(row[6])
        #remove 'HDI'
        row.remove(row[8])

        rows.append(row)

    fields.remove(fields[3])
    fields.remove(fields[6])
    fields.remove(fields[8])

    fields.append('age_lb')
    fields.append('age_ub')

    with open('suicide_data.csv', 'w') as newfile:
        csvwriter = csv.writer(newfile)

        csvwriter.writerow(fields)

        csvwriter.writerows(rows)

