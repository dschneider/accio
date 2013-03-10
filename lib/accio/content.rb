module Accio
  # Public: Represents the content of a snippet file.
  class Content
    attr_accessor :groups

    # Public: Constructor.
    def initialize
      @groups = []
    end

    # Public: Search the groups and snippets for a specific text match.
    #
    # text    - The text for main group titles to search for.
    # subtext - The subtext for snippet titles to search for.
    #
    # Returns Array of Group matches with Snippet matches.
    def search(text, subtext = nil)
      matches  = []
      snippets = []
      @groups.each do |group|
        if group.title.downcase.include?(text.downcase)
          # Search for matches in the snippets if a subtext is given.
          if subtext
            snippets = snippets | search_snippets(group, subtext)

            # Reallocate the found snippets.
            group.snippets = snippets
          end

          matches << group
        end
      end
      matches
    end

    private

    # Internal: Search the snippets for a specific text match.
    #
    # group - The parent group that includes all the snippets.
    # text  - The text for snippet titles to search for.
    #
    # Returns Array of snippet matches.
    def search_snippets(group, text)
      matches = []
      group.snippets.each do |snippet|
        # Only include the snippet if the text is found in the title.
        if snippet.title.downcase.include?(text.downcase)
          matches << snippet
        end
      end
      matches
    end
  end
end
