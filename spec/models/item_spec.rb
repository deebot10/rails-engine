require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it {should belong_to :merchant}
    it {should have_many :invoice_items}
    it {should have_many(:invoices).through(:invoice_items)}
    # it {should have_many(:transactions).through(:invoices)}
    # it {should have_many(:customers).through(:invoices)}
  end

  describe 'validations' do
    # it { should define_enum_for(:enabled).with([:enabled, :disabled]) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:unit_price) }
  end  
end
