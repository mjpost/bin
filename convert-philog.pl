#!/usr/bin/perl

# converts philog logfile to one that writes lines to logs in each
# directory

while (<>) {
  my @tokens = split;

  open WRITE, ">$tokens[6]/.philog.LOGFILE" or warn "can't write to $tokens[6]\n";
  print WRITE $_;
  close(WRITE);
}
	
