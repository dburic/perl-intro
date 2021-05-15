# === Subroutines ===

use strict;
use warnings;
use feature qw(say);

# Defining a subroutine

sub hello_world {
    say "Hello, World!";
}

hello_world();
hello_world;
&hello_world(); # Old way to call subroutines - before Perl 5.0

# Passing arguments and returning values

sub mean {
    my $n = @_; # Arguments are passed via special array @_
    my $sum = 0;
    for my $x (@_) {
       $sum += $x;
    }
    return $sum / $n; # return is optional, the value of the last expression is returned by default
}

say mean(1, 2, 3);
say mean 4, 5, 6;

my @a = (1, 2, 3);
say mean(@a);

my @b = (4, 5, 6, 7, 8);
say mean(@a, @b); # Arrays are flattened

# Too few or too many arguments

say max2(-1, 1); # See below for the definition of max2
say max2(-1, 1, 2); # Extra arguments are ignored
say max2(1); # Not enough arguments gives a warning

sub max2 {
    my ($x, $y) = @_;
    return $x > $y ? $x : $y;
}

# An array or hash can be passed as last argument - or references should be used

sub print_hash {
    my ($w1, $w2, %h) = @_;
    for my $key (sort keys %h) {
        printf "%-${w1}s => %${w2}d\n", $key, $h{$key};
    }
}

my %h = ('x' => 1, 'y' => 2, 'abc' => 100);
print_hash 3, 5, %h;

# State variables

use feature 'state';

sub counter {
    state $counter = 0;
    ++$counter;
}

say counter();
say counter();
say counter();

