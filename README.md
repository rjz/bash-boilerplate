# Bash boilerplates

Starting point for bash scripts

### cli.sh

Boilerplate for command-line scripts--structure, environment, and facilities for
logging and command line parsing.

    $ ./cli.sh
    ./cli.sh greet|dismiss name

    $ ./cli.sh greet McCoy
    [2015-03-08T09:17:28-0700] - So then I says, 'Top o' the morning to ye, McCoy!'

    $ ./cli.sh fail hard
    [2015-03-08T09:16:09-0700] - FATAL: 'I don't feel so well....'

### cron.sh

Boilerplate for scheduled cron tasks--logging, elapsed time, and process locking

## License

WTFPL

