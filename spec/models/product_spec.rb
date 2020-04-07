require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    @category = Category.new(:name => 'cat')
    before do
      @product = Product.new(:name => 'namename',
                            :price => 10000,
                            :quantity => 10,
                            :category_id => 1)
    end

    it 'is valid with valid attributes' do
      product = @product
      expect(product).to be_valid
    end
    
    it 'is not valid without a name' do
      product = @product
      product.name = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages.first).to eq "Name can't be blank"
    end
    
    it 'is not valid without a price' do
      product = @product
      product.price_cents = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages[2]).to eq "Price can't be blank"
    end
    
    it 'is not valid without a quantity' do
      product = @product
      product.quantity = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages.first).to eq "Quantity can't be blank"
    end

    it 'is not valid without a category' do
      product = @product
      product.category_id = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages.first).to eq "Category can't be blank"
    end

  end
end
