class PaymentsController < ApplicationController
  def new
  end

  def create
    # Set the secret key to authorize Stripe API requests
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    # Create a Stripe Checkout session
    session = Stripe::Checkout::Session.create({
                                                 payment_method_types: ['card'],
                                                 line_items: [{
                                                                price_data: {
                                                                  currency: 'usd',
                                                                  product_data: {
                                                                    name: 'Football Square'
                                                                  },
                                                                  unit_amount: 1000, # e.g., $10.00 (amount in cents)
                                                                },
                                                                quantity: 1
                                                              }],
                                                 mode: 'payment',
                                                 success_url: success_payments_url + "?session_id={CHECKOUT_SESSION_ID}",
                                                 cancel_url: cancel_payments_url
                                               })

    # Redirect the user to the Stripe-hosted Checkout page
    redirect_to session.url, allow_other_host: true
  end

  def success
  end

  def cancel
  end
end
