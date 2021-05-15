# === Objects ===

use strict;
use warnings;
use feature qw(say);

# An object is a reference (usually to a hash) whose referent has been associated with a class via the built-in function bless
# A class is a package
# A method is a subroutine that expects either a class or an object as its first argument

use Cwd qw(abs_path);
use File::Basename qw(dirname);
use lib dirname(abs_path(__FILE__)); # Add directory of this file to @INC

use Rectangle;
use Square;

use Scalar::Util qw(blessed);

# Methods are accessed using the -> operator (same syntax as for dereferencing, but different operations)
# The thing on the left side of -> is passed as the first argument to the subroutine on the right

my $r = Rectangle->new(3, 4);
say ref $r; # When used on an object, ref returns its class
say "Sides: ", $r->side_a, ", ", $r->side_b;
say "Diagonal: ", $r->diagonal();
say "Perimeter: ", $r->perimeter();
say "Area: ", $r->area();
say '';

my $s = Square->new(1);
say blessed $s; # Like ref, but returns undef if the argument is not an object
$s->side(3);
say "Side: ", $s->side;
say "Diagonal: ", $s->diagonal();
say "Perimeter: ", $s->perimeter();
say "Area: ", $s->area();
say '';

# All classes automatically inherit from the built-in UNIVERSAL class
# Methods isa and can are inherited from UNIVERSAL

say 'A Square ', $s->isa('Rectangle') ? 'is a' : 'is not a', ' Rectangle';

if (my $method = $s->can('diagonal')) {
    say $s->$method();
}

# Perl's built-in OO system is minimal, but flexible 
# Many extensions have been created - Moose, Moo, Class::Tiny, ...
# It is strongly recommended to use one of these extensions - more features and convenience, less boilerplate

