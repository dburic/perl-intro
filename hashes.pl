# === Hashes ===

use strict;
use warnings;
use feature qw(say);

# Creating hashes

my %prefixes = ('kilo', 3, 'mega', 6, 'giga', 9, 'tera', 12, 'peta', 15);
my %lang = ('Language' => 'Perl',
            'DesignedBy' => 'Larry Wall',
            'FirstAppeared' => 1987,
            'Version' => '5.32.1',
            'Date' => '2021-01-23',
            'Website' => 'www.perl.org'); # => is called a "fat comma" and is only a synonym for the comma

# Accessing elements

say $prefixes{'kilo'};

# Slices

my @slice = @lang{'Language', 'Version', 'Date'};
my %slice = %lang{'Language', 'Version', 'Date'}; # Since Perl 5.20

# Adding and removing elements

$prefixes{'exa'} = 18;
delete $prefixes{'exa'};

# Keys and values

say join ' ', keys %prefixes;
say join ' ', values %prefixes;

# Checking for existence

say $prefixes{'peta'} if exists $prefixes{'peta'};
say 'unknown' unless exists $prefixes{'exa'};

# From hash to list of pairs

my @pairs = %prefixes;
say "@pairs";

# Iterating through hash

for my $key (keys %prefixes) {
    printf "%s => %d\n", $key, $prefixes{$key};
}

while (my ($key, $value) = each %prefixes) {
    printf "%s = %s\n", $key, $value;
}

# Special hash %ENV - environment variables

say $ENV{'HOME'};

