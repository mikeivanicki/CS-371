# perlex4.pl - populte a has with data from a roster 
# Michael Ivanicki, CS-371, Spring 2023

while($student = <STDIN>) {
    chomp($student);
    ($last, $first, $email)= split /\s*, \s*/, $student;

    # insert student into %roster hash, with key = $id;
    # must get $id from $email first 
    #($id, $domain) = split /@/, $email;

    # use regular expression substitution to get $id 
   # $email =~ s/\@monmouth\.edu//; # delete @monmouth.edu in $email 
   # $id = $email;

    #use regex group matching 
    # in this case, the match operation is not boolean but returns 
    # a list of matches, so we need to put $id in a list 
   # ($id) = $email =~ m/(s\d{7})/; # also works: s[0-9]{7}

    # use regex groups in a substitutionl
    # replace the entire email address with just the id in $1 (group 1)
    $email =~ s/(s\d{7}).*/$1/;
    $id = $email;

    # add key/value pair to %roster hash
    $roster{$id} = "$last, $first";
}

# print key/value pairs in %roster 
foreach $id (sort(keys(%roster))) {
    print "$id, $roster{$id}\n";
}