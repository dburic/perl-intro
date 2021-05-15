# === Debugging ===

use strict;
use warnings;
use feature qw(say);

# The debugger is started with `perl -d script.pl`
#
# Some debugger commands
#
#   h       Short help
#   h h     Long help
#   |h h    Long help in pager
#
#   .       View current line
#   v       View source around line
#   l       View lines or subroutine
#
#   s       Step into
#   n       Step over
#   <Enter> Repeat last n or s
#   c       Continue to next breakpoint
#   r       Return from subroutine
#   T       Stack trace
#
#   b       Set breakpoint
#   B       Delete breakpoint
#   w       Add watch expression
#   W       Delete watch expression
#   L       List breakpoints or watch expressions
#
#   p       Print expression
#   x       Evaluate expression in list context and dump result
#
#   M       List loaded modules
#   m       List methods
#   S       List subroutines
#   V       List variables
#   X       List variables in current package
#
#   q       Quit
#   R       Restart

# Return list of prime numbers <= $n using sieve of Eratosthenes
sub primes {
    my $n = shift;

    return () if $n < 2;

    my @l = 0 .. $n;
    $l[1] = 0;

    for (my $p = 2; $p <= sqrt($n); $p += 1) {
        next unless $l[$p];
        for (my $q = 2 * $p; $q <= $n; $q += $p) {
            $l[$q] = 0;
        }
    }

    return grep { $_ != 0 } @l;
}

my @primes = primes(30);
say join " ", @primes;

# For simple print-statement debugging, Data::Dumper can be used to pretty-print data structures
#
# use Data::Dumper qw(Dumper);
# say Dumper \@primes;

