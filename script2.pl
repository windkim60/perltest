#!"C:\perl64\bin\perl.exe"
# get total arg passed to this script

use Data::Dumper;


%last_name = (
    "Mary"    => "Li",
    "James"        =>  "O'Day" ,
    "Thomas"       =>  "Miller",
    "William"    =>  "Garcia" ,
      "abc"    =>  "Garcia" ,
           "Abc"    =>  "Garcia" ,
    "Elizabeth"        =>  "Davis" ,
);


foreach my $name(sort { (length($last_name{$b}) <=>  length($last_name{$a})) ||
 ($a cmp $b) } keys %last_name) {
    my $hobby = $last_name{$name};
    
    print "$name: $hobby\n";
}
