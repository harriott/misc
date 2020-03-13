#!/usr/bin/perl

# ---------------------------------------------------------------------
# perl mysmsMD.pl
# when you want to convert screen-scape from mysms into markdown format
# ---------------------------------------------------------------------
#  needs adapting for Strawberry Perl on Windows 10

use strict;  use warnings;
use Tie::File;

# grab the lines of the screen-scrape file into an array:
tie my @mysms, 'Tie::File', "$ARGV[0]" or die "Can't read file: $!\n";

# get the day headings, and mark those lines
# ------------------------------------------
foreach my $weekday ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday") {
  s/^$weekday,( \w+)( \d+),/▶# $weekday$2$1/ for @mysms }

# mark, and join up carriage returns in messages
# ----------------------------------------------
my $nextLine = shift @mysms;
my @mysmsCR;
my $lineCR;
my $MStype;
while ($nextLine) {
  # mark and store date lines:
  if ( $nextLine =~ /^▶# .*/ ) {
    push @mysmsCR, $nextLine;
    $nextLine = shift @mysms;
  }
  # prepare the message line:
  # mark and remove carriage returns
  $lineCR = "$nextLine";
  until ( $lineCR =~ s/(\d*:\d\d [AP]M$)/▲$1/ ) {
  # (until we've marked the timestamped last line of the message)
    $nextLine = shift @mysms;
    $lineCR .= "◙$nextLine";
  }
  $nextLine = shift @mysms;
  $MStype = quotemeta("SMS");
  # check for xMS
  if ( $nextLine ) {
    if ( $nextLine =~ /^$/ ) {
      # an image was sent
      $MStype = quotemeta("MMS");
      $nextLine = shift @mysms;
    }
  }
  # now mark out the sender, with correct MS:
  $lineCR =~ s/^([A-Za-zÀ-ÿ()0-9 ]+):/## $1 $MStype ▀/;
  push @mysmsCR, $lineCR;
}

# sort the compacted data into descending order
# ---------------------------------------------
my $lastSOline;
my @dayMS;
@mysms = ("---", "[//]: # ( vim: set fdm=expr:)", "");
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

