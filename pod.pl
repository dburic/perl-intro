# === Plain Old Documentation (POD) ===

use strict;
use warnings;
use feature qw(say);

say 'Use `perldoc pod.pl` to display the embedded documentation';

# The special literal __END__ marks the logical end of the script

__END__

=pod

=encoding UTF-8

=head1 INTRO

Plain Old Documentation (POD) is a lightweight mark-up language used to document Perl scripts and
modules.

POD can be converted to plain text, man pages, HTML and other formats.

=head1 DESCRIPTION

=head2 Paragraphs

A B<paragraph> is a sequence of lines of text delimited with blank lines. 

B<Verbatim paragraphs> are indented with at least one space or tab.

    # This is a verbatim paragraph
    for my $key (keys %hash) {
        say $key, " => ", $hash{$key};
    }

B<Command paragraphs> start with a command, possibly followed by arbitrary text. A B<command> starts
with C<=>, followed by an identifier. Command paragraphs are used for starting and ending POD blocks
(C<=pod>, C<=cut>), headings (C<=head1> to C<=head4>), lists (C<=over>, C<=item>, C<=back>) and more.

Other paragraphs, containing ordinary text, are called B<ordinary paragraphs>.

=head2 Starting and ending POD blocks

The command C<=pod> starts a POD block. Actually, a POD block is started by any command paragraph.

A POD block is ended by C<=cut>. 

Even though POD blocks are ignored by the Perl compiler, it is considered good practice to put
documentation after an C<__END__> token.

=head2 Formatting codes

Formatting codes can be used for B<bold>, I<italic>, C<code>, F<filenames>, L<links|https://www.perl.org/>
and more.

Formatting codes I<can be B<nested>>.

Delimiters can be changed when the text contains E<lt> or E<gt>, for example C<< $foo->bar >>.
Otherwise, an escape sequence can be used, for example C<$foo-E<gt>bar>.

=head2 Lists 

A bulleted list:

=over 

=item * Scalar

=item * Array

=item * Hash

=back

A numbered list:

=over

=item 1 January

=item 2 February

=item 3 March

=back

A description list:

=over 12

=item Scalar

A single value representing a number, string or reference

=item Array

An ordered list of values

=item Hash

An unordered set of key-value pairs

=back

=head2 Formatter-specific regions

The commands C<=begin>, C<=end>, C<=for> are used to pass parts of the documentation text to
specific formatters.

=begin html

<p>This will be rendered only in HTML.</p>

=end html

=begin text

This will be rendered only in text.

=end text

=for html <p>This is like a =begin/=end pair, 
but for a single paragraph only.</p>

=head2 Encoding

If the encoding of the documentation is not US-ASCII, the C<=encoding> command should be included as
early as possible.

This documentation is in UTF-8, so the euro symbol € should be rendered properly, as should the
characters “ČčŠšÄäẞß”.

=head2 Most used commands

POD commands by number of occurrences in 1639 Perl modules on a Debian Buster system:

    =item     11988 
    =head1     7087 
    =cut       3443 
    =head2     2853 
    =over      2044 
    =back      2036 
    =head3      663 
    =pod        333 
    =encoding   214 
    =for         74 
    =end         52 
    =begin       52 

=head1 TOOLS

=over 12

=item perldoc

Look up Perl documentation in Pod format

=item podchecker

Check the syntax of POD format documentation files

=item pod2html

Convert .pod files to .html files

=item pod2man

Convert POD data to formatted *roff input

=item pod2text

Convert POD data to formatted ASCII text

=item pod2html

Convert .pod files to .html files

=item pod2usage

Print usage messages from embedded pod docs in files

=back

=head1 STYLE

See L<perlpodstyle> in Perl's documentation for guidelines on how to write POD documentation for
scripts and modules.

Documentation is for users, either end-users (using an application) or other programmers (using a
module). Users should be able to use an application or a module only by reading the documentation,
with no need to look at the source code.

