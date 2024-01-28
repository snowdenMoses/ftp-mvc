require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should have_many(:category_products).class_name('CategoryProduct') }
    it { should have_many(:products).through(:category_products) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
