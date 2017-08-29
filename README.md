# Description

This is a collection of utilities I use a lot, many of which I consider to be gaps in the standard
UNIX toolset. Released into the public domain.
Matt Post

- zpaste. A version of "paste" that also allows compressed files.

- expose. Allows a standard UNIX command or pipeline to be exposed as a lightweight web service.

- iso639. Converts among ISO 639 codes and names.

- mean, sum. Computes the mean/sum of a list of numbers.

- mid. My favorite. Gives you a specified line number from a file. e.g.,

       cat big_file.txt | mid 100

  will print out the 100th line. Equivalent to

       head -n 100 big_file.txt | tail -n 1

- philog. Personal mods to Philipp Koehn's command-line logging script.

- rand-sample. Simple reservoir sampler from Ben Van Durme that grabs N random lines from a stream on STDIN.

- roll. Simple dice roller.

- shuffle. Wrapper around Perl's "shuffle()". Warning --- slurps all input! Better to use "sort -R" if available.

- splittabs. Writes tab-delimited columns on STDIN to file names specified as script arguments. e.g.,

       paste file1.en file1.fr | remove_bad_lines | splittabs file1_trimmed.en file1_trimmed.fr

  passes two files through some imaginary script and then writes out the reduced ones. Useful in machine translation
  research!
