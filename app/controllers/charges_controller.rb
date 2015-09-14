class ChargesController < ApplicationController
  def new
  end

  def create
    @order = Order.find( session[:order] )
    @amount = @order.total_price

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@amount*100).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
