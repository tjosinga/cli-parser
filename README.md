# cli-parser

## Description
The cli-parser parse command-line arguments and returns the information. It respects flags/switches, arguments and (quoted) options.

## Usage
```
arguments, options = CliParser.parse(flags, opts, cmd)
```
### Input
- *flags*: An array of flags, like -w -i -s --debug. These are just switches and aren't followed with a value.
- *opts*: An array of options with arguments, like -t --style. These options should be followed with a value.
- *cmd*: A optional string of command-line arguments, like 'arg1 -f -a test arg2'. If none is given ARGV is used.

### Output
- *arguments*: An array of arguments
- *options*: A dict containing all flags and options



## Examples

```
cli_flags = %w(-i -c -t)
cli_options = %w(-s, -a)
arguments, options = CliParse.parse(cli_flags, cli_options)
```

By default it parses the command-line options from ARGV, but the parser also accepts an optional third parameter, which contain all arguments as a string.
```
cmd = '-i arg1 -c -s Test -a "Hello World" arg2'
arguments, options = CliParser.parse(%w(-i -c -t), %w(-s -a), cmd)

puts arguments # ["arg1", "arg2"]
puts options # { '-i' => true, '-c' => true, '-s' => 'Test', 'a' => 'Hello World' }
```
