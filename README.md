# Description

This is a collection of utilities I use a lot, many of which I consider to be gaps in the standard
UNIX toolset. Released into the public domain.
Matt Post

Here I've organized them into some categories.

## Machine Translation

- `zpaste`. A version of "paste" that also allows compressed files.

- `unpaste`. The opposite of paste: takes a tab-delimited stream on STDIN, and writes the columns to files. e.g., this command

       paste file1.en file1.fr | remove_bad_lines | unpaste file1_trimmed.en file1_trimmed.fr

  passes two files through some imaginary filter and then writes out the remaining lines to the specified files. Useful in machine translation
  research!
  
- `lines` (formerly `mid`). My favorite. Gives you a specified line number from a file. e.g.,

       cat big_file.txt | mid 100

  will print out the 100th line. Equivalent to

       head -n 100 big_file.txt | tail -n 1
       
  It also works with multiple files. For example:
  
       lines 74-76 corpus.de corpus.en
       
   will print lines 74 through 76 of `corpus.de` and `corpus.en`. Add `-v` to display `head`-style summaries. Other options also exist.

- `filter_lines`. Takes a file containing a list of line numbers, and filters those lines from STDIN, printing the others to STDOUT. For example

      seq 1 10 | filter_lines <(seq 4 6)
      
  prints
  
      1
      2
      3
      7
      8
      9
      10

- `getpair`. Silly script that selects source or target from a hyphenated language pair.

- `pareq`. Takes a list of file names, and exits with 0 if and only if all the files have the same number of lines. Works transparently with compressed files, e.g.,

      pareq corpus.de corpus.en.gz
      
 will exit with 0 iff corpus.de and (uncompressed) corpus.en.gz have the same number of lines.
  
## General utilities

- `abspath`. Returns the absolute path of a file (whether it exists or not).

- `expose`. Allows a standard UNIX command or pipeline to be exposed as a lightweight web service.

- `iso639`. Converts among ISO 639 codes and names.

- `mean`, `sum`. Computes the mean/sum of a list of numbers.

- `philog`. Personal mods to Philipp Koehn's command-line logging script.

- `rsample`. Simple [reservoir sampler](https://en.wikipedia.org/wiki/Reservoir_sampling) that grabs N random lines from a STDIN stream (uniformly at random) in `O(N)` time.

- `roll`. Simple dice roller.

- `shuffle`. Wrapper around Perl's "shuffle()". Warning --- slurps all input! Better to use "sort -R" if available.

