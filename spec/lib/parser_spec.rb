require 'spec_helper'

describe Accio::Parser do

  subject { Accio::Parser }

  before :each do
    subject.stub(:config).and_return('')
    subject.stub(:file).and_return(File.new('spec/fixtures/snippets.md', 'r'))
  end

  describe ".read" do
    it "parses two groups" do
      content = subject.read

      expect(content.groups.count).to eq(2)
    end

    it "parses four snippets" do
      content            = subject.read
      first_group_count  = content.groups.first.snippets.count
      second_group_count = content.groups.last.snippets.count
      total_count        = first_group_count + second_group_count

      expect(total_count).to eq(4)
    end

    it "parses one comment" do
      content      = subject.read
      comment_text = content.groups.last.snippets.last.comment.text

      expect(comment_text).to eq("Deletes a whole branch\n")
    end

    context "no config file" do
      it "raises a NoConfigError" do
        subject.unstub(:config)
        subject.unstub(:file)
        File.stub(:join).and_return('xyz')

        expect { subject.read }.to raise_error(subject::NoConfigError)
      end
    end

    context "no snippet file" do
      it "raises a NoSnippetFileError" do
        subject.unstub(:file)

        expect { subject.read }.to raise_error(subject::NoSnippetFileError)
      end
    end
  end
end
