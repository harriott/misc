#!/usr/bin/perl

# Joseph Harriott - Tue 05 Jul 2022

# -----------------------------------------------------------------------------------
# when you want to convert screen-scrape from Facebook Messenger into markdown format
# -----------------------------------------------------------------------------------
#  used in  $vimfiles/ftplugin/md.vim

# perl $onGH/misc/PerlTools/MessengerMd.pl $IT1/InterNetworking/comms/Facebook/MessengerScrape1.md

use strict;  use warnings;
use Tie::File;  # on MSWin requires  fileformat=dos
use Data::Printer;

# grab the lines of the screen-scrape file into an array:
tie my @Messenger, 'Tie::File', "$ARGV[0]" or die "Can't read file: $!\n";
# print join("\n",@Messenger),"\n";
# p @Messenger; # Data::Printer
# exit;

# mark the conversers
# -------------------
foreach my $converser (
  "You sent",
  "Assistance clientèle HP",
  ) { s/^$converser$/▶# $converser/ for @Messenger }

# mark conversations, and tidy
# ----------------------------
my @conversations;
my $scrapeLine;
my $scrapeLinePrevious = '▶# ';
while (@Messenger) {
  $scrapeLine = shift @Messenger;
  if ( $scrapeLine =~ /^\d{1,2} \w+ \d{4}$/ ) {
    $scrapeLine = shift @Messenger;
    $scrapeLine =~ s/^(\d\d)\/(\d\d)\/(\d{4}), (.+)/■▶# $3-$2-$1 $4/;
  } # conversation
  $scrapeLine =~ s/\s*$//;  # trim off trailing whitespaces
  $scrapeLine =~ s/’/'/g;  # simpler quote
  $scrapeLine =~ s/​//g;  # remove any zero width spaces
  if ( $scrapeLine =~ /^$/ ) { next }  # skip all empy lines
  if ( $scrapeLine =~ /^▶# / and $scrapeLine eq $scrapeLinePrevious ) { next }  # remove empty talk
  $scrapeLinePrevious = $scrapeLine;
  push @conversations, $scrapeLine;
}
@Messenger = @conversations;

# convert back to markdown headings
# ---------------------------------
s/^▶/#/ for @Messenger;
s/■▶// for @Messenger;

# put the now nicely formatted lines back into the file
untie @Messenger;

