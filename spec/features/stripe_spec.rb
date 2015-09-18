require 'spec_helper'

describe "pay with stripe", :js => true do
  it "works without sign in" do
    Capybara.default_wait_time = 10  # TODO: move config to spec_helper
    order = create :order
    page.set_rack_session order: order.id
    page.visit shop_order_path
    click_button 'Pay with Card'
    stripe_iframe = all('iframe[name=stripe_checkout_app]').last
    Capybara.within_frame stripe_iframe do
      fill_in "email", :with => 'user@example.com'
      fill_in "card_number", :with => '4242424242424242'
      fill_in "cc-exp", :with => '11/15'
      fill_in "cc-csc", :with => '123'
      click_button "Pay"
    end
    expect(page).to have_content("Thanks, you paid")
  end
end
