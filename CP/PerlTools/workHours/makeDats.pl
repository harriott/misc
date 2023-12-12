#!/usr/bin/perl

# --------------------------------------------------------------------
# grab my personal WorkLogs into  *.dat  files
#
# in  $JHw/hours/  perl $misc/CP/PerlTools/workHours/makeDats.pl
# --------------------------------------------------------------------

use feature 'say';
use strict;  use warnings;
use Data::Printer;  # p @array

my @datArrays = ('@y2014', '@y2015', '@y2016', '@y2017', '@y2018', '@y2019', '@y2020', '@y2021', '@y2022', '@y2022m01', '@y2022m02', '@y2022m03', '@y2022m04', '@y2022m05', '@y2022m06', '@y2022m07', '@y2022m08', '@y2022m09', '@y2022m10', '@y2022m11');
my @datFiles = ('y2014.dat', 'y2015.dat', 'y2016.dat', 'y2017.dat', 'y2018.dat', 'y2019.dat', 'y2020.dat', 'y2021.dat', 'y2022.dat', 'y202201.dat', 'y202202.dat', 'y202203.dat', 'y202204.dat', 'y202205.dat', 'y202206.dat', 'y202207.dat', 'y202208.dat', 'y202209.dat', 'y202210.dat', 'y202211.dat');

my @rc;
my $rc = 'roles-copy.md';
open my $fh, '<', $rc or die "Can't open $rc: $!\n"; @rc = <$fh>; close $fh; # get array
my @rcc = map { chomp; $_ } @rc; # remove CRs
@rcc = grep { $_ ne '' } @rcc; # remove empty elements

my @y2014; my @y2015; my @y2016; my @y2017; my @y2018; my @y2019; my @y2020; my @y2021; my @y2022;
my $rcLine;
my $rcYear = '0000';
while (@rcc) {
  $rcLine = shift @rcc;
  $rcLine =~ s/^### (Mar.*)/▶$1/;
  $rcLine =~ s/^### (Feb.*)/▶$1/;
  $rcLine =~ s/^### (Apr.*)/▶$1/;
  $rcLine =~ s/^### (May.*)/▶$1/;
  $rcLine =~ s/^### (Jun.*)/▶$1/;
  $rcLine =~ s/^### (Jul.*)/▶$1/;
  $rcLine =~ s/^### (Aug.*)/▶$1/;
  $rcLine =~ s/^### (Sep.*)/▶$1/;
  $rcLine =~ s/^### (Oct.*)/▶$1/;
  $rcLine =~ s/^### (Nov.*)/▶$1/;
  $rcLine =~ s/^### (Dec.*)/▶$1/;
  unless ($rcLine =~ /^#### .*/) {
    if ($rcYear == '2014' ) { push @y2014, $rcLine; }
    elsif ($rcYear == '2015' ) { push @y2015, $rcLine; }
    elsif ($rcYear == '2016' ) { push @y2016, $rcLine; }
    elsif ($rcYear == '2017' ) { push @y2017, $rcLine; }
    elsif ($rcYear == '2018' ) { push @y2018, $rcLine; }
    elsif ($rcYear == '2019' ) { push @y2019, $rcLine; }
    elsif ($rcYear == '2020' ) { push @y2020, $rcLine; }
    elsif ($rcYear == '2021' ) { push @y2021, $rcLine; }
    elsif ($rcYear == '2022' ) { push @y2022, $rcLine; }
    if ($rcLine =~ '^## 20' ) {
      $rcYear = $rcLine;
      $rcYear =~ s/## //;
    }
  }
}
p @y2022;

open $fh, '>', 'y2014.dat' or die "Can't open 'y2014.dat': $!\n"; print $fh join("\n",@y2014),"\n"; close $fh;
open $fh, '>', 'y2015.dat' or die "Can't open 'y2015.dat': $!\n"; print $fh join("\n",@y2015),"\n"; close $fh;
open $fh, '>', 'y2016.dat' or die "Can't open 'y2016.dat': $!\n"; print $fh join("\n",@y2016),"\n"; close $fh;
open $fh, '>', 'y2017.dat' or die "Can't open 'y2017.dat': $!\n"; print $fh join("\n",@y2017),"\n"; close $fh;
open $fh, '>', 'y2018.dat' or die "Can't open 'y2018.dat': $!\n"; print $fh join("\n",@y2018),"\n"; close $fh;
open $fh, '>', 'y2019.dat' or die "Can't open 'y2019.dat': $!\n"; print $fh join("\n",@y2019),"\n"; close $fh;
open $fh, '>', 'y2020.dat' or die "Can't open 'y2020.dat': $!\n"; print $fh join("\n",@y2020),"\n"; close $fh;
open $fh, '>', 'y2021.dat' or die "Can't open 'y2021.dat': $!\n"; print $fh join("\n",@y2021),"\n"; close $fh;
open $fh, '>', 'y2022.dat' or die "Can't open 'y2022.dat': $!\n"; print $fh join("\n",@y2022),"\n"; close $fh;

