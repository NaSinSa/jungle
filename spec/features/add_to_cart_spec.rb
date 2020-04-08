require 'rails_helper'

RSpec.feature "Visitor adds and item to the cart", type: :feature do
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end
  
  scenario "They see an updated item number in the cart" do
    # ACT
    visit root_path
    click_on 'Add'
  
    # DEBUG
    # save_screenshot
  
    # VERIFY
    expect(page).to have_content 'My Cart (1)'
    # puts page.html
  end
end
