require 'rails_helper'

RSpec.describe CategoryProduct, type: :model do
  describe 'associations' do
    it { should belong_to(:product).class_name('Product') }
    it { should belong_to(:category).class_name('Category') }
  end

end
