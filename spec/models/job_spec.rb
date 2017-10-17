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
<<<<<<< HEAD
      it "is valid with a title, level of interest, company, and category" do
        company = Company.new(name: "Turing")
        category = Category.new(title: "Web Development")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
=======
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company)
>>>>>>> contacts
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
<<<<<<< HEAD
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
=======
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
>>>>>>> contacts
  end
end
