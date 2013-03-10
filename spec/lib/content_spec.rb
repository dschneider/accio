require 'spec_helper'

describe Accio::Content do

  subject { Accio::Content.new }

  let(:group) { Accio::Group.new("Group") }
  let(:snippet) { Accio::Snippet.new("Recursively delete folder") }
  let(:another_snippet) { Accio::Snippet.new("Read Files") }

  before do
    snippet.code.add("puts 1 + 2")
    group.snippets << snippet
    group.snippets << another_snippet
    subject.groups << group
  end

  describe "#search" do
    it "searches for included text" do
      matches = subject.search("Gro")

      expect(matches).to eq([group])
    end

    it "searches case insensitive" do
      matches = subject.search("GROU")

      expect(matches).to eq([group])
    end

    context "subtext is specified" do
      it "searches according to the subtext" do
        matches = subject.search("Gro", "File")

        expect(matches.count).to eq(1)
        expect(matches.first.snippets).to eq([another_snippet])
      end
    end
  end
end
