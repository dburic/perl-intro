# === SayHello ===

package SayHello;

use strict;
use warnings;
use feature qw(say);

# The Exporter module implements the default import method for modules

use Exporter qw(import);
our @EXPORT_OK = qw(say_hello); # List of symbols to export on request

sub say_hello {
    my $name = shift;
    say "Hello, $name!";
}

1; # A module must return true

