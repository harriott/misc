#!/usr/bin/perl

# ---------------------------------------------------------------------
# perl mysmsMD.pl
# when you want to convert screen-scape from mysms into markdown format
# ---------------------------------------------------------------------

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
my @mysmsCR;
my $nextLine = shift @mysms;
while (@mysms) {
  # mark and store date lines:
  if ( $nextLine =~ /▶# .*/ ) {
    push @mysmsCR, $nextLine;
    $nextLine = shift @mysms;
  }
  # prepare the message line:
  my $lineCR = "$nextLine";
  # check for empty line where an image was included:
  my $MStype = quotemeta("SMS");
  if ( @mysms ) {
    $nextLine = shift @mysms;
    if ( $nextLine =~ /^$/ ) {
      $MStype = quotemeta("MMS");
      $nextLine = shift @mysms;
    }
  }
  # mark and remove carriage returns
  until ( $lineCR =~ s/(\d*:\d\d [AP]M$)/▲$1/ ) {
    $lineCR .= "◙$nextLine";
    $nextLine = shift @mysms;
  }
  # now mark out the sender, with correct MS:
  $lineCR =~ s/^([A-Za-zÀ-ÿ]+):/## $1 $MStype ▀/;
  push @mysmsCR, $lineCR;
}

# sort the compacted data into descending order
# ---------------------------------------------
my $lastSOline;
my @dayMS;
@mysms = ();
while (@mysmsCR) {
  $lastSOline = pop @mysmsCR;
  # watch out for a date line:
  unless ($lastSOline =~ /▶# .*/) {
    # it's a message, so stack it temporarily in dayMS array:
    push @dayMS, $lastSOline;
  } else {
    # it was a dayline, so push to mysms array:
    push @mysms, ($lastSOline, @dayMS);
    @dayMS = ();
  }
}

# put the now nicely formatted lines back into the file:
untie @mysms;

