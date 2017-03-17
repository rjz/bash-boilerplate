# Bash Boilerplate

Because as long as we're scripting [bash][bash], we might as well start from
somewhere.

### cli.sh

Boilerplate for command-line scripts--structure, environment, and facilities for
logging and command line parsing.

```ShellSession
$ ./cli.sh
./cli.sh greet|dismiss name

$ ./cli.sh greet McCoy
[2015-03-08T09:17:28-0700] - So then I says, 'Top o' the morning to ye, McCoy!'

$ ./cli.sh fail hard
[2015-03-08T09:16:09-0700] - FATAL: 'I don't feel so well....'
```

### cron.sh

Boilerplate for scheduled cron tasks--logging, elapsed time, and process locking

### Utilities

Plus:

  - Eight beautiful colors in `colors.sh` for prettying up your scripts
  - And! A handful of useful utility functions in `utilities.sh`

## License

WTFPL

[bash]: https://www.gnu.org/software/bash/
