require "accio/version"
require "accio"
require "accio/parser"
require "accio/formatter"
require "clipboard"

# Public: Accio is a module that helps to organize and categorize code
# snippets in the terminal.
module Accio
  class << self
    # Public: Rewrites the snip configuration file in the home directory.
    def configure(path)
      File.open(File.join(Dir.home, ".accio"), "w") do |file|
        file.puts path
      end
      puts "Accio was configured successfully"
    end

    # Public: Shows all the groups that are existing in the markdown file.
    def show_groups
      content = Accio::Parser.read
      content.groups.each do |group|
        puts "#{group.title}\n"
      end
    end

    # Public: Shows the code snippets for the specified group and optionally
    # for the specified snippet title.
    def show(group, snippet = nil)
      content = Accio::Parser.read
      matches = content.search(group, snippet)
      matches.each do |match|
        match.snippets.each do |submatch|
          # Format the output and display it.
          Accio::Formatter.template(
            match.title, submatch.title, submatch.comment, submatch.code
          )
        end
      end
    end

    # Public: Searches code snippets for a specified group and optionally for a
    # specified snippet title and copies the last found code snippet to the
    # clipboard.
    def copy(group, snippet = nil)
      content = Accio::Parser.read
      matches = content.search(group, snippet)
      matches.each do |match|
        match.snippets.each do |submatch|
          # Copy code to clipboard.
          Clipboard.copy submatch.code.text.gsub(/^$\n/, '')

          # Format the output and display it.
          Accio::Formatter.template(
            match.title, submatch.title, submatch.comment, submatch.code
          )
        end
      end
      puts "The last found code snippet has been copied to the clipboard"
    end
  end
end
