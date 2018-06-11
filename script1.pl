#!"C:\perl64\bin\perl.exe"
# get total arg passed to this script

use Data::Dumper;


sub atest {
    my $test = shift;
    my $strV = shift;
    my $count;
    my $char; 
    for (my $i=32; $i <= 126; $i++) { 
	
	$char = chr($i); 
	$count = () = $strV =~ /\Q$char/g;
	   
	push @{$test->{chr($i)}}, $count;
    }
}

my $total = $#ARGV + 1;
my $counter = 1;
 
# get script name
my $scriptname = $0;
 
print "Total args passed to $scriptname : $total\n";
 

print "Arg # $ARGV[0]\n"; 

my $strV =   $ARGV[0];

my $char = "s";
my $count = () = $strV =~ /\Q$char/g;
print "count<$count> of <$char> in <$strV>\n";




$count = $strV =~ tr/s//; 
print $count


my %test;
atest(\%test, $strV);


# print Dumper \%test;


my @keys = sort { $test{$b}[0] <=>  $test{$a}[0] } keys %test;

my $string ;

foreach my $key ( @keys ) {
    if ($test{$key}[0] >0) {	
	
      $string = '#' x $test{$key}[0];	    
      print  "$key:  $string\n" ;
    }  
}

