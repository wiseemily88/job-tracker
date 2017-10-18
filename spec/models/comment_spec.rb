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
        company = Company.new(name: "Turing")
        category = Category.new(title: "Web Development")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        comment = Comment.new(content: "testing", job: job)
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to jobs" do
      company = Company.new(name: "Turing")
      category = Category.new(title: "Web Development")
      job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
      comment = Comment.new(content: "This is the best job!", job: job)
      expect(company).to respond_to(:jobs)
    end
  end
end
