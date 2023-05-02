# perlex3.pl - Process a roster and print the sorted roster. 
# Michael Ivanicki, CS-371, Spring 2023

while($student = <STDIN>) {
    # Parse one student record in $student into $last, $first, $email:
    # Change split delomoter to deal with irregular spaces around ,:
    ($last, $first, $email)= split /\s*, \s*/, $student;
    push @roster, "$first. $last, $email";
}

foreach $student (sort @roster) {
    print $student;
}