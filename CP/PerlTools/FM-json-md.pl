#!/usr/bin/perl

# --------------------------------------------------
# strip down a saved Facebook Messenger conversation
#
# I call this from my $ABjo/Bash/bashrc-ob
# --------------------------------------------------
# Joseph Harriott - Tue 23 Jun 2020

use strict;  use warnings;

use Data::Dumper qw(Dumper);
use Data::Printer; # p @array
use Date::Parse; # useful for examining the JSON hash
use feature 'say';
use JSON qw(decode_json);
use JSON::Parse 'parse_json';
use POSIX qw(strftime);
use Scalar::Util qw(reftype);
use Tie::File;

# grab the lines of the target JSON into an array:
tie my @json, 'Tie::File', "$ARGV[0]" or die "Can't read file: $!\n";

my $jsonstring = join '', @json;
my $jsonhash = decode_json( $jsonstring );
# print Dumper $jsonhash;
# p $jsonhash;
# exit;

my $day;
my $ic;
my $jpg;
my $sender;
my $unixtime;
my $uri;
my @day_sender_message;  # array to be filled
my @ic;
for my $item( @{$jsonhash->{messages}} ){
  $unixtime = substr($item->{timestamp_ms},0,10);
  if ( $ic = $item->{content} ) {
    $ic =~ s/\*/<asterisk>/g;
    unshift @day_sender_message, ($ic, '');
  }
  if ( $ic = $item->{photos} ) {
    # for some reason that reference can't go straight into array, and so
    @ic = $ic;  # so can now access the internal array, and dereference it
    $uri = $ic[0][0]->{uri};
    $uri =~ s#.*/photos/##;
    unshift @day_sender_message, ($uri, '');
  }
  unshift @day_sender_message, '## '.$item->{sender_name}.' '.strftime("%H:%M:%S", localtime($unixtime));
  $day = strftime("%Y %b %d %a", localtime($unixtime));
  unshift @day_sender_message, '# '.$day.'▶';
}

my @dsm;
my @conversation;  # array to be filled
unshift @conversation, ("vim: set fdm=expr: Facebook Messenger conversation", "");  # Vim modeline
$day = '';  # will now be used to show that the day has been added
while (@day_sender_message) {
  @dsm = shift @day_sender_message;
  # p $dsm[0];
  if ( $dsm[0] =~ s/▶// ) {
    if ( $dsm[0] eq $day ) {
      @dsm = shift @day_sender_message;  # day's already been posted, so move on
    } else {
      $day = $dsm[0];  # it's a new day!
      $dsm[1] = '';
    }
  }
  push @conversation, @dsm;
}

@json = @conversation;
untie @json;

