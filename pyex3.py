# pyex3.py - Read roster.txt fields into a dictionary 

input_file = open('roster.txt', 'r')

roster = {} # Must declare empty dict 

for student in input_file.readlines(): # .readlines() creates list of strings 
    [last, first, email] = student.split(',') # assignable list on left of = 

    last = last.strip() # remove all leading/trailing spaces
    first = first.strip()
    email = email.strip() # also removes \n from end of email

    # email = email.rstrip() # "chomp" the \n

    # get id from email 
    # [id, domain] = email.split('@')
    id = email.replace('@monmouth.edu', '')

    # Insert student into roster dicr with key = id 
    roster[id] = last + ", " + first # new key:value pair

# Print roster 
for id in sorted(roster.keys()):
    print(id + ', ' + roster[id])