# === Packages ===

use strict;
use warnings;
use feature qw(say);

# A package is a namespace for global variables and subroutines that keeps them separate from other namespaces
# Every script starts in the main namespace
# The package keyword is used to switch to a new namespace

say __PACKAGE__; # __PACKAGE__ is a special literal that represents the name of the current package
say '';

# --------------------------------------------------

package SayHello; # Switch to a new namespace

our $package_name = __PACKAGE__; # Declare a package variable

sub say_hello {
    my $name = shift;
    say "Hello, $name!";
}

say $package_name;
say_hello('World');
say '';

# --------------------------------------------------

package main; # Back to main

our $package_name = __PACKAGE__;

say $package_name;
say $SayHello::package_name;
SayHello::say_hello('Perl');

