# perlex1.pl - Count word length occurrences in a word list 
# Michael Ivanicki, CS-371, Spring 2023

# 1 - Read each line from the input through STDIN
while( $word = <STDIN>) {
    #2 - Get length of each word.
    chomp($word); # Remove the trailing \n from each $word.
    $length = length($word);

    #3 - Increment correct word length array element using $length.
    $wordlength[$length]++; # @wordlength array is created on the fly.
}

#4 - After the loop, print @wordlength array elements 
print "Word length", "\t", "Occurrences", "\n\n";

for(my $i = 1; $i <= $#wordlength; $i++) {
   # print $i, "\t\t", $wordlength[$i], "\n";

    # alt code to check for non-existent array element
    if(exists $wordlength[$i]) {
        print $i, "\t\t", $wordlength[$i], "\n";
    }
    else {
        print $i, "\t\t", 0, "\n";
    }
}