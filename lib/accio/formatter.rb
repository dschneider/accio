require 'term/ansicolor'
require 'terminal-table'

module Accio
  # Public: Formats the snippet output for the terminal.
  module Formatter
    COLOR = Term::ANSIColor

    class << self
      # Public: Colorizes the title of a group.
      #
      # Returns a colorized String.
      def print_group_title(title)
        COLOR.send(:red, title)
      end

      # Public: Colorizes the title of a snippet.
      #
      # Returns a colorized String.
      def print_snippet_title(title)
        COLOR.send(:blue, title)
      end

      # Public: Colorizes a code snippet.
      #
      # Returns a colorized String.
      def print_code(snippet)
        COLOR.send(:green, snippet)
      end

      # Public: Colorizes a code comment.
      #
      # Returns a colorized String.
      def print_comment(comment)
        COLOR.send(:yellow, comment)
      end

      # Public: Prints a table with group title, snippet title, comment and
      # code.
      def template(group_title, snippet_title, comment, code)
        rows = []
        rows << [print_group_title(group_title)]
        rows << :separator
        rows << [print_snippet_title(snippet_title)]
        unless comment.text.length == 0
          rows << :separator
          rows << [print_comment(comment.text)]
        end

        puts Terminal::Table.new(rows: rows)
        puts print_code(code.text)
      end
    end
  end
end
