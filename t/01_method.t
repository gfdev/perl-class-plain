#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';

use Test::More 0.98;

use_ok('Class::Blank');

can_ok 'Class::Blank' => $_ for qw(
  new has
);

{
  package Example;
  
  use Class::Blank -strict;
}

ok(! Example->can('new'), 'there is no new() method in strict mode');
ok(! Example->can('has'), 'there is no has() method in strict mode');

done_testing;

