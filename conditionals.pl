# === Conditional statements ===

use strict;
use warnings;
use feature qw(say);

# True and false        undef 0 '0' '' () are false, everything else is true
# Logical operators
#   High priority       ! && ||
#   Low priority        not and or
# Numeric comparsion    == != > >= < <= <=>
# String comparison     eq ne gt ge lt le cmp

# if-elsif-else

my $x = 2;
if ($x == 1) {
    say "Equal to 1";
} elsif ($x > 1) {
    say "Greater than 1";
} else {
    say "Less than 1";
}

# unless - a shorthand for if (!(...))

unless ($x eq 1) {
    say "Not equal to 1";
}

# Braces { } are required, even if there is only one line in the block
# One-line conditional blocks can be written using statement modifiers

my ($oranges, $bananas) = (5, 0);
say "We have $oranges oranges" if $oranges;
say "We have no bananas" unless $bananas;

# Using a labeled block to emulate a switch statement

SWITCH: {
    if ($x > 3) { say "Greater than 3"; last SWITCH; }
    if ($x > 2) { say "Greater than 2"; last SWITCH; }
    if ($x > 1) { say "Greater than 1"; last SWITCH; }
    say "Less or equal to 1";
}

# Since Perl 5.10 there is a (still experimental) switch statement

# Conditional operator

my $y = $x >= 0 ? $x : -$x;

