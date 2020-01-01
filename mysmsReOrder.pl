#!/usr/bin/perl

# perl mysmsReOrder.pl
# when you want to re-order a markdown screen-scape from mysms
# into a more naturally readable descending order

use strict;  use warnings;
use Tie::File;

tie my @fileOrder, 'Tie::File', "$ARGV[0]" or die "Can't read file: $!\n";
my @reOrdered = splice @fileOrder, 0, 3;

my @SMS;
my $SMS_dayLine = "no";
my $lastWOline;
my @day = ();
while (@fileOrder) {
  # print "$#fileOrder\n"; # for debugging
  $lastWOline = pop @fileOrder;
  # print "lastWOline = $lastWOline\n"; # for debugging
  # watch out for what looks like a day line:
  unless ($lastWOline =~ /# .*?20/) {
    unshift @SMS, $lastWOline;
    # print "SMS array:\n"; print join ("\n", @SMS); print "\n"; # for debugging
    if ($lastWOline =~ /## .*?SMS/) {
      # it's a full message, so push it to @day
      push @day, @SMS;
      @SMS = ();
    }
  } else {
    # it was a dayline, so push to reOrdered array:
    push @reOrdered, ($lastWOline, "", @day);
    @day = ();
    @SMS = ();
  }
}
@fileOrder = @reOrdered;
untie @fileOrder;

