require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'associations' do
    it { should have_many(:user_roles).class_name('UserRole') }
    it { should have_many(:users).through(:user_roles) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
