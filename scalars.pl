# === Scalars ===

use strict;
use warnings;
use feature qw(say); # Enable function say - like print, but appends newline

# Perl has three basic data types, each with its own sigil
#   $scalar - number, string, reference, undef
#   @array  - ordered list of scalar values
#   %hash   - unordered set of key-value pairs

# Numbers are internally stored as double-precision floating-point values

my $int = 42;
my $fp  = -273.15;
my $big = 45_103_792.02;
my $sci = 6.626E-34;
my $bin = 0b11010101;
my $oct = 0644;
my $hex = 0x7f;

# Arithmetic operators      + - * / % **
# Numeric functions         abs atan2 cos exp hex int log oct rand sin sqrt srand

my ($a, $b, $c) = (1, -1, -1);
my $gr = (-$b + sqrt($b ** 2 - 4 * $a * $c)) / (2 * $a);

# Strings are specified using single or double quotes

my $name = 'World';
print "Hello, $name!\n";

# Only double quotes interpolate variables and specials characters like \t or \n

print 'Hello, $name!\n';
print "\n";

# Strings can span multiple lines

print "Hello,
World!\n";

# Here documents - end-mark can be single or double quoted, no quotes works like double quotes

print <<"EOF";
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dictum rutrum neque volutpat ultrices.
Mauris nec nisl dapibus lorem accumsan varius. Curabitur vel dui mi. Quisque porttitor vitae mauris
vitae tempus. Mauris condimentum imperdiet turpis vehicula placerat.

Hello, $name!
EOF

# Quote-like operators q qq

my $s = q/Single quoted string/; # A nonalphanumeric nonwhitespace character is usually used as a delimiter
my $t = qq|Double quoted string with a slash / inside|;
my $u = qq(Double qouted string in parentheses); # () [] {} <> can also be used as delimiters

# String operators                  . x
# String functions (some of them)   chomp chr index lc lcfirst length ord rindex sprintf substr uc ucfirst

say "Concat" . "enation";
say "Repetition\n" x 3;

my $str = "Hello, World!\n";
say 'Length = ', length($str);
say 'Index of "World" = ', index($str, 'World');
say 'Substring = ', substr($str, 7, 5);

# Bitwise operators
#   and     or      xor     not     left shift  right shift
#   &       |       ^       ~       <<          >>

my $a = 0b1010;
my $b = 0b1100;
printf "%04b\n", $a & $b; # 1000
printf "%04b\n", $a | $b; # 1110
printf "%04b\n", $a ^ $b; # 0110
printf "%b\n", ~$a;       # 1111111111111111111111111111111111111111111111111111111111110101 (64 bits)

# A scalar behaves like a number or a string depending on the operator (ie depending on context)

my $x = 2;
my $y = '2X';
say $x . $y; # String concatenation - 22X
say $x + $y; # Numeric addition - 4, with a warning
say $x eq $y ? 'true' : 'false'; # String equality - false
say $x == $y ? 'true' : 'false'; # Numeric equality - true

# undef in Perl - similar to None in Python, null in PHP, NULL in SQL

my $var1 = undef;
my $var2;
my $var3 = '';
say defined $var1 ? 'defined' : 'undefined';
say defined $var2 ? 'defined' : 'undefined';
say defined $var3 ? 'defined' : 'undefined';

undef $var3;
say defined $var3 ? 'defined' : 'undefined';

say 'X' . undef;
say 1 + undef;

