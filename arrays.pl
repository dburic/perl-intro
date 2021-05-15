# === Arrays ===

use strict;
use warnings;
use feature qw(say);

# Creating arrays

my @animals = ("camel", "llama", "owl");
my @numbers = (1, 1, 2, 3, 5, 8, 13);
my @mixed = ("camel", 42, 1.23);
my @empty = ();
my @words = qw/This is an array of words/;
my @months = qw/Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec/;
my @digits = (0 .. 9); # .. is the range operator
my @letters = ('a' .. 'z');

# First and last element

say $animals[0];
say $animals[$#animals]; # Same as $animals[-1]

# Evaluating an array in scalar context returns its size

say scalar @animals;
my $size = @animals;
say 'There are more than two animals' if @animals > 2;

# Copying arrays

my @copy = @animals;
$copy[2] = "parrot";
say "@animals"; # @animals is unchanged - also notice array interpolation
say "@copy";

# Slicing

my @first_two = @months[0, 1];
my @first_three = @months[0 .. 2];
my @all_except_first = @months[1 .. $#months];

# Adding and removing elements

push @numbers, 21; # Append single value
push @numbers, (21, 34, 55, 89, 144); # Append list of values
my $last = pop @numbers; # Pop last element
my $first = shift @numbers; # Shift first element
unshift @numbers, $first; # Prepend - works with a list of values too

# Replacing elements - splice ARRAY[, OFFSET[, LENGTH[, LIST]]]

my @removed = splice @words, 2, 3; # Remove elements
say "@words";
say "@removed";
splice @words, 2, 0, @removed; # Put them back
say "@words";

# Splitting strings -  split /PATTERN/[, EXPR[, LIMIT]]

my $path = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin';
my @dirs = split /:/, $path;

# Joining arrays - join EXPR, LIST

say join "\n", @dirs;

# Sorting

my @sorted = sort @months;
say "@sorted";

# Reversing

my @reversed = reverse @months;
say "@reversed";

# Iterating through array

for my $animal (@animals) {
    say $animal;
}

# Special array @ARGV - command line arguments

say join ' ', @ARGV;

# FIXME grep, map
