# === Exceptions ===

use strict;
use warnings;
use feature qw(say);

# Exceptions are run-time errors, which can be built-in or user generated with die

# Exceptions can be trapped using an eval block

eval {
    my $x = 1 / 0; # Run-time error (division by zero) - eval terminates and returns undef
    say "This is not executed";
};
say $@; # Error message from last eval, empty if there was no error

# Emulating try/catch with eval

eval {
    # Code that might throw an exception
    die "Something happened";
    1;
} or do {
    # Code to process the exception
    my $error = $@ || "Unknown error";
    warn "Warning - $error";
};

# warn and die behave slightly differently depending on the ending character

warn "Warning"; # No ending newline - "at SCRIPT line LINE" is added
warn "Warning\n"; # Newline at end - nothing is added

