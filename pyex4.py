#pyex4.py - Read multiple records file and write it as single line records

import re 

# input_roster is one string containing everything 
input_roster = open('cs176roster.webadvisor.txt', 'r').read()

# student_pattern containd a regex that defines one student 
student_pattern = re.compile('.+, .+\n[0-9]{7}')

#students is a list of matching strings 
students = student_pattern.findall(input_roster)

#print(students)

for student in students:
    student = student.replace('\n', ', s') # string.replace()
    print(student)

outfile = open('roster2.txt', 'w')
for student in students:
    student = student.replace('\n', ', s') # string.replace()
    outfile.write(student + '\n')

outfile.close()