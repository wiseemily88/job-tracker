require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
  end

  describe "Class methods" do

    it "top_companies_by_level_of_interest" do
      company_1 = Company.new(name: "Turing")
      company_2 = Company.new(name: "Disney")
      company_3 = Company.new(name: "Amazon")
      category = Category.new(title: "Web Development")
      job_1 = Job.create!(title: "Developer", level_of_interest: 100, city: "Denver", company: company_1, category: category)
      job_2 = Job.create!(title: "Developer", level_of_interest: 10, city: "Denver", company: company_2, category: category)
      job_3 = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company: company_3, category: category)

      expect(Company.top_companies_by_level_of_interest.first.name).to eq("Turing")
    end
  end

end
