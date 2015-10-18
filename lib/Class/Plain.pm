package Class::Plain;

use strict;
use warnings;
use feature ();

our $VERSION = '0.01';

use Carp 'croak';
use XSLoader;

XSLoader::load('Class::XSAccessor');

Class::XSAccessor::newxs_constructor(__PACKAGE__ . '::new');

sub import($;@) {
  croak __PACKAGE__ . q/ can't be parent/
    if shift ne __PACKAGE__;
  
  my ($caller, $flag, $opts) = ((caller)[0], @_);
  
  #warn '-' x 100 . $caller;
  #warn '-' x 100 . $flag;
  
  {
    no strict 'refs';
    
    if ($flag) {
      if ($flag eq '-singleton') {
        require Class::Plain::Singleton;
        
        push @{"$caller\::ISA"}, 'Class::Plain::Singleton';
      } elsif ($flag eq '-parent') {
        push @{"$caller\::ISA"}, @$opts;
      }
    }
    
    if (not $flag or $flag ne '-strict') {
      *{"$caller\::new"} = \&new;
      *{"$caller\::has"} = \&has;
    }
  }
  
  strict->import;
  warnings->import(FATAL => 'all');
  feature->import(':5.10');
}

sub has(@_) {
  Class::XSAccessor::newxs_accessor(caller . "::$_", "_$_", 0)
    for @_;
}

1;

__END__

=encoding utf-8

=head1 NAME

Class::Blank - Simple module for class creation

=head1 SYNOPSIS

    use Class::Blank;

=head1 DESCRIPTION

Class::Blank is ...

=head1 LICENSE

Copyright (C) Gordon Freeman.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Gordon Freeman E<lt>eax@gmx.usE<gt>

=cut

