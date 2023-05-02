# perlex2.pl - Output only words that are 7 chars or fewer in a word list 
# Michael Ivanicki, CS-371, Spring 2023 

while(<STDIN>) { #STDIN will be assigned to the $_ default variable
    chomp($_);
    #if ( length $_ <= 7 ) {
     #   print $_, "\n";
    #}

    # Use regex match:
    if {$_ =~ m/^.{1,7}$/} {
        print $_, "\n";
    }
}