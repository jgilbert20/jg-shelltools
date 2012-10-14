#!/usr/bin/perl

my $s = shift @ARGV;

foreach my $n (@ARGV)
{
    my $old = $n;
    $n =~ s/([^\.]+)(\.\w+)$/$1/s;


    my $new = $n . $s . $2;
    
    die if -e $new;
    print "[$old] -> [$new]\n";
    rename $old, $new;
}
