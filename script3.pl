#!"C:\perl64\bin\perl.exe"


use Data::Dumper;

use Regexp::Common qw /balanced/;

my @names = (
  "()[]",
  "{()[]}",
  "[{}(){()}]",
  "[{]}",
  "({}[)]",
  "][[[][[]",         
  "]][]][][[[[][[",       
  "[]",                   
  "][",                  
  "][[][]]]]]",           
  "][]]",                 
  "]][][][]]]",           
  "[[[[][[[[][[]]",       
  "][[]][[[[[[[[[]]][",   
 "]]]][][[][]]][][[[",   
 "[][[]][][][[[]",       
 "]]",                   
 "[][[[]]]",             
 "][",                   
 "[]][",                 
 "][[]][]]][[]",         
 "][][]]",               
 "[]",                   
 "[[[[[[][[[[[][][",     
 "[[][[][]");            


 ##############################
 


sub get_answer {
  my $string = shift;
  my %close = qw/ { } [ ] ( ) /;
  my @stack;

  for (split '', $string) {
    if (my $close = $close{ $_ }) {
        push @stack, $close;
        next;
    }
    unless (@stack) {
        return "";
    }
    if ($stack[-1] eq $_) {
        pop @stack;
        next;
    }
    return "";
}

if (@stack) {
    return "";
}
return "ok";

}

foreach my $text (@names) {
   
    if ( get_answer($text)  eq "ok" ){
         print "$text  : balanced \n";      
    } else{
         print "$text  : unbalanced \n";      
    }    
       
     
}    