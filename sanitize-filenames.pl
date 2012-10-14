#!/usr/bin/perl

use File::Basename;

foreach my $fn (@ARGV)
{
    my $bn = basename $fn;
    my $dn = dirname $fn;

    my $newname = $bn;

    $newname =~ s/[^A-Za-z0123456789\.\(\)\_]/\_/g;
    $newname =~ s/\_+/\_/g;

    my $new = $dn . "/" . $newname;

    print "Considering [$fn] [$dn] - [$bn]\n";
    print "   $fn  -> [$new]\n";

    rename $fn, $new;
# foo
}
