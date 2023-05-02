# perlex6.pl - read roster.txt into a single variable 

open FILE, "<roster.txt";
$roster = do {local $/; <FILE>};

#print $roster;

# read all the student IDs in $roster into @ids array 
@ids = $roster =~ m/s\d{7}/g; # g = global 

print "$_ " foreach (@ids);