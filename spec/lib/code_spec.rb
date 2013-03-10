require 'spec_helper'

describe Accio::Code do

  subject { Accio::Code.new("puts 'yes'") }

  describe "#text" do
    it "contains the code" do
      expect(subject.text).to eq("puts 'yes'")
    end
  end

  describe "#add" do
    it "adds text to the code text" do
      subject.add(" if true")

      expect(subject.text).to eq("puts 'yes' if true")
    end
  end
end
