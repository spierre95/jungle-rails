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
end
