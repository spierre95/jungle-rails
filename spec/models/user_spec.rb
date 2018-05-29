require 'rails_helper'
require_relative '../../app/models/user.rb'


RSpec.describe User, type: :model do
  generate_password = Faker::Internet.password
  let (:first_name){Faker::Name.first_name}
  let (:last_name) {Faker::Name.last_name}
  let (:email) {Faker::Internet.email}
  let (:password) {generate_password}
  let (:password_confirmation) {generate_password}

  subject { User.new first_name:first_name,
    last_name:last_name,
    email:email,
    password:password,
    password_confirmation:password_confirmation
  }

 context 'first_name is blank' do
    let(:first_name) { nil }
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

context 'last_name is blank' do
    let(:last_name) { nil }
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

context 'email is blank' do
    let(:email) { nil }
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

context 'password is blank' do
    let(:password) { nil }
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

context 'password_confirmation is blank' do
    let(:password) { nil }
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

context 'passsword is different than password_confirmation'do
  let (:password){'yourSecret'}
  let (:password_confirmation){'safeWithMe'}
   it 'is not valid' do
    expect(subject).not_to be_valid
   end
end

context 'password too short' do
  let (:password){'123'}
  it 'is not valid' do
    expect(subject).not_to be_valid
   end
end

context 'email is unique' do
  User.all.include?(:email)
  it 'is valid' do
    expect(subject).to be_valid
  end
end

end


# context 'name is blank' do
#     let(:name) { nil }
#     it 'is not valid' do
#       expect(subject).not_to be_valid
#     end
#   end

# context 'price is blank' do
#     let(:price) { nil }
#     it 'is not valid' do
#       expect(subject).not_to be_valid
#     end
#   end

# context 'quantity is blank' do
#     let(:quantity) { nil }
#     it 'is not valid' do
#       expect(subject).not_to be_valid
#     end
#   end

# context 'category is blank' do
#     let(:category) { nil }
#     it 'is not valid' do
#       expect(subject).not_to be_valid
#     end
#   end