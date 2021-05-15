# === Basic syntax ===

# Comments start with a hash

# Pragmas strict and warnings make Perl more robust

use strict;     # Restrict unsafe constructs
use warnings;   # Enable optional warnings

print "Hello, World!\n"; # Statements end with a semicolon

# Whitespace is irrelevant, except inside strings

print
    "Hello, World!\n"
        ;

# Parentheses for function arguments are optional (only if the function has been predeclared)

print("With parentheses\n");
print "Without parentheses\n";

# Blocks of code are delimited with curly braces { }

my @r = ();
for (my $n = 1; $n <= 100; $n++) {
    if (not $n % 3) {
        if (not $n % 5) {
            push @r, "FizzBuzz";
        } else {
            push @r, "Fizz";
        }
    } elsif (not $n % 5) {
        push @r, "Buzz";
    } else {
        push @r, $n;
    }
}
print "@r\n";

