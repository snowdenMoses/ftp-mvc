require 'rails_helper'

RSpec.describe PersonalDetail, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:date_of_birth) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:phone_number) }
  end
end
