package Class::Plain::Singleton;

use parent 'Class::Plain';

sub new {
  my $class = $_[0];
  
  no strict 'refs';
  
  my $instance = \${"$class\::__INSTANCE"};
  
  unless (ref $$instance eq $class) {
    $$instance = $class->SUPER::new;
    
    $$instance->init(@_)
      if $class->can('init');
  }
  
  return $$instance;
}

1;
