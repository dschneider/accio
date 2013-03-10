require 'spec_helper'

describe Accio::Group do

  subject { Accio::Group.new("Group") }

  let(:snippet) { Accio::Snippet.new("Recursively delete folder") }

  before do
    subject.snippets << snippet
  end

  describe "snippets" do
    it "contains the snippet" do
      expect(subject.snippets).to include(snippet)
    end
  end
end
