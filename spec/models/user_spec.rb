require 'rails_helper'

RSpec.describe User, type: :model do
  subject = User.new(name: 'Test', password: '123456', email: 'test@test.com', mobile_number: 23343200, gender: 'male', date_of_birth: '1980-02-12')

  context "validations" do
    it "is valid with all attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.encrypted_password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a gender" do
      subject.gender = nil
      expect(subject).to_not be_valid
    end

    it "is not valid when age is below 13" do
      subject.date_of_birth = 2019-02-12
      expect(subject).to_not be_valid 
    end

    it "is not valid without a mobile_number" do
      subject.mobile_number = nil
      expect(subject).to_not be_valid 
    end
  end
end
