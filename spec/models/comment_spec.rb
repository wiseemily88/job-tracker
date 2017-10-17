require 'rails_helper'

RSpec.describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        comment = Comment.new()
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        comment = Comment.new(content: "testing")
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to jobs" do
      comment = Comment.new(content: "This is the best job!")
      expect(company).to respond_to(:jobs)
    end
  end
  



end
