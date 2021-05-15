package Rectangle;

use strict; 
use warnings;

# Constructor

sub new {
    my $class = shift;
    my ($a, $b) = @_;
    my $self = {a => $a, b => $b};
    bless $self, $class;
    return $self;
}

# Read-write accessors

sub side_a {
    my $self = shift;
    $self->{a} = shift if @_;
    return $self->{a};
}

sub side_b {
    my $self = shift;
    $self->{b} = shift if @_;
    return $self->{b};
}

# Other methods

sub diagonal {
    my $self = shift;
    return sqrt($self->{a} ** 2 + $self->{b} ** 2);
}

sub perimeter {
    my $self = shift;
    return 2 * ($self->{a} + $self->{b});
}

sub area {
    my $self = shift;
    return $self->{a} * $self->{b};
}

1;

