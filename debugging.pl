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

# Character at index $i of string $s
sub char {
    my ($s, $i) = @_;
    return substr($s, $i, 1);
}

# Substr of $s with character at index $i removed
sub rmchar {
    my ($s, $i) = @_;
    return substr($s, 0, $i) . substr($s, $i + 1, length($s) - $i - 1);
}

# List of permutations of string $s
sub perms {
    my ($s) = @_;
    return ($s) if length($s) == 1;
    return () if length($s) == 0;
    my @perms = (); 
    for (my $i = 0; $i < length($s); $i++) {
        my $c = char($s, $i);
        my $t = rmchar($s, $i);
        for my $perm (perms($t)) {
            push @perms, $c . $perm;
        }
    }
    return @perms;
}

say join "\n", perms('abc');

# For simple print-statement debugging, Data::Dumper can be used to pretty-print data structures
#
# use Data::Dumper qw(Dumper);
# say Dumper \@primes;

