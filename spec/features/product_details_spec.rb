require 'rails_helper'

RSpec.feature "Visitor clicks a product", type: :feature, js: true do
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
  
  scenario "They see all products" do
    # ACT
    visit root_path
    click_on 'Details'
  
    # DEBUG
    save_screenshot
  
    # VERIFY
    expect(page).to have_content 'Apparel'
    puts page.html
  end
end
