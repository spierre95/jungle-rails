require 'rails_helper'
require_relative '../../app/models/product.rb'

RSpec.describe Product, type: :model do
  new_category = Category.new name:'shoes'
  let (:name){'shoes'}
  let (:price) {1000000}
  let (:quantity) {17}
  let (:category){new_category}
  subject {Product.new name: name, price:price, quantity:quantity, category:category}

context 'name is blank' do
    let(:name) { nil }
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

context 'price is blank' do
    let(:price) { nil }
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

context 'quantity is blank' do
    let(:quantity) { nil }
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

context 'category is blank' do
    let(:category) { nil }
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end


#   it 'requires a price'
#     subject.price = nil
#     expect(subject).to be_valid
#     expect(subject.errors.messages[:price]).to include("can't be blank")
# end
end

# RSpec.describe Bunny, type: :model do
#   let(:name) { 'Good Bunny' }
#   let(:image_url) { 'https://i.ytimg.com/vi/kYnx7nPw-xo/maxresdefault.jpg' }
#   subject { Bunny.new name: name, image_url: image_url }

#   it 'is valid with name and valid image url' do
#     expect(subject).to be_valid
#   end

#   context 'name is blank' do
#     let(:name) { nil }

#     it 'is not valid' do
#       # subject.name = nil
#       expect(subject).not_to be_valid
#     end

#     it 'reports an error' do
#       expect(subject.errors.messages[:name]).to include("can't be blank")
#     end
#   end


#   it 'requires an image_url' do
#     subject.image_url = nil
#     expect(subject).not_to be_valid
#     expect(subject.errors.messages[:image_url]).to include("can't be blank")

#   end

#   it 'requires the image_url to be a valid url' do
#     subject.image_url = 'Not an image url'
#     expect(subject).not_to be_valid
#     expect(subject.errors.messages[:image_url]).to include('Image url must be valid http image url (ending in png, jpg, jpeg, bmp, svg, gif, tiff)')
#   end
# end