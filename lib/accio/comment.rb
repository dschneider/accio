module Accio
  # Public: Represents a comment.
  class Comment
    attr_reader :text

    # Public: Constructor.
    #
    # text - The comment text.
    def initialize(text)
      @text = text
    end

    # Public: Adds text to the comment text.
    #
    # text - The comment text.
    def add(text)
      @text << text
    end
  end
end
