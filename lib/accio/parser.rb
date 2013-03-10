require 'accio/content'
require 'accio/group'
require 'accio/snippet'

module Accio
  # Public: The snippet parser module is responsible for parsing markdown based
  # snippet documents.
  module Parser

    class NoConfigError < StandardError; end
    class NoSnippetFileError < StandardError; end

    class << self
      # Public: Reads the snippet markdown file, parses the codelines and
      # collects groups and snippets.
      #
      # Returns a Content object.
      def read
        content   = Accio::Content.new
        code_area = false

        while (line = file.gets)
          header_count = line.count("#")

          # Whenever a code area starts we flip this code_area.
          if line.count("`") == 3
            code_area = !code_area
          end

          # If markdown header character found and not a code group.
          if header_count == 1 && code_area == false
            # Main Group. Sets the group globally so that snippets get
            # associated with this group.
            group = Accio::Group.new(parse_headline(line))
            content.groups << group
          elsif header_count == 2 && code_area == false
            # Snippet.
            snippet = Accio::Snippet.new(parse_headline(line))
            group.snippets << snippet
          else
            # Code text or comments.
            if snippet
              if line.count("*") == 4
                snippet.comment.add(parse_comment(line))
              else
                unless line.length < 2 || line == "\n"
                  snippet.code.add(parse_code(line))
                end
              end
            end
          end
        end
        file.close
        content
      end

      private

      # Public: Parse headline. Remove hashtags, line breaks and the first
      # space.
      #
      # line - The read line.
      #
      # Returns the text line.
      def parse_headline(line)
        line.gsub("#", "").gsub("\n", "").sub(" ", "")
      end

      # Public: Parse code area.
      #
      # line - The read line.
      #
      # Returns the text line.
      def parse_code(line)
        line.gsub("```", "")
      end

      # Public: Parse comment area.
      #
      # line - The read line.
      #
      # Returns the text line.
      def parse_comment(line)
        line.gsub("**", "")
      end

      # Public: Loads the config file.
      #
      # Returns a String path.
      def config
        return @config if @config

        config_path = File.join(Dir.home, ".accio")

        unless File.exists?(config_path)
          raise NoConfigError, "Please run accio configure to create a config"
        end

        @config ||= File.new(config_path, "r").gets
      end

      # Public: Loads the snippet file.
      #
      # Returns a File object.
      def file
        return @file if @file

        snippet_path = File.join(Dir.home, config.gsub("\n", ""), "snippets.md")

        unless File.exists?(snippet_path)
          raise NoSnippetFileError, "Please create a snippet file"
        end

        @file ||= File.new(snippet_path, "r")
      end
    end
  end
end
