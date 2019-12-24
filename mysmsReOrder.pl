#!/usr/bin/perl

# perl mysmsReOrder.pl
# when you want to re-order a screen-scape from mysms into
# a more naturally readable descending order

use strict;  use warnings;
use Tie::File;

tie my @fileOrder, 'Tie::File', "$ARGV[0]" or die "Can't read file: $!\n";
my @reOrdered = splice @fileOrder, 0, 3;

my @SMS;
my $SMS_senderLine = "no";
my $SMS_dayLine = "no";
my $lastWOline;
my @day;
while (@fileOrder) {
  # print "$#fileOrder\n";
  if ($#fileOrder == 85){
    @fileOrder = @reOrdered;
    exit;
  }
  $lastWOline = pop @fileOrder;
  # print "lastWOline = $lastWOline\n";
  # watch out for what looks like a day line:
  unless ($lastWOline =~ /# .*?20/) {
    unshift @SMS, $lastWOline;
    if ($lastWOline =~ /## .*?SMS/) {$SMS_senderLine = "yes"};
    if ($SMS_senderLine eq "no") {
      # print "SMS array:\n";
      # print join ("\n", @SMS);
      # print "\n";
    } else {
      # it's a full message, so push it to @day
      push @day, @SMS;
      # print "day!\n";
      # print "day = @day\n";
      @SMS = ();
      $SMS_senderLine = "no";
    }
  } else {
    # it was a dayline, so push to reOrdered array:
    push @reOrdered, ($lastWOline, "", @day);
  }
}
untie @fileOrder;

