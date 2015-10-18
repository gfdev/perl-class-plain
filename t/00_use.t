#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';

use Test::More 0.98;

use_ok $_ for qw(
  Class::Blank
);

#Class::Plain::Singleton

done_testing;

