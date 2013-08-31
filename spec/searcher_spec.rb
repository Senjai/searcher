require 'spec_helper'

describe Searcher do
  let(:search_results) { subject }
  let(:first_result) { subject.first }

  context "habtm label search" do
    subject { Ticket.search("tag:bug") }
    it "finds a ticket" do
      first_result.description.should eql("Hello world! You are awesome.")
    end
  end

  context "belongs_to label search" do
    subject { Ticket.search("state:Open") }
    it "finds a ticket" do
      first_result.description.should eql("Hello world! You are awesome.")
    end
  end

  context "undefined label search" do
    subject { Ticket.search("undefined:true") }
    it "returns all the records" do
      search_results.to_a.should eql(Ticket.all.to_a)
    end
  end
end
