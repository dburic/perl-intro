# === Process management ===

use strict;
use warnings;
use feature qw(say);

# Starting a child process with system

system 'date'; # Perl launches date directly

# If the string passed to system contains shell metacharacters, Perl invokes sh

system 'which $0'; # Equivalent to sh -c 'which $0'
system 'ls -l | head -n 5';
system 'echo *.pl';

# If a list is passed to system, the shell is never invoked

system qw(find -name *.pl);

# system's return value is the 16-bit status word returned by the wait() system call

my $sw = system 'sh', '-c', 'exit 42'; # 42 == 0x2a
printf "0x%04x\n", $sw;
printf "0x%04x\n", $?; # The status word is also available in $?

my $failed_to_start = $sw == -1;
my $exit_code = $sw >> 8;
my $core_dumped = $sw & 0b1000_0000;
my $signal_number = $sw & 0b0111_1111;

# A return value of 0 usually means that the child process completed successfully

!system 'true' and say 'Success';
!system 'false' or say 'Failure';

# Manipulating environment variables

$ENV{'PATH'} = "/home/user/bin:$ENV{'PATH'}";
system 'echo "PATH=$PATH"';

# Capturing output with backquotes or qx

my $complete_output = `ls -l`; # Scalar context
my $same_as_above = qx/ls -l/; 
my @lines = `ls -l`; # List context

# Processes as filehandles (piping)

open my $find, '-|', qw'find -name *.pl -printf %p\t%s\n' or die 'Cannot pipe from find';
while (<$find>) {
    chomp;
    my ($file, $size) = split /\t/;
    printf "%s\t%d\n", $file, $size;
}
close $find;

open my $shuf, '|-', 'shuf' or die 'Cannot pipe to shuf';
say $shuf join("\n", qw/Some words that will be passed to shuf/);
close $shuf;

# Starting a process with fork

defined(my $pid = fork) or die "Cannot fork: $!"; # $pid is the child's PID in the parent process, 0 in the child process, undef on failure
unless ($pid) {
    # This is the child process
    exec 'sleep 5m'; # Replace the current program with something else
    die "Cannot exec: $!";
}
# waitpid($pid, 0) # Wait for the child process to finish
say "Child process ID: $pid";

# Sending signals

kill 'INT', $pid or die "Cannot send SIGINT to process $pid";

# Receiving signals

$SIG{'INT'} =  \&trap_int; # The special hash %SIG contains signal handlers

sub trap_int {
    say 'SIGINT received';
}

kill 'INT', $$; # $$ is the current process ID
say 'Still alive';

