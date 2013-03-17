# Accio - A command line code snippet manager

With **Accio** it's possible to categorize and organize snippets in a
markdown file. The snippets can then be searched and used via the terminal.

## Installation

```
gem install accio
```

## Usage

Create a **snippets.md** file in a folder and configure accio with the following
command (you must point to the folder relative to your home directory):

```
# Or wherever you wish to have the snippets.md file
accio configure "Dropbox/Accio"
```

Show all snippet groups:

```
$ accio groups
Ruby
Erlang
Clojure
Haskell
Amazon Web Services
...
```

Show commands for a specific group or snippet:

```
$ accio show Ruby [Files]
Ruby
  Read Files
    CODE_SNIPPET
...
```

Copy a snippet to clipboard:

```
$ accio copy Ruby [Files]
Ruby
  Read Files
    CODE_SNIPPET
...
```

There are shortcuts like `accio c Ruby ...` and `accio s Ruby` for copy and show.


## Example Snippet File (snippets.md)

An example snippet file can be found in the spec/fixtures folder.

## Code Status

[![Build Status](https://travis-ci.org/dschneider/accio.png)](https://travis-ci.org/dschneider/accio)
[![Code Climate](https://codeclimate.com/github/dschneider/accio.png)](https://codeclimate.com/github/dschneider/accio)
