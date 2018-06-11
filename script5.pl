#!"C:\perl64\bin\perl.exe"

use strict;
use warnings;use Data::Dumper qw(Dumper);
use List::MoreUtils 'first_index'; 
use feature qw(say);

sub recurse {
    my $chars = shift;
    my $startloc;
    my $endloc;

    $startloc = index($chars, "\"", 0);

    if ($startloc >= 0) {
        $endloc = index($chars, "\"", $startloc+1);

        substr($chars, $startloc, $endloc-$startloc+1) = " " x  ($endloc-$startloc+1); 
        
        $chars = recurse($chars);
    } 
    
    return    $chars;
    
}



##############################################
my $filename = 'test.txt';
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";
 
 my $pattern = "//";
my $teststring;
my $leng;

while (my $row = <$fh>) {
	chomp $row;
  
	$leng = length($row); 
    
            if ($leng > 0){		$teststring = recurse($row);

		my $startloc = index($teststring, $pattern, 0);  
		if ($startloc >= 0) {			substr($row, $startloc, $leng-$startloc) = " " x  ($leng-$startloc); 
		}
  
  
  
		print "$row\n";
        }
  }
