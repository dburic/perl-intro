# === Files ===

use strict;
use warnings;
use feature qw(say);

my $filename = 'test.dat';
my @data = qw/One Two Three Four Five/;

# Creating a file

sub write_file {
    my $filename = shift;
    open my $fh, '>', $filename or die "Cannot open file - $!"; # Use >> to append
    for my $line (@_) {
        print $fh $line, "\n";
    }
    close $fh;
}

write_file $filename, @data;

# Processing a file line by line

sub process_file {
    my $filename = shift;
    my $function = shift;
    open my $fh, '<', $filename or die "Cannot open file - $!";
    while (defined(my $line = <$fh>)) {
        $function->($line);
    }
    close $fh;
}

my $print = sub { my $line = shift; print $line; };
process_file $filename, $print;
say '';

# Reading all lines at once - slurp

sub read_file {
    my $filename = shift;
    open my $fh, '<', $filename or die "Cannot open file - $!";
    my @lines = <$fh>;
    close $fh;
    return @lines;
}

my @lines = read_file $filename;
print join '', @lines;

# FIXME STDIN STDOUT STDERR
# FIXME Testing files with -X tests
# FIXME Directories
