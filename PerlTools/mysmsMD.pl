#!/usr/bin/perl

# ---------------------------------------------------------------------
# perl mysmsMD.pl <aMySMSscreenscrapefile>
# when you want to convert screen-scape from mysms into markdown format
# ---------------------------------------------------------------------
#  use in  $ITstack\onGitHub\vimfiles\ftplugin\md.vim

use strict;  use warnings;
use Tie::File;
use Data::Printer;

# grab the lines of the screen-scrape file into an array:
tie my @mysms, 'Tie::File', "$ARGV[0]" or die "Can't read file: $!\n";
# print join("\n",@mysms),"\n";
# p @mysms; # Data::Printer
# exit;

# get the day headings, and mark those lines
# ------------------------------------------
foreach my $weekday ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday") {
  s/^$weekday,( \w+)( \d+),/▶# $weekday$2$1/ for @mysms }

# mark, and join up carriage returns in messages
# ----------------------------------------------
my $scrapeLine;
my @mysmsCR;
my $lineCR;
my $MStype;
my $timestamp;
while (@mysms) {
  $scrapeLine = shift @mysms;
  # p $scrapeLine;
  # exit;
  # mark and store a date line
  if ( $scrapeLine =~ /^▶# .*/ ) {
    push @mysmsCR, $scrapeLine;
    $scrapeLine = shift @mysms;
  }
  # mark and remove carriage returns
  $lineCR = "$scrapeLine";
  until ( $lineCR =~ s/(\d*:\d\d [AP]M$)/▲$1/ ) {
  # (until we've marked the timestamped last line of a message)
    $scrapeLine = shift @mysms;
    $lineCR .= "◙$scrapeLine";  # concatenate lines with ◙ marker between
  }
  # set type of MS
  $MStype = quotemeta("SMS");
  # check for MMS
  if (@mysms) {
    if ( $mysms[0] =~ /^$/ ) {
      # an image was sent
      $MStype = quotemeta("MMS");
      $scrapeLine = shift @mysms;
    }
    if ( $mysms[0] =~ /^.*\.3gpp|pdf$/ ) {
      # a PDF was sent
      $MStype = quotemeta("MMS");
      $scrapeLine = shift @mysms;
      $scrapeLine = shift @mysms;
      print "$lineCR\n";
      ($lineCR, $timestamp) = split /▲/, $lineCR;
      print "$lineCR $timestamp\n";
      $lineCR .= "◙$scrapeLine";
      $scrapeLine = shift @mysms;
      $lineCR .= " $scrapeLine▲$timestamp";
      print "$lineCR\n";
    }
  }
  # now mark out the sender, with correct MS:
  $lineCR =~ s/^([A-Za-zÀ-ÿ()0-9 -]+):/## $1 $MStype ▀/;
  push @mysmsCR, $lineCR;
}

# sort the compacted data into descending order
# ---------------------------------------------
my $lastSOline;
my @dayMS;
@mysms = ("");
while (@mysmsCR) {
  $lastSOline = pop @mysmsCR;
  # watch out for a date line:
  unless ($lastSOline =~ s/^▶//) {
    # it's a message, so stack it temporarily in dayMS array:
    push @dayMS, ($lastSOline, "");
  } else {
    # it was a dayline, so push to mysms array:
    push @mysms, ($lastSOline, "", @dayMS);
    @dayMS = ();
  }
}

# pull time back into sender line, with message underneath:
s/▀(.+)▲(.+)/$2\n$1/ for @mysms;
# clear undesired line endings:
s/ $// for @mysms;
s/◙$// for @mysms;
## for some mysterious reason this replaces "◙" with "??":
## s/[ d]$// for @mysms;

# restore CRs in messages:
s/◙/\n/g for @mysms;

# put the now nicely formatted lines back into the file:
untie @mysms;

