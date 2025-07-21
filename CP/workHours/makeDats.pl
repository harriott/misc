#!/usr/bin/perl

# --------------------------------------------------------------------
# grab my personal WorkLogs into  *.dat  files
#
# in  $JHw/hours/  perl $misc/CP/workHours/makeDats.pl
# --------------------------------------------------------------------

use feature 'say';
use strict;  use warnings;
use Data::Printer;  # p @array
use File::Slurp;
use Scalar::Util qw(looks_like_number);

my @y2014;
my $datHeader = "period\tAdmin\tConstruction\tCafézoïde\tEmployment\tIT\tMusic\tResearch\tST\tTE\tTheatre\tWellbeing\tWriting\ttotals"; # tab separated column headers
push @y2014, $datHeader;
my @y2015 = @y2014;
my @y2016 = @y2014;
my @y2017 = @y2014;
my @y2018 = @y2014;
my @y2019 = @y2014;
my @y2020 = @y2014;
my @y2021 = @y2014;
my @y2022 = @y2014;
my @y2023 = @y2014;
my @y2024 = @y2014;
my @y2025m01 = @y2014;
my @y2025m02 = @y2014;
my @y2025m03 = @y2014;
my @y2025m04 = @y2014;
my @y2025m05 = @y2014;
my @y2025m06 = @y2014;
my @y2025m07 = @y2014;
my @y2025m08 = @y2014;
my @y2025m09 = @y2014;
my @y2025m10 = @y2014;
my @y2025m11 = @y2014;

my @rc = read_file('roles-copy.md');
my @rcc = map { chomp; $_ } @rc; # remove CRs - useful when printing for debug, but see EOL comment below
# print "$rcc[0]\n"; print "$rcc[1]\n"; print "$rcc[2]\n";
my @rccu = grep /^(##|- ).*/, @rcc; # clears out 4k definitely useless lines
# p @rccu;
if ( $rcc[0] eq '' ) { print "no line\n" }
# die('died for debugging'); # will return an error to Bash

my ($minAd, $minCs, $minCz, $minEm, $minIT, $minMu, $minRe, $minST, $minTE, $minTh, $minWb, $minWr, $rcMinutes);
my $rcBarName = 'none';
my $rcChart = 'notYet';
# print "\$rcChart (tested by Scalar::Util) is", looks_like_number($rcChart) ? '' : ' not', " a number\n";
my $rcYear = 'notYet';
sub pushCounts {
  my $minTotal = $minAd+$minCs+$minCz+$minEm+$minIT+$minMu+$minRe+$minST+$minTE+$minTh+$minWb+$minWr;
  my $hAd = int($minAd/60+.5);
  my $hCs = int($minCs/60+.5);
  my $hCz = int($minCz/60+.5);
  my $hEm = int($minEm/60+.5);
  my $hIT = int($minIT/60+.5);
  my $hMu = int($minMu/60+.5);
  my $hRe = int($minRe/60+.5);
  my $hST = int($minST/60+.5);
  my $hTE = int($minTE/60+.5);
  my $hTh = int($minTh/60+.5);
  my $hWb = int($minWb/60+.5);
  my $hWr = int($minWr/60+.5);
  my $hTotal = int($minTotal/60+.5);
  my $hours = "$rcBarName\t$hAd\t$hCs\t$hCz\t$hEm\t$hIT\t$hMu\t$hRe\t$hST\t$hTE\t$hTh\t$hWb\t$hWr\t$hTotal";
  # print "\$rcChart: $rcChart\n";
  if ($rcChart eq '2014')           { push @y2014,    $hours; }
  if ($rcChart eq '2015')           { push @y2015,    $hours; }
  if ($rcChart eq '2016')           { push @y2016,    $hours; }
  if ($rcChart eq '2017')           { push @y2017,    $hours; }
  if ($rcChart eq '2018')           { push @y2018,    $hours; }
  if ($rcChart eq '2019')           { push @y2019,    $hours; }
  if ($rcChart eq '2020')           { push @y2020,    $hours; }
  if ($rcChart eq '2021')           { push @y2021,    $hours; }
  if ($rcChart eq '2022')           { push @y2022,    $hours; }
  if ($rcChart eq '2023')           { push @y2023,    $hours; }
  if ($rcChart eq '2024')           { push @y2024,    $hours; }
  if ($rcChart eq 'January 2025')   { push @y2025m01, $hours; }
  if ($rcChart eq 'February 2025')  { push @y2025m02, $hours; }
  if ($rcChart eq 'March 2025')     { push @y2025m03, $hours; }
  if ($rcChart eq 'April 2025')     { push @y2025m04, $hours; }
  if ($rcChart eq 'May 2025')       { push @y2025m05, $hours; }
  if ($rcChart eq 'June 2025')      { push @y2025m06, $hours; }
  if ($rcChart eq 'July 2025')      { push @y2025m07, $hours; }
  if ($rcChart eq 'August 2025')    { push @y2025m08, $hours; }
  if ($rcChart eq 'September 2025') { push @y2025m09, $hours; }
  if ($rcChart eq 'October 2025')   { push @y2025m10, $hours; }
  if ($rcChart eq 'November 2025')  { push @y2025m11, $hours; }
}
while (@rccu) {
  my $rcLine = shift @rccu;
  $rcLine =~ s/\R//; # get rid of troublesome persistent EOL
  if ($rcLine =~ /^## 20|^## January|^## February|^## March|^## April|^## May|^## June|^## July|^## August|^## September|^## October|^## November/) {
    unless ($rcChart eq 'notYet') {pushCounts}
    $rcChart = $rcLine;
    $rcChart =~ s/## //;
    $rcBarName = 'none';
    next;
  }
  unless ($rcChart eq 'notYet') {
    if ($rcLine =~ /^### /) {
      unless ($rcBarName eq 'none') {pushCounts}
      $rcBarName = $rcLine;
      $rcBarName =~ s/### //;
      # print "\$rcBarName: $rcBarName\n";
      # if ($rcBarName =~ /December 2024/) { last; } # early end
      if ($rcBarName eq 'June 2025') { last; }
      ($minAd, $minCs, $minCz, $minEm, $minIT, $minMu, $minRe, $minST, $minTE, $minTh, $minWb, $minWr, $rcMinutes) = (0)x13;
    } elsif ($rcLine =~ /^- Ad:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- Ad:(\d*):.*/$1/; $minAd = $minAd+$rcMinutes;
    } elsif ($rcLine =~ /^- Cs:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- Cs:(\d*):.*/$1/; $minCs = $minCs+$rcMinutes;
    } elsif ($rcLine =~ /^- Cz:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- Cz:(\d*):.*/$1/; $minCz = $minCz+$rcMinutes;
    } elsif ($rcLine =~ /^- Em:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- Em:(\d*):.*/$1/; $minEm = $minEm+$rcMinutes;
    } elsif ($rcLine =~ /^- IT:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- IT:(\d*):.*/$1/; $minIT = $minIT+$rcMinutes;
    } elsif ($rcLine =~ /^- Mu:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- Mu:(\d*):.*/$1/; $minMu = $minMu+$rcMinutes;
    } elsif ($rcLine =~ /^- Re:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- Re:(\d*):.*/$1/; $minRe = $minRe+$rcMinutes;
    } elsif ($rcLine =~ /^- ST:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- ST:(\d*):.*/$1/; $minST = $minST+$rcMinutes;
    } elsif ($rcLine =~ /^- TE:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- TE:(\d*):.*/$1/; $minTE = $minTE+$rcMinutes;
    } elsif ($rcLine =~ /^- Th:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- Th:(\d*):.*/$1/; $minTh = $minTh+$rcMinutes;
    } elsif ($rcLine =~ /^- Wb:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- Wb:(\d*):.*/$1/; $minWb = $minWb+$rcMinutes;
    } elsif ($rcLine =~ /^- Wr:\d/) {
      $rcMinutes = $rcLine; $rcMinutes =~ s/^- Wr:(\d*):.*/$1/; $minWr = $minWr+$rcMinutes;
    }
    # print "\$rcMinutes: $rcMinutes\n";
  }
}
# These Data::Printer calls give messy output, but still the best debugging option:
  # p @y2014;
  # p @y2015;
  # p @y2017;
  # p @y2018;
  # p @y2019;
  # p @y2020;
  # p @y2021;
  # p @y2022;
  # p @y2023;
  # p @y2024;
  # p @y2025m01;
  # p @y2025m02;
  # p @y2025m03;
  # p @y2025m04;
  # p @y2025m05;
  # p @y2025m06;
  # p @y2025m07;
  # p @y2025m08;
  # p @y2025m09;
  # p @y2025m10;
  # p @y2025m11;

my $fh;
open $fh, '>', 'y2014.dat' or die "Can't open 'y2014.dat': $!\n"; print $fh join("\n",@y2014),"\n"; close $fh;
open $fh, '>', 'y2015.dat' or die "Can't open 'y2015.dat': $!\n"; print $fh join("\n",@y2015),"\n"; close $fh;
open $fh, '>', 'y2016.dat' or die "Can't open 'y2016.dat': $!\n"; print $fh join("\n",@y2016),"\n"; close $fh;
open $fh, '>', 'y2017.dat' or die "Can't open 'y2017.dat': $!\n"; print $fh join("\n",@y2017),"\n"; close $fh;
open $fh, '>', 'y2018.dat' or die "Can't open 'y2018.dat': $!\n"; print $fh join("\n",@y2018),"\n"; close $fh;
open $fh, '>', 'y2019.dat' or die "Can't open 'y2019.dat': $!\n"; print $fh join("\n",@y2019),"\n"; close $fh;
open $fh, '>', 'y2020.dat' or die "Can't open 'y2020.dat': $!\n"; print $fh join("\n",@y2020),"\n"; close $fh;
open $fh, '>', 'y2021.dat' or die "Can't open 'y2021.dat': $!\n"; print $fh join("\n",@y2021),"\n"; close $fh;
open $fh, '>', 'y2022.dat' or die "Can't open 'y2022.dat': $!\n"; print $fh join("\n",@y2022),"\n"; close $fh;
open $fh, '>', 'y2023.dat' or die "Can't open 'y2023.dat': $!\n"; print $fh join("\n",@y2023),"\n"; close $fh;
open $fh, '>', 'y2024.dat' or die "Can't open 'y2024.dat': $!\n"; print $fh join("\n",@y2024),"\n"; close $fh;
open $fh, '>', 'y2025m01.dat' or die "Can't open 'y2025m01.dat': $!\n"; print $fh join("\n",@y2025m01),"\n"; close $fh;
open $fh, '>', 'y2025m02.dat' or die "Can't open 'y2025m02.dat': $!\n"; print $fh join("\n",@y2025m02),"\n"; close $fh;
open $fh, '>', 'y2025m03.dat' or die "Can't open 'y2025m03.dat': $!\n"; print $fh join("\n",@y2025m03),"\n"; close $fh;
open $fh, '>', 'y2025m04.dat' or die "Can't open 'y2025m04.dat': $!\n"; print $fh join("\n",@y2025m04),"\n"; close $fh;
open $fh, '>', 'y2025m05.dat' or die "Can't open 'y2025m05.dat': $!\n"; print $fh join("\n",@y2025m05),"\n"; close $fh;
open $fh, '>', 'y2025m06.dat' or die "Can't open 'y2025m06.dat': $!\n"; print $fh join("\n",@y2025m06),"\n"; close $fh;
# open $fh, '>', 'y2025m07.dat' or die "Can't open 'y2025m07.dat': $!\n"; print $fh join("\n",@y2025m07),"\n"; close $fh;
# open $fh, '>', 'y2025m08.dat' or die "Can't open 'y2025m08.dat': $!\n"; print $fh join("\n",@y2025m08),"\n"; close $fh;
# open $fh, '>', 'y2025m09.dat' or die "Can't open 'y2025m09.dat': $!\n"; print $fh join("\n",@y2025m09),"\n"; close $fh;
# open $fh, '>', 'y2025m10.dat' or die "Can't open 'y2025m10.dat': $!\n"; print $fh join("\n",@y2025m10),"\n"; close $fh;
# open $fh, '>', 'y2025m11.dat' or die "Can't open 'y2025m11.dat': $!\n"; print $fh join("\n",@y2025m11),"\n"; close $fh;

