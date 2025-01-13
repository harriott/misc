#!/usr/bin/perl

# ----------------------------------------
# for playing with dates

# perl $misc/CP/PerlTools/datetimes.pl
# ----------------------------------------

use strict;  use warnings;
use Date::Parse;
use Data::Printer;
use POSIX qw(strftime);
use feature 'say';

say 'time';
say time;
say '';

# localtime
# -----------
say 'localtime';
my $datestring;

$datestring = localtime(1587677249);  # from notmuch
say $datestring;

$datestring = localtime(1592697530);  # from FM json - minus the last three digits
say $datestring;

say strftime("%a, %d %b %Y %H:%M:%S %z", localtime(1592697530));
say strftime("%Y %b %d %a %H:%M:%S %z", localtime(1592697530));
say strftime '%Y%m%d', gmtime();

say '';

# Date::Parse
# -----------
say 'Date::Parse';

my $time = str2time('Thu, 23 Apr 2020 23:27:29 +0200');  # a time from notmuch
say $time;

my @date = strptime('21 dec 17:05');
p @date;  # Data::Printer

