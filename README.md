# fdname

*fdname* is a util script, written in bash, replacing special characters in
strings to create proper file- or directory names.

## Installation

1. Clone repository
```bash
git clone https://github.com/GhostActive/fdname.git
```

2. Run install script
```
cd fdname && chmod +x install.sh && ./install.sh
```

## Usage

```bash
$ fdname --h

fdname - converts a list of string arguments to proper file- or directory name

Usage: fdname [OPTION]... [DIRECTORY --] [STRING]...

Options
    -c      Checks if a file or directory with same name already exists. If
            true, an incremental index will append to resolve name conflicts,
            e.g. If 'file' exists then 'file-2' is returned.

    -d      Prints the name as dot-file.

    -e STRING
            Appends STRING as extension to filename separated with '.' (dot),
            e.g. -e txt.
    
    -h, --help
            Prints a short description (-h) or opens the full documentation
            using 'less' command (--help). --h prints the full
            documentation without opening 'less'.

    -t      Appends current timestamp to filename as suffix. By default the
            date(1) format '%F-%H%M%S' is used.

    Further options to modify the application's behaviour:

    -f FORMAT
            Uses the given date(1) FORMAT for printing timestamps. By default
            '%F-%H%M%S' is used.

    -l      Converts all characters in filename to lower case. Only stdin and
            STRING arguments are modified - the DIRECTORY and file extension
            (-e STRING) will not be affected by this parameter.

    -r CHARACTER
            Uses CHARACTER as replacement instead of '-' (dash).

    -s      Switches the order of reading input. By default stdin is read first,
            then STRING arguments from command line. Using -s reverse the order.

Description
    fdname converts a list of strings containing special characters to a proper
    filename. The input can be passed from stdin and as arguments. If both are
    given, by default stdin is read first - then the STRING arguments from
    command line. With option -s (switch) the order is reversed. 

    All non alphanumeric characters are replaced by '-' (dash). Multiple dashes
    in the filename are reduced to single one, e.g '--' or '---' gets to '-'.
    Dashes at the begin and the end of a name are removed, too.

    In addition to replacing special characters a DIRECTORY can defined as
    prefix to build relative or absolute file paths. The DIRECTORY must be
    passed as first STRING argument followed by the sequence '--' as delimiter.
    All arguments after the delimiter are interpreted as part of the name.

Hints
    - (Double) Quotes are always deleted from input.

    - If the delimiter is missing, the DIRECTORY path is handled as part of the
      filename:

    	$ fdname -t -e tar.gz backup/
        backup-2022-06-05-180045-CEST.tar.gz
              ^
    	$ fdname -t -e tar.gz backup/ --
        backup/2022-06-05-180123-CEST.tar.gz
              ^
Examples
    $ fdname https://localhost:8443
    https-localhost-8443

    $ fdname "//strange|string:/"
    strange-string

    $ fdname -t -e txt hello world
    hello-world-2022-06-05-172406-CEST.txt

    $ echo "Hello" | fdname -l -e txt /tmp -- world
    /tmp/hello-world.txt

    fdname is designed to be used in combination with redirection ('>', '>>')
    and programs that have the ability to write output to files:

    // Writes the output of wget command to https-localhost-8443.html
    $ URL=https://localhost:8443; wget -O $(fdname -c $URL).html $URL
    [...]

Author
    GhostActive, https://github.com/ghostactive

Copyright
    Copyright (C) 2021-2022 GhostActive

License
    GNU General Public License v3.0

Version
    1.0 (June 2022)

```
