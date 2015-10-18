#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';

use Test::More 0.98;

{
  package Example;
  
  use Class::Blank;
  
  has 'test0';
  has test1 => 'a';
  has test2 => [qw[1 2]];
  has test3 => { 1 => 2 };
  has test4 => sub { return 'sub' };
}

my $test = new Example;

ok(ref $test eq 'Example', 'Test new object');
$test->test0(1);
ok($test->test0 == 1, 'Test accessor');
ok($test->test1 eq 'a', 'Test accessor');
ok(ref $test->test2 eq 'ARRAY', 'Test accessor');

done_testing;

