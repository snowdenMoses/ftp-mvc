require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should have_many(:categories).through(:category_products)}
    it { should have_many(:categories).class_name("Category") }
    it { should belong_to(:user).class_name("User") }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:stock) }
  end
end
