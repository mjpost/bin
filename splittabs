#!/usr/bin/perl

# splits on tab, printing respective chunks to the list of files given
# as script arguments

use FileHandle;

my @fh;
$| = 1;   # don't buffer output

if (@ARGV < 0) {
  print "Usage: splittabs.pl < tabbed-file\n";
  exit;
}

my @fh = map { get_filehandle($_) } @ARGV;
@ARGV = ();

while (my $line = <>) {
  chomp($line);
  my (@fields) = split(/\t/,$line,scalar @fh);
  
  map { print {$fh[$_]} "$fields[$_]\n" } (0..$#fields);
}

sub get_filehandle {
    my $file = shift;

    if ($file eq "-") {
	return *STDOUT;
    } else {
	local *FH;
	open FH, ">$file" or die "can't open '$file' for writing";
	return *FH;
    }
}
