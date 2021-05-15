# === Loops ===

use strict;
use warnings;
use feature qw(say);

# while

my $n = 100;
while ($n) {
    $n--;
    last if $n <= 50; # last - exit loop, next - next iteration
}
say $n;

# until is a shorthand for while(!(...))

# for - foreach is a synonym

my @files = ('a.txt', 'b.dat', 'c.zip');
for my $file (@files) {
    say $file;
}

# Using $_ - the default variable

for (@files) {
    say;
}

# C-style for

my $pow = 1;
for (my $k = 0; $k <= 10; $k++) {
    printf "2 ** %d = %d\n", $k, $pow;
    $pow *= 2;
}

