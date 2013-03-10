module Accio
  # Public: Represents a snippet group (e. g. Ruby, Networking, AWS etc.).
  class Group
    attr_accessor :title, :snippets

    # Public: Constructor.
    #
    # title - The title of the group.
    def initialize(title)
      @title    = title
      @snippets = []
    end
  end
end
