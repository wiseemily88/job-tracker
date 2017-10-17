require 'rails_helper'

RSpec.describe Contact do

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full name" do
        company = Company.new(name: "Turing")
        contact = Contact.new(position: "Sales Manager", email: "jane@gmail.com", company: company)
        expect(contact).to be_invalid
      end

      it "it is invalid without a position" do
        company = Company.new(name: "Turing")
        contact = Contact.new(full_name: "Jane", email: "jane@gmail.com", company: company)
        expect(contact).to be_invalid
      end

      it "it is invalid without an email" do
        company = Company.new(name: "Turing")
        contact = Contact.new(full_name: "Jane", position: "Sales Manager", company: company)
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a Full_name, position, and email" do
        company = Company.new(name: "Turing")
        contact = Contact.new(full_name: "Jane", position: "Sales Manager",email: "Jane@gamil.com", company: company)
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      company = Company.new(name: "Dropbox")
      contact = Contact.new(full_name: "Jane", position: "Sales Manager",email: "Jane@gamil.com", company: company)
      expect(contact).to respond_to(:company)
    end
  end


end
