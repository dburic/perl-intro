# === Regular expressions ===

use strict;
use warnings;
use feature qw(say);

# A regular expression (regex, regexp) is a sequence of characters that specifies a search pattern to be used on strings

# Simple word matching

my $string = "Hello, World!";
say "Matches" if $string =~ /World/; # =~ is the binary binding operator - true on match, false otherwise
say "Does not match" if $string !~ /Perl/; # !~ is the negation of =~

# Variable interpolation - regexes are usually treated as double-quoted strings

my $name = "World";
say "Matches" if $string =~ /$name/; # Match

# Matching against $_

$_ = $string;
say "Matches" if /World/; # $_ =~ is not needed

# // can be changed to other delimiters if m is used in front

$string =~ m|World|;
"/usr/bin/perl" =~ m{/perl}; # () [] {} <> can also be used

# Perl matches at earliest possible point

$string =~ /o/; # Matches o in Hello, not in World

# Regexes are case sensitive by default

$string =~ /world/; # Does not match
$string =~ /world/i; # Matches - use modifier i for case insensitive match

# Metacharacters {}[]()^$.|*+?\ - usually have special meaning

'1+1=2' =~ /1+1/; # Does not match - + is a metacharacter
'1+1=2' =~ /1\+1/; # To match a metacharacter put a backslash in front of it

# Escape sequences \n \r \t \xnn \0nnn

"10\t20" =~ /0\t2/;
"abc" =~ /\x61\x62\x63/;

# Anchors
#   ^ - beginning of string
#   $ - end of string or before newline at end of string

"waterfall" =~ /fall/;          # Matches
"waterfall" =~ /^fall/;         # Does not match
"waterfall" =~ /fall$/;         # Matches
"waterfall\n" =~ /fall$/;       # Matches
"waterfall" =~ /^waterfall$/;   # Matches

# Character classes - matching sets of characters

/[bch]at/; # Matches bat, cat, hat
/file[0-9]/; # - is used to specify ranges of characters and [0-9] is shorthand for [0123456789]
/[0-9a-fA-F]/; # Matches a hexadecimal digit
/[^abc]/; # ^ at the beginning denotes a negated class - matches any character except those in brackets
/[[\]]/; # The characters -]\^$ are special in classes and have to be escaped
/[+-]/; # The character - does not have to be escaped when it is the first or last character of the class

# Special classes
#   \d  digit       [0-9]
#   \s  whitespace  [ \t\r\n\f]
#   \w  word        [0-9a-zA-Z_]
#   \D  negated \d
#   \S  negated \s
#   \W  negated \w
#   .   any character except \n

/\d\d:\d\d:\d\d/; # Matches time in hh:mm:ss format
/[\d\s]/; # Matches any digit or whitespace character
/end\./; # Matches end followed by a period
/end[.]/; # Same as above

# Word boundary anchor \b - matches the boundary between a word and a non-word character

my $line = "How much wood would a woodchuck chuck";
$line =~ /\bchuck/; # Matches the last word chuck
$line =~ /\bchuck\b/; # Same as above
$line =~ /chuck\b/; # Matches the substring chuck in woodchuck

# Alternation metacharacter |

"black and white" =~ /black|white|gray/; # Matches black
"black and white" =~ /white|gray|black/; # Still matches black
"abc" =~ /a|ab|abc/; # Matches a
"abc" =~ /abc|ab|a/; # Matches abc

# Grouping metacharacters () - allow part of a regex to be treated as a single unit

/(|kilo|mega)byte/; # Matches byte, kilobyte, megabyte

# Extracting matches

my $time = '01:23:45';
$time =~ /(\d\d):(\d\d):(\d\d)/;
my ($h, $m, $s) = ($1, $2, $3);

# $1 gets the group with the first opening parenthesis, $2 the group with the second opening parenthesis etc

m/(a|b(cde|fg)(h|ijk))/;
# 1   2       3

# Backreferences \1, \2, ... - like $1, $2, ... but used inside regexes

m/(\w\w\w) \1/; # Matches 'bye bye' and similar

# Quantifier metacharacters ? * + {} - used immediately after a character, class or grouping
#   ?       match 0 or 1 time
#   *       match 0 or more times
#   +       match 1 or more times
#   {m,n}   match between m and n times
#   {n,}    match n or more times
#   {n}     match exactly n times

/[a-z]*\s*\d+/; # Matches 0 or more lowercase letters, followed by 0 or more spaces, followed by 1 or more digits
/(\w+)\s+\1/; # Matches doubled words of any length
/^(\d{2}|\d{4})$/; # Make sure the string consists of exactly 2 or 4 digits

# Matching in list context

my @matches = ("12.5 KB" =~ /^(\S+)\s+(\S+)$/);
say "@matches";

# The global modifier /g
#   Scalar context - successive matches, keeps track of position
#   List context - return list of matched groupings

my $words = "cat dog bird";
while ($words =~ /(\w+)/g) {
    printf "Word '%s' ends at postition %d\n", $1, pos $words;
}

my @words = ($words =~ /(\w+)/g);
say "@words";

# Search and replace - s/REGEX/REPLACEMENT/MODIFIERS - REPLACEMENT behaves like double quoted string, and can use $1, $2, ...

my $x = 'abc abc def';
$x =~ s/abc/xyz/; # Replace first occurrence of abc with xyz, use modifier /g to replace all occurrences
my $y = 'practical extraction and reporting language';
$y =~ s/(\w+)/\u$1/g; # Capitalize all words

# Returning result of replacement with /r

say "Hello, World!" =~ s/World/Perl/r;
say join ' ', map { s/[abc]/x/r } qw/a b c d e f/;

# Evaluation modfier /e wraps an eval{...} around the replacement string

say $y =~ s/(\w+)/reverse $1/egr;

# FIXME Non-greedy quantifiers
# FIXME Look-ahead and look-behind
