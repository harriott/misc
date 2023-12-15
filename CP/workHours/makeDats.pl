#!/usr/bin/perl

# --------------------------------------------------------------------
# grab my personal WorkLogs into  *.dat  files
#
# in  $JHw/hours/  perl $misc/CP/workHours/makeDats.pl
# --------------------------------------------------------------------

use feature 'say';
use strict;  use warnings;
use Data::Printer;  # p @array

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
my @y2023m01 = @y2014;
my @y2023m02 = @y2014;
my @y2023m03 = @y2014;
my @y2023m04 = @y2014;
my @y2023m05 = @y2014;
my @y2023m06 = @y2014;
my @y2023m07 = @y2014;
my @y2023m08 = @y2014;
my @y2023m09 = @y2014;
my @y2023m10 = @y2014;
my @y2023m11 = @y2014;

my $rc = 'roles-copy.md';
open my $fh, '<', $rc or die "Can't open $rc: $!\n"; my @rc = <$fh>; close $fh; # get array
my @rcc = map { chomp; $_ } @rc; # remove CRs
@rcc = grep { $_ ne '' } @rcc; # remove empty elements
# p @rcc;

my ($minAd, $minCs, $minCz, $minEm, $minIT, $minMu, $minRe, $minST, $minTE, $minTh, $minWb, $minWr);
my $rcBarName = 'none';
my $rcChart = 'notYet';
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
  # print "$hours\n";
  if ($rcChart eq '2014')           { push @y2014,    $hours; }
  if ($rcChart eq '2015')           { push @y2015,    $hours; }
  if ($rcChart eq '2016')           { push @y2016,    $hours; }
  if ($rcChart eq '2017')           { push @y2017,    $hours; }
  if ($rcChart eq '2018')           { push @y2018,    $hours; }
  if ($rcChart eq '2019')           { push @y2019,    $hours; }
  if ($rcChart eq '2020')           { push @y2020,    $hours; }
  if ($rcChart eq '2021')           { push @y2021,    $hours; }
  if ($rcChart eq '2022')           { push @y2022,    $hours; }
  if ($rcChart eq 'January 2023')   { push @y2023m01, $hours; }
  if ($rcChart eq 'February 2023')  { push @y2023m02, $hours; }
  if ($rcChart eq 'March 2023')     { push @y2023m03, $hours; }
  if ($rcChart eq 'April 2023')     { push @y2023m04, $hours; }
  if ($rcChart eq 'May 2023')       { push @y2023m05, $hours; }
  if ($rcChart eq 'June 2023')      { push @y2023m06, $hours; }
  if ($rcChart eq 'July 2023')      { push @y2023m07, $hours; }
  if ($rcChart eq 'August 2023')    { push @y2023m08, $hours; }
  if ($rcChart eq 'September 2023') { push @y2023m09, $hours; }
  if ($rcChart eq 'October 2023')   { push @y2023m10, $hours; }
  if ($rcChart eq 'November 2023')  { push @y2023m11, $hours; }
}
while (@rcc) {
  my $rcLine = shift @rcc;
  if ($rcLine =~ /^## 20|^## January|^## February|^## March|^## April|^## May|^## June|^## July|^## August|^## September|^## October|^## November|^## December/) {
    unless ($rcChart eq 'notYet') {pushCounts}
    $rcChart = $rcLine;
    $rcChart =~ s/## //;
    # print "$rcChart\n";
    $rcBarName = 'none';
    next;
  }
  unless ($rcChart eq 'notYet') {
    if ($rcLine =~ /^### /) {
      # print "$rcBarName\n";
      unless ($rcBarName eq 'none') {pushCounts}
      $rcBarName = $rcLine;
      $rcBarName =~ s/### //;
      if ($rcBarName =~ /December 2023/) { last; }
      ($minAd, $minCs, $minCz, $minEm, $minIT, $minMu, $minRe, $minST, $minTE, $minTh, $minWb, $minWr) = (0)x12;
    } elsif ($rcLine =~ /^- Ad:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- Ad:(\d*):.*/$1/; $minAd = $minAd+$rcMinutes;
    } elsif ($rcLine =~ /^- Cs:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- Cs:(\d*):.*/$1/; $minCs = $minCs+$rcMinutes;
    } elsif ($rcLine =~ /^- Cz:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- Cz:(\d*):.*/$1/; $minCz = $minCz+$rcMinutes;
    } elsif ($rcLine =~ /^- Em:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- Em:(\d*):.*/$1/; $minEm = $minEm+$rcMinutes;
    } elsif ($rcLine =~ /^- IT:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- IT:(\d*):.*/$1/; $minIT = $minIT+$rcMinutes;
    } elsif ($rcLine =~ /^- Mu:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- Mu:(\d*):.*/$1/; $minMu = $minMu+$rcMinutes;
    } elsif ($rcLine =~ /^- Re:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- Re:(\d*):.*/$1/; $minRe = $minRe+$rcMinutes;
    } elsif ($rcLine =~ /^- ST:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- ST:(\d*):.*/$1/; $minST = $minST+$rcMinutes;
    } elsif ($rcLine =~ /^- TE:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- TE:(\d*):.*/$1/; $minTE = $minTE+$rcMinutes;
    } elsif ($rcLine =~ /^- Th:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- Th:(\d*):.*/$1/; $minTh = $minTh+$rcMinutes;
    } elsif ($rcLine =~ /^- Wb:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- Wb:(\d*):.*/$1/; $minWb = $minWb+$rcMinutes;
    } elsif ($rcLine =~ /^- Wr:\d/) {
      my $rcMinutes = $rcLine; $rcMinutes =~ s/^- Wr:(\d*):.*/$1/; $minWr = $minWr+$rcMinutes;
    }
  }
}
# p @y2014;
# p @y2015;
# p @y2017;
# p @y2018;
# p @y2019;
# p @y2020;
# p @y2021;
# p @y2022;
# p @y2023m01;
# p @y2023m02;
# p @y2023m03;
# p @y2023m04;
# p @y2023m05;
# p @y2023m06;
# p @y2023m07;
# p @y2023m08;
# p @y2023m09;
# p @y2023m10;
# p @y2023m11;

open $fh, '>', 'y2014.dat' or die "Can't open 'y2014.dat': $!\n"; print $fh join("\n",@y2014),"\n"; close $fh;
open $fh, '>', 'y2015.dat' or die "Can't open 'y2015.dat': $!\n"; print $fh join("\n",@y2015),"\n"; close $fh;
open $fh, '>', 'y2016.dat' or die "Can't open 'y2016.dat': $!\n"; print $fh join("\n",@y2016),"\n"; close $fh;
open $fh, '>', 'y2017.dat' or die "Can't open 'y2017.dat': $!\n"; print $fh join("\n",@y2017),"\n"; close $fh;
open $fh, '>', 'y2018.dat' or die "Can't open 'y2018.dat': $!\n"; print $fh join("\n",@y2018),"\n"; close $fh;
open $fh, '>', 'y2019.dat' or die "Can't open 'y2019.dat': $!\n"; print $fh join("\n",@y2019),"\n"; close $fh;
open $fh, '>', 'y2020.dat' or die "Can't open 'y2020.dat': $!\n"; print $fh join("\n",@y2020),"\n"; close $fh;
open $fh, '>', 'y2021.dat' or die "Can't open 'y2021.dat': $!\n"; print $fh join("\n",@y2021),"\n"; close $fh;
open $fh, '>', 'y2022.dat' or die "Can't open 'y2022.dat': $!\n"; print $fh join("\n",@y2022),"\n"; close $fh;
open $fh, '>', 'y2023m01.dat' or die "Can't open 'y2023m01.dat': $!\n"; print $fh join("\n",@y2023m01),"\n"; close $fh;
open $fh, '>', 'y2023m02.dat' or die "Can't open 'y2023m02.dat': $!\n"; print $fh join("\n",@y2023m02),"\n"; close $fh;
open $fh, '>', 'y2023m03.dat' or die "Can't open 'y2023m03.dat': $!\n"; print $fh join("\n",@y2023m03),"\n"; close $fh;
open $fh, '>', 'y2023m04.dat' or die "Can't open 'y2023m04.dat': $!\n"; print $fh join("\n",@y2023m04),"\n"; close $fh;
open $fh, '>', 'y2023m05.dat' or die "Can't open 'y2023m05.dat': $!\n"; print $fh join("\n",@y2023m05),"\n"; close $fh;
open $fh, '>', 'y2023m06.dat' or die "Can't open 'y2023m06.dat': $!\n"; print $fh join("\n",@y2023m06),"\n"; close $fh;
open $fh, '>', 'y2023m07.dat' or die "Can't open 'y2023m07.dat': $!\n"; print $fh join("\n",@y2023m07),"\n"; close $fh;
open $fh, '>', 'y2023m08.dat' or die "Can't open 'y2023m08.dat': $!\n"; print $fh join("\n",@y2023m08),"\n"; close $fh;
open $fh, '>', 'y2023m09.dat' or die "Can't open 'y2023m09.dat': $!\n"; print $fh join("\n",@y2023m09),"\n"; close $fh;
open $fh, '>', 'y2023m10.dat' or die "Can't open 'y2023m10.dat': $!\n"; print $fh join("\n",@y2023m10),"\n"; close $fh;
open $fh, '>', 'y2023m11.dat' or die "Can't open 'y2023m11.dat': $!\n"; print $fh join("\n",@y2023m11),"\n"; close $fh;

