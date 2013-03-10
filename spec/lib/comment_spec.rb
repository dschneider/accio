require 'spec_helper'

describe Accio::Comment do

  subject { Accio::Comment.new("This is code that does something") }

  describe "#text" do
    it "contains the comment" do
      expect(subject.text).to eq("This is code that does something")
    end
  end

  describe "#add" do
    it "adds text to the comment text" do
      subject.add(" strange")

      expect(subject.text).to eq("This is code that does something strange")
    end
  end
end
