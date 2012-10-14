#!/usr/bin/perl

my $s = shift @ARGV;

use Date::Format;
my $i = 0;
use File::Find;
find(\&wanted, $s);
           sub wanted {

my $dir = $File::Find::dir;#  = /some/path/
my $of=           $_  ;#              = foo.ext

my $fp =           $File::Find::name;   # = /some/path/foo.ext

next unless -f $_;

$fp = $of;

    my $old =  $_;
   # $n =~ s/([^\.]+)(\.\w+)$/$1/s;



die "cant stat [$fp]: $!" unless -e $fp;
my $t = (stat( $fp))[9];
#my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime($t); 


my $prefix = time2str( "%Y%m%d%H%M%S-", $t);

my $new =  $prefix . $_;
    
    die if -e $new;
    print "[$old] -> [$new]\n";
   rename $old, $new or die "Fail to rename - $!";



}
