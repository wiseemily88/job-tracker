require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, company, and category" do
        company = Company.new(name: "Turing")
        category = Category.new(title: "Web Development")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      company = Company.new(name: "Turing")
      category = Category.new(title: "Web Development")
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", company: company, category: category)
      expect(job).to respond_to(:company)
    end

    it "belongs to a category" do
      company = Company.new(name: "Turing")
      category = Category.new(title: "Web Development")
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", company: company, category: category)
      expect(job).to respond_to(:category)
    end
  end

  describe "Class methods" do

    it "by_level_of_interest" do
      company = Company.new(name: "Turing")
      category = Category.new(title: "Web Development")
      job_1 = Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
      job_2 = Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
      job_3 = Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)

      expect(Job.by_level_of_interest.values).to eq([3])
    end

    it "by_location" do
      company = Company.new(name: "Turing")
      category = Category.new(title: "Web Development")
      job_1 = Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
      job_2 = Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
      job_3 = Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)

      expect(Job.by_location.keys).to eq(["Denver"])
    end
  end
end
