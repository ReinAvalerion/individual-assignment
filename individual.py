import csv
import json

with open('philippines.json') as file:
    phillipines = json.load(file)

header = ['year', 'country', 'type_of_violence']

with open('philippines.csv', 'w', newline='') as file: 
    filewriter = csv.writer(file)
    filewriter.writerow(header)
    for conflict in phillipines:
        if conflict['country'] == 'Philippines':
            filewriter.writerow([conflict['year'], conflict['country'], conflict['type_of_violence']])

with open('thailand.json') as file:
    thailand = json.load(file)

with open('thailand.csv', 'w', newline='') as file: 
    filewriter = csv.writer(file)
    filewriter.writerow(header)
    for conflict in thailand:
        if conflict['country'] == 'Thailand':
            filewriter.writerow([conflict['year'], conflict['country'], conflict['type_of_violence']])

#    print(f"Country: {conflict['country']}, type of violence: {conflict['type_of_violence']}")


# for conflict in philippines: 
#     for key in conflict.keys(): 
#         if key not in header: 
#             header.append(key)

# with open('philippines.csv', 'w') as file: 
#     writer = csv.DictWriter(file , fieldnames=header , lineterminator='\n', delimiter=',')
     
#     writer.writeheader()
    
#     for conflict in philippines:
#         writer.writerow(conflict)