require 'spec_helper'

describe "show Stripe checkout", :js => true do
  before do
    clerk = sign_in
    create :order, :email => clerk.email
    visit shop_order_path
    click_button 'Pay with Card'
    stripe_iframe = all('iframe[name=stripe_checkout_app]').last
    Capybara.within_frame stripe_iframe do
      fill_in "email", :with => 'user@example.com'
      fill_in "card_number", :with => '4242424242424242'
      fill_in "cc-exp", :with => '11/15'
      fill_in "cc-csc", :with => '123'
      click_button "Pay"
      Capybara.default_wait_time = 10
    end
    end
  it "pays" do
    expect(page).to have_content("Thanks, you paid")
  end
end