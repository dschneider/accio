require 'accio/code'
require 'accio/comment'

module Accio
  # Public: Represents a snippet (e. g. Read Files, Establish SSH Connection
  # etc.). A snippet consists of a title, a code part and optionally of a
  # comment.
  class Snippet
    attr_accessor :title, :code, :comment

    # Public: Constructor.
    #
    # title   - The title of the snippet.
    # code    - The associated code.
    # comment - The associated comment.
    def initialize(title, code = "", comment = "")
      @title   = title
      @code    = Code.new(code)
      @comment = Comment.new(comment)
    end
  end
end
