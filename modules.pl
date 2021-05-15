# === Modules ===

use strict;
use warnings;
use feature qw(say);

# Modules enable code reuse in Perl

# Core vs CPAN modules
#   Core - modules shipped with Perl, use `corelist -v 5.016` to get a list of core modules
#   CPAN <https://www.cpan.org/> - modules from CPAN have to be installed

# Where to find modules
#   CPAN Search <http://search.cpan.org/> - unavailable since 2018, now redirects to MetaCPAN
#   MetaCPAN <https://metacpan.org/> - search engine and web interface for CPAN

# Installing modules
#   `apt-get install libfoo-bar-perl` - to install Foo::Bar
#   `dh-make-perl` or `cpan2deb` - see <https://metacpan.org/pod/distribution/DhMakePerl/dh-make-perl>
#   `cpan` - see <https://metacpan.org/pod/distribution/CPAN/scripts/cpan>

# Loading modules
#   require     Loads module at run time
#   use         Loads module at compile time

# require Foo::Bar looks for module Foo/Bar.pm in directories in @INC and loads it

# use Foo::Bar qw(func);
#
# is equivalent to
#
# BEGIN {
#   require Foo::Bar;
#   Foo::Bar->import(qw(func));
# }

use File::Basename; # Load module and import all exported symbols
my $path = '/usr/local/bin/perl';
say basename($path);
say File::Basename::basename($path); # Same as above

# @INC - also available in the output of `perl -V`

say join "\n", @INC;

# Importing only selected functions

use Digest::MD5 qw(md5_hex); # Use empty list () to import nothing
my $message = 'Hello, World!';
say md5_hex($message);

# Modules can have an object-oriented interface

use Digest;
my $md5 = Digest->new('MD5');
my $sha1 = Digest->new('SHA-1');
$md5->add($message);
$sha1->add($message);
say $md5->hexdigest;
say $sha1->hexdigest;

# Creating and loading a custom module

use Cwd qw(abs_path);
use lib dirname(abs_path(__FILE__)); # Add directory containing this file to @INC

use SayHello qw(say_hello); # Load SayHello.pm and import say_hello

say_hello('World');

# Perl keeps a list of loaded modules in %INC

for my $key (sort keys %INC) {
    say "$key => $INC{$key}";
}

