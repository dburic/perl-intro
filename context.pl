# === Context ===

use strict;
use warnings;
use feature qw(say);

# Every Perl expression is evaluated in the context determined by the surrounding code
# There are two main contexts - scalar, list (previously called array context)
# Scalar context is further subdivided into - numeric, string, boolean, void

# Scalar assignments are evaluated in scalar context

my $scalar = 'This is evaluated in scalar context';

# Array and hash assignments are evaluated in list context

my @array = qw/This is evaluated in list context/;
my %hash= ('a' => 1, 'b' => 2, 'c' => 3); # This is also evaluated in list context

# A scalar expression evaluated in list context becomes a single-element list

my @single_element_array = '123';
say $single_element_array[0];

# An array expression evaluated in scalar context returns the length of the array

my $array_length = @array;
say $array_length;

# A list expression evaluated in scalar context returns the last element of the list (with warnings)

my $last_element = ('a', 'b', 'c');
say $last_element;

# print and say evaluate their arguments in list context and can be used to print arrays and hashes

print @array, "\n";
say %hash;

# Built-in functions can have different behavior depending on context

my @time = localtime(); # An array of 9 numeric values, for example (23, 31, 9, 8, 3, 121, 4, 97, 1)
say join ' ', @time;

my $time = localtime(); # A string representation, for example 'Thu Apr  8 09:31:23 2021'
say $time;

# Scalar context can be forced with the function scalar

say scalar @array;

# User defined subroutines can detect list context with the function wantarray (which should be called wantlist)

sub list_or_scalar {
    if (wantarray) {
        return ('a', 'b', 'c');
    } else {
        return 3;
    }
}
say list_or_scalar;
say scalar list_or_scalar;

# FIXME void context
# FIXME Context tutorial @ Perl Monks <https://www.perlmonks.org/?node_id=738558>
