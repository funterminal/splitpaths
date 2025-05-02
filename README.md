# splitpaths - Unix Path Component Splitter

## Overview

`splitpaths` is a minimalist Unix shell utility designed to decompose path strings into their individual components. It follows the Unix philosophy of doing one thing well, processing each path argument to output its constituent parts separated by newlines. The tool is implemented as a POSIX-compliant shell script for maximum compatibility across systems.

## Features

- **Path decomposition**: Splits any given path into its individual components
- **POSIX compliance**: Works across all Unix-like systems with a standard shell
- **Stream processing**: Handles multiple paths from command line arguments
- **Empty path handling**: Silently skips empty path strings
- **Delimiter awareness**: Properly handles both absolute and relative paths
- **Pipelines Support**: Supports Good Pipelines support
- 
## Installation

The installation process fetches the script and manpage, then configures your shell environment:

```sh
wget https://raw.githubusercontent.com/funterminal/splitpaths/refs/heads/main/install.sh && \
chmod +x install.sh && \
./install.sh
```

The installer will:
1. Ensure `wget` is available (installing it if necessary)
2. Download the latest version of `splitpaths.sh` and its manpage
3. Make the script executable
4. Set up shell aliases and manpage integration

## Usage

Basic syntax:
```sh
splitpaths path1 [path2 ...]
```

Examples:
```sh
$ splitpaths /usr/local/bin
usr
local
bin

$ splitpaths relative/path/to/file ../parent/directory
relative
path
to
file
..
parent
directory
```

## Design Philosophy

1. **Modularity**: Focuses solely on path splitting without additional features
2. **Composability**: Produces output suitable for piping to other Unix tools
3. **Silence**: No unnecessary output or status messages
4. **Portability**: Uses only POSIX-standard shell features and awk

## Integration

The installer automatically:
- Creates a shell alias for convenient access
- Configures manpage support (view with `man splitpaths`)
- Maintains the original functionality of your system's `man` command

## Dependencies

- POSIX-compliant shell (/bin/sh)
- awk (standard on all Unix systems)
- wget (for installation, will be installed if missing)

## Uninstallation

To remove splitpaths:
1. Remove the alias and man function from your shell configuration file
2. Delete the downloaded `splitpaths.sh` and `splitpaths.1` files

## License

The project is open-source and under GNU GPL v3 or later

## Contributing

Contributions that maintain the tool's simplicity and adherence to Unix principles are welcome. Submit patches or pull requests through the GitHub repository.
