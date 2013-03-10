require 'spec_helper'

describe Accio::Snippet do

  subject { Accio::Snippet.new("Do arithmetics", "1 + 1", "Addition") }

  describe "#title" do
    it "holds a code object" do
      expect(subject.title).to eq("Do arithmetics")
    end
  end

  describe "#code" do
    it "holds a code object" do
      expect(subject.code).to be_a(Accio::Code)
    end
  end

  describe "#comment" do
    it "holds a comment object" do
      expect(subject.comment).to be_a(Accio::Comment)
    end
  end
end
