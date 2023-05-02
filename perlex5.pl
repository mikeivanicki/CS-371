# perlex5.pl - roster program that uses commandline arguments 

# help subroutine that is called when program is run with no arguments or -h
sub help {
    print " 
Usage: perl -w perlex5.pl <option> roster1, roster2 ... rosterN

where <option> is: 
    -help, --help, -h; print this usage message
    -first or --first: display the class roster sorted by first name
    -last or --last  : display the class roster sorted by last name
    -id or --id      : display the class roster sorted by student ID
";
} # end help()

# sortby() function
sub sortby{
    if( $_[0] =~ m/-f/ ) { $sortby = "first"; } # $_[0] = 1st argument to this function 
    elsif( $_[0] =~ m/-l/) { $sortby = "last"; }
    else{$sortby = "id"; }
}

# if no command line args, $#ARGV is -1 
if ($#ARGV == -1 || $ARGV[0] =~ m/-h/) {
    help();
    exit[1]; #don't proceed after displaying help 
}

# process the command line arguments that are options 
$option = shift @ARGV;
sortby($option);

while ($studentline = <>) {
    chomp($studentline); # remove hidden \n
    ($last, $first, $email) = split /\s*, \s*/, $studentline;
    ($id) = $email =~ m/(s\d{7})/;

    $roster{$id} = "$last, $first";
}

# print key/value pairs of %roster using $sortby 
if($sortby =~ m/last/) { #also works: $sortby eq "last"
    while (($id, $name) = each %roster) {
        push @last, "$name, $id";
    }
    foreach $student (sort @last) {
        print "$student\n"; 
    } 
}
elsif($sortby =~ m/first/) {
    while (($id, $name) = each %roster) {
        # reverse $first and $last
        $name =~ s/(.+), (.+)/$2 $1/;
        push @first, "$name, $id";
    }
    print "$_\n" foreach(sort @first);
}
else{
    # sort by $id
    foreach $id (sort keys %roster) {
        print "$id, $roster{$id}\n";
    }
}