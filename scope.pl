# === Variable scoping ===

# use strict; # Compilation fails if strict is used
use warnings;
use feature qw(say);

# Variables declared with my are lexically scoped (code block)
# Leaving out my creates globally scoped (package) variables

if ('some condition') {
    $x = 'foo'; # Globally scoped
    my $y = 'bar'; # Lexically scoped
    say $x;
    say $y;
}
say $x;
say $y; # Prints only a newline, $y is out of scope

