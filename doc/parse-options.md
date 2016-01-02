# parse-options(1) -- parse CLI options

## SYNOPSIS
`parse-options` _OPTION_... `--` _ARGUMENT_... <br>

## DESCRIPTION
`parse-options` is a wrapper around `getopt` that provides an easier interface
for declaring options and for consuming options.

An option declaration is of the form `option:o` or `option:o=`, where:

* `option` is the long name, specified via `--option`
* `o` is the short name, specified via `-o`
* `=`, if present, indicates that the option takes an argument

## EXAMPLES
Parse long options:

  $ eval "$(parse-options output:o= -- --output 'some text')"
  $ echo "$output"
  some text

Parse short options:

  $ eval "$(parse-options output:o= -- -o 'some text')"
  $ echo "$output"
  some text

Parse short boolean options:

  $ eval "$(parse-options flag:f -- -f)"
  $ [[ $flag ]] && echo 'flag set'
  flag set

Parse long boolean options:

  $ eval "$(parse-options flag:f -- --flag)"
  $ [[ $flag ]] && echo 'flag set'
  flag set

## COPYRIGHT
`bash-common-parse-options` is Copyright (c) 2016 Vinson Chuong under The MIT
License.

## SEE ALSO
getopt(1)
