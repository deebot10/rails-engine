require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'relationships' do
    it {should belong_to(:invoice)}
    it {should have_many(:customers).through(:invoice)}
  end

  describe 'validations' do
    it { should define_enum_for(:result).with([:success, :failed]) }
    it {should validate_presence_of(:credit_card_number) }
  end
end
