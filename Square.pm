package Square;

use strict;
use warnings;

# Inheritance

use parent 'Rectangle';

# Methods from the parent class are accessed via the SUPER pseudo-class

sub new {
    my $class = shift;
    my $a = shift;
    return $class->SUPER::new($a, $a);
}

sub side {
    my $self = shift;
    if (my $a = shift) {
        $self->SUPER::side_a($a);
        $self->SUPER::side_b($a);
    }
    return $self->SUPER::side_a;
}

sub side_a {
    my $self = shift;
    return $self->side(shift);
}

sub side_b {
    my $self = shift;
    return $self->side(shift);
}

1;
