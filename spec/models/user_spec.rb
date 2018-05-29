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

describe 'Validations' do

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

describe '.authenticate_with_credentials' do

  context 'password & email is valid' do
      before {subject.save}
      it 'is valid'do
      expect( User.authenticate_with_credentials(subject.email,subject.password)).to eq(subject)
    end
  end

  context 'password & email is valid' do
      before {subject.save}
      let (:password){Faker::Internet.password}
      it 'is valid'do
      expect( User.authenticate_with_credentials(subject.email,subject.password)).to be nil
    end
  end
end
end










