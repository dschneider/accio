module Accio
  # Public: Represents a code snippet.
  class Code
    attr_reader :text

    # Public: Constructor.
    #
    # text - The code text.
    def initialize(text)
      @text = text
    end

    # Public: Adds text to the code text.
    #
    # text - The code text.
    def add(text)
      @text << text
    end
  end
end
