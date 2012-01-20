# service

`service` lets you invoke Mac OS X's Services from the command-line. In a sense, it is the opposite of [ThisService,](http://wafflesoftware.net/thisservice/) which lets you use command-line tools as services.

## Installation

You need to have [MacRuby](http://www.macruby.org/) installed to use `service`.

Download the repository, `cd` into the directory and do `rake` then `rake install`. You might need to `sudo` to install, which will require you to be an administrator. You can do `rake clean` if you want.

If you want to get rid of `service` for some reason, just do `rake uninstall`.

## Usage

	service [-q|--quiet] <service-name> [<string>]

`service` applies `service-name` to `string`, or to the contents of STDIN if no string is given. The name of the service must be provided exactly as it appears in the Services menu, including capitalisation.

By default, `service` will output the result of the Service. For services that do not appear to produce output, this will usually be the same as their input. To suppress this output, use the `-q` option.

## Examples

If you have a text document which you want to summarise automatically with the (somewht painful) SummaryService application:

	< file.txt service Summarize


