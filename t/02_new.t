#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';

use Test::More 0.98;

{
  package Example;
  
  use Class::Blank;
}

my $test = new Example;

ok(ref $test eq 'Example', 'Test new object');

done_testing;

