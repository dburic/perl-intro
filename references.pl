# === References ===

use strict;
use warnings;
use feature qw(say);

# A reference is a scalar value that holds the address/location of another value

# References are created by prepending a backslash

my $scalar = 3.14;
my @array = (-1, 0, 1);
my %hash = ('a' => 10, 'b' => 20, 'c' => 30);

sub max2 {
    my ($x, $y) = @_;
    return $x > $y ? $x : $y;
}

my $scalar_ref = \$scalar;
my $array_ref = \@array;
my $hash_ref = \%hash;
my $sub_ref = \&max2;

say "\$scalar_ref = $scalar_ref";
say "\$array_ref = $array_ref";
say "\$hash_ref = $hash_ref";
say "\$sub_ref = $sub_ref";
say '';

# Finding out the type of reference

say ref $scalar_ref;
say ref $array_ref;
say ref $sub_ref;
say 'not a reference' unless ref $scalar; # If the argument is not a reference, ref returns false
say '';

# Dereferencing is done by prepending the appropriate sigil

sub format_ref {
    my $ref = shift;
    my $type = ref $ref;
    if (!$type) {
        return 'not a reference';
    } elsif ($type eq 'SCALAR') {
        return $$ref;
    } elsif ($type eq 'ARRAY') {
        return '(' . join(', ', @$ref) . ')';
    } elsif ($type eq 'HASH') {
        my @r = ();
        push @r, "$_ => $$ref{$_}" for (sort keys %$ref);
        return '(' . join (', ', @r) . ')';
    } else {
        return 'unrecognized reference type';
    }
}

say '$scalar = ', format_ref($scalar_ref);
say '@array = ', format_ref($array_ref);
say '%hash = ', format_ref($hash_ref);
say 'max2(3, 4) = ', &$sub_ref(3, 4);
say '';

# Anonymous arrays and hashes

my $anon_array = [1, 2, 3, [4, 5]];
say ref $anon_array;
say ${$anon_array}[0];
say $anon_array->[0]; # Same as above
say '';

say ref $anon_array->[3];
say $anon_array->[3]->[0];
say $anon_array->[3][0]; # -> can be ommitted between [] and []
say '';

my @matrix = ([1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]);
say $matrix[1][1];
say '';

my $anon_hash = {'a' => 10, 'b' => 20, 'c' => 30};
say $anon_hash->{'c'};
say '';

# Anonymous subroutines

my $say_hello = sub {
    my $name = shift;
    say "Hello, $name!";
};
$say_hello->('World');

