require 'rails_helper'

RSpec.describe UserRole, type: :model do
  describe 'associations' do
    it { should belong_to(:role).class_name('Role') }
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:role_id) }
    it { should validate_presence_of(:user_id) }
  end
end
