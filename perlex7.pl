# perlex7.pl  - parse data from html

use strict; 
use LWP::Simple;

my $news = get('https://www.monmouth.edu/department-of-csse/news-events'); # $news is a single string containing html 

# parse out all headlines in $news into @headlines array 
my @headlines = $news =~ m/<strong>(.+)<\/strong>/g;

foreach my $hl (@headlines){
    print "$hl\n";
}

# read all anchor names into @anames array 
my @anames = $news =~ m/<a class="anchorMargin" name="(.+)">/g;

foreach my $an (@anames) {
    print"$an\n";
}

print "Headlines: ", ($#headlines + 1), "\n"; 
print "Anchor names: ", ($#anames + 1), "\n";